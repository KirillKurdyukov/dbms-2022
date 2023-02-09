create function ExtendReservation(
    UserId integer,
    Pass text,
    FlightId integer,
    SeatNo varchar(4)
) returns bool
    language plpgsql
as
$extend_reservation$
declare
    SId integer   = getSeatIdByFIdAndSNo(ExtendReservation.FlightId, SeatNo);
    Now timestamp = now();
begin
    if (checkUser(UserId, Pass)
        and SId is not null and isPlaneActual(FlightId, Now))
    then
        update Reserved
        set ReservedTime = Now + interval '3 day'
        where Reserved.FlightId = ExtendReservation.FlightId
          and Reserved.SeatId = SId
          and Reserved.UserId = ExtendReservation.UserId
          and Reserved.ReservedTime > Now
          and not Reserved.IsBuy;

        return found;
    end if;
    return false;
end
$extend_reservation$