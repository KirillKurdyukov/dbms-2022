call insertuser('Ilya Lol', '12345');

call insertuser('Kirill Kurdyukov', '123qweqwe');

call insertuser('Yandex', 'No many');

insert into Planes (planeid, model)
values (1, 'Tu'),
       (2, 'Su');

insert into Flights (FlightId, FlightTime, PlaneId)
values (1, timestamp '2023-03-01 12:00:00', 1),
       (2, timestamp '2023-03-01 14:00:00', 1),
       (3, timestamp '2023-03-01 16:00:00', 2),
       (4, timestamp '2023-03-01 18:00:00', 2);

insert into Seats(Planeid, SeatNo)
values (1, 'A123'),
       (1, 'A124'),
       (1, 'A125'),
       (2, 'B123'),
       (2, 'B124'),
       (2, 'B125');

