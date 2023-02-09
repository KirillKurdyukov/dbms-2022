create function BuyReserved(
    UserId integer,
    Pass text,
    FlightId integer,
    SeatNo varchar(4)
) returns bool
    language plpgsql
as
$buy_reserved$
declare
    SId integer   = getSeatIdByFIdAndSNo(FlightId, SeatNo);
    Now timestamp = now();
begin
    if (SId is not null
        and isPlaneActual(FlightId, Now)
        and checkUser(UserId, Pass))
    then
        update Reserved set IsBuy = true
        where Reserved.FlightId = BuyReserved.FlightId
          and Reserved.SeatId = SId
          and Reserved.UserId = BuyReserved.UserId
          and Reserved.ReservedTime > Now
          and not Reserved.IsBuy;

        return found;
    end if;
    return false;
end;
$buy_reserved$