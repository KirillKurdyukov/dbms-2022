create function Reserve(
    UserId integer,
    Pass text,
    FlightId integer,
    SeatNo varchar(4)
) returns bool
    language plpgsql
as
$reserve$
declare
    SeatId integer   = getSeatIdByFIdAndSNo(FlightId, SeatNo);
    Now    timestamp = now();
begin
    if (SeatId is null or not isPlaneActual(FlightId, Now)) then
        return false;
    end if;

    if (checkUser(UserId, Pass)
        and not checkReservedOrBoughtSeat(FlightId, SeatNo, Now))
    then
        insert into Reserved(Flightid, SeatId, UserId) -- TODO upsert
        values (FlightId, SeatId, UserId);
        return true;
    else
        return false;
    end if;
end
$reserve$