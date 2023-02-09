create function BuyFree(
    FlightId integer,
    SeatNo varchar(4)
) returns bool
    language plpgsql
as
$buy_free$
declare
    SId integer   = getSeatIdByFIdAndSNo(FlightId, SeatNo);
    Now timestamp = now();
begin
    if (isPlaneActual(FlightId, Now)
        and SId is not null
        and not checkReservedOrBoughtSeat(FlightId, SeatNo, Now))
    then
        insert into Reserved (FlightId, SeatId, UserId, ReservedTime, IsBuy)
        values (FlightId, SId, null, Now, true);
        return true;
    end if;
    return false;
end
$buy_free$