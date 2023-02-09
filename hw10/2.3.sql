start transaction isolation level read committed read write;

-- Если происходит бронь.
select * from Reserve(:UserId, :Pass, :FlightId, :SeatNo);

-- Если происходить продление брони
select * from ExtendReservation(:UserId, :Pass, :FlightId, :SeatNo);

-- Если происходит анонимная покупка
select * from BuyFree(:Flightid, :SeatNo)

-- Если происходит покупка брони
select * from BuyReserved(:UserId, :Pass, :FlightId, :SeatNo);

commit;