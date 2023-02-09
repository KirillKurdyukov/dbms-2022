start transaction isolation level read committed read only;
select SeatNo from FreeSeats(:FlightId);
commit;