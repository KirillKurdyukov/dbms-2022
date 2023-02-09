alter table groups
    add constraint group_id_unique unique (group_id);

alter table students
    add foreign key (group_id) references groups (group_id);