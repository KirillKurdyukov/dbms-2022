create extension if not exists pgcrypto;

-- Хранение пользователей
create table Users
(
    UserId         integer generated always as identity,
    UserName       varchar(50) not null,
    PasswordCrypto text        not null,

    primary key (UserId)
);

-- Таблица для того, чтобы связать PlaneId.
-- В запросах не используется
create table Planes
(
    PlaneId integer,
    Model   varchar(40) not null,

    primary key (PlaneId)
);


-- Сидения в самолете
create table Seats
(
    SeatId  integer generated always as identity,
    PlaneId integer    not null,
    SeatNo  varchar(4) not null,

    primary key (SeatId),

    unique (PlaneId, SeatNo),

    foreign key (PlaneId) references Planes (PlaneId)
);

-- Перелеты
create table Flights
(
    FlightId   integer,
    FlightTime timestamp not null,
    PlaneId    integer   not null,

    primary key (FlightId),

    foreign key (PlaneId) references Planes (PlaneId)
);

-- Зарезервированный билет или купленный
create table Reserved
(
    FlightId     integer not null,
    SeatId       integer not null,
    UserId       integer,
    ReservedTime timestamp        default now() + interval '3 day',
    IsBuy        bool    not null default false,

    primary key (FlightId, SeatId),

    foreign key (FlightId) references Flights (FlightId),
    foreign key (SeatId) references Seats (SeatId),
    foreign key (UserId) references Users (UserID)
);

-- Сохранение пользователя
create procedure insertUser(
    name varchar(50),
    Password text
)
    language plpgsql
as
$insert_user$
begin
    insert into Users (UserName, PasswordCrypto)
    values (name, crypt(Password, gen_salt('bf')));
end
$insert_user$;

-- Проверка пароля по пользователю
create function checkUser(
    UserId integer,
    Password text
) returns bool
    language plpgsql
as
$check_user$
begin
    return exists(select *
                  from Users
                  where Users.UserId = checkUser.UserId
                    and PasswordCrypto = crypt(Password, PasswordCrypto));
end;
$check_user$;

-- Получение SeatId, если нет то null.
create function getSeatIdByFIdAndSNo(
    FlightId int,
    SeatNo varchar(4)
) returns integer
    language plpgsql
as
$get_seat_id_by_flight_id_seat_no$
begin
    return (select SeatId
            from Flights
                     natural join Seats
            where Flights.FlightId = getSeatIdByFIdAndSNo.FlightId
              and Seats.SeatNo = getSeatIdByFIdAndSNo.SeatNo);
end
$get_seat_id_by_flight_id_seat_no$;

-- Проверка, что в такой авиаперевозке место забронировано
create function checkReservedOrBoughtSeat(
    FlightId int,
    SeatNo varchar(4),
    Now timestamp
) returns bool
    language plpgsql
as
$check_reserved_seats$
begin
    return exists(
            select *
            from Reserved
                     natural join Seats
            where Reserved.FlightId = checkReservedOrBoughtSeat.FlightId
              and Seats.SeatNo = checkReservedOrBoughtSeat.SeatNo
              and (Reserved.ReservedTime > Now or Reserved.IsBuy)
        );
end;
$check_reserved_seats$;

-- Проверка что самолет не улетел
create function isPlaneActual(
    FlightId int,
    Now timestamp
) returns bool
    language plpgsql
as
$is_plane_actual$
begin
    return (
            Now < (select FlightTime
                   from Flights
                   where Flights.FlightId = isPlaneActual.FlightId)
        );
end;
$is_plane_actual$;
