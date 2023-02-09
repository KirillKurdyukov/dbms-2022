create function FlightStat(
    UserId integer,
    Pass text,
    FlightId integer
)
    returns Table
            (
                FreeSeats        bigint,
                ReservedSeats    bigint,
                SoldSeats        bigint,
                AvailableReserve bool,
                AvailableBuy     bool
            )
    language plpgsql
as
$flights_statitstics$
declare
    Now timestamp = now();
begin
    if (not checkUser(UserId, Pass))
    then
        return;
    end if;

    return query
        select (select count(*)
                from FreeSeats(Flights.FlightId))                                  as FreeSeats,
               (select count(*)
                from Reserved
                where Reserved.FlightId = Flights.FlightId
                  and not Reserved.IsBuy
                  and Reserved.ReservedTime > Now)                                 as ReservedSeats,
               (select count(*)
                from Reserved
                where Reserved.FlightId = Flights.flightid
                  and Reserved.IsBuy)                                              as SoldSeats,
               (select count(*)
                from FreeSeats(Flights.FlightId)) > 0                              as AvailableReserve,
               (select count(*)
                from FreeSeats(Flights.FlightId)) + (select count(*)
                                                     from Reserved
                                                     where Reserved.FlightId = Flights.FlightId
                                                       and Reserved.UserId = FlightStat.UserId
                                                       and Reserved.ReservedTime > Now
                                                       and not Reserved.IsBuy) > 0 as AvailableBuy
        from Flights
        where Flights.FlightId = FlightStat.FlightId;
end;
$flights_statitstics$