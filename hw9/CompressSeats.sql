create procedure CompressSeats(
    FlightId integer
)
    language plpgsql
as
$compress_seats$
declare
    Now  timestamp = now();
    UId  integer;
    RT   timestamp;
    IB   bool;
    CursorSoldSeats cursor for select Reserved.UserId, Reserved.ReservedTime, Reserved.IsBuy
                               from Reserved
                               where Reserved.FlightId = CompressSeats.FlightId
                                 and Reserved.IsBuy;
    CursorReservedSeats cursor for select Reserved.UserId, Reserved.ReservedTime, Reserved.IsBuy
                                   from Reserved
                                   where Reserved.FlightId = CompressSeats.FlightId
                                     and ReservedTime > Now
                                     and not Reserved.IsBuy;
    Seat integer;
begin
    open CursorSoldSeats;
    open CursorReservedSeats;

    create temporary table TempSeats
    (
        FlightId     integer not null,
        SeatId       integer not null,
        UserId       integer,
        ReservedTime timestamp,
        IsBuy        bool
    ) on commit drop;

    for Seat in (select SeatId
                 from Flights
                          natural join Seats
                 where Flights.FlightId = CompressSeats.FlightId
                 order by SeatNo)
        loop
            fetch CursorSoldSeats into UId, RT, IB;

            if (not found)
            then
                fetch CursorReservedSeats into UId, RT, IB;

                if (not found)
                then
                    delete
                    from Reserved
                    where Reserved.FlightId = CompressSeats.FlightId;

                    insert into Reserved(FlightId, SeatId, UserId, ReservedTime, IsBuy)
                    select *
                    from TempSeats;

                    return;
                end if;
            end if;

            insert into TempSeats(FlightId, SeatId, UserId, ReservedTime, IsBuy)
            values (CompressSeats.FlightId, Seat, UId, RT, IB);

        end loop;

        delete
        from Reserved
        where Reserved.FlightId = CompressSeats.FlightId;

        insert into Reserved(FlightId, SeatId, UserId, ReservedTime, IsBuy)
        select *
        from TempSeats;
end
$compress_seats$;