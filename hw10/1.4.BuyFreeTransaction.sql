start transaction isolation level read committed read write;
-- Параллельно исполняются только процедуры, как было сказано на практике.
-- Проверка пользователя происходит атомарно.
-- Как и получение айдишника SeatId.
-- Косая запись и неповторяемое чтение нам не грозит, так как никакие данные не обновляются.
-- При гонке бронирования одного и того же места может возникнуть фантомная запись.
-- Когда обе параллельные транзакции пройдут условия и начнут выполнять insert.
-- В таком случае таблица останется в консистетном состоянии.
-- Но один из пользователей получит exception, о том что запись с таким PK уже есть.
-- Если мы готовы интерпретировать raise -> false, то можно понизить уровень изоляции.
-- Грязное чтение для нас является проблемой, ибо можем иметь данные, которые позже откатятся.
-- Итого read committed.
