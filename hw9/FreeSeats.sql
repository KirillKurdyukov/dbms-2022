create function FreeSeats(FlightId integer)
    returns Table
            (
                SeatNo varchar(4)
            )
    language plpgsql
as
$free_seats$
    # variable_conflict use_column
declare
    Now timestamp = now();
begin
    if (isPlaneActual(FlightId, Now))
    then
        return query
            select SeatNo
            from Flights
                     natural join Seats
            where Flights.Flightid = FreeSeats.FlightId
            except
            select SeatNo
            from Flights
                     natural join Seats
            where FlightId = FreeSeats.FlightId
              and checkReservedOrBoughtSeat(FreeSeats.FlightId, Seats.SeatNo, Now);
    else
        return;
    end if;
end
$free_seats$;
