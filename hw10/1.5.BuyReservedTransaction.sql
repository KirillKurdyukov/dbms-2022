start transaction isolation level read committed read write;
-- Параллельно исполняются только процедуры, как было сказано на практике.
-- Косая запись не грозит, так как инвариант в системе отсутствует.
-- Фантомная запись и неповторяемое чтение отсутствует,
-- так как идет три атомарных чтения разных таблиц
-- и один атомарный update с корректными условиями на покупку.
-- грязные данные до сих проблема, чтобы не продлить бронь
-- у записи, которая в дальнейшем будет откачена.
