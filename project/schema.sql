-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
CREATE DATABASE `lab-database`;

-- test table
CREATE TABLE `test`
(
    `id`   INT NOT NULL
    `name` TEXT NOT NULL,
    `cost` INT NOT NULL,
    PRIMARY KEY (`id`)
);

-- patient table
create table `patient`
(
    `id`         int         not null,
    `conditions` text        not null,
    `sex`        varchar(20) not null,
    `age`        int         not null,
    `first_name` varchar(40) not null,
    `last_name`  varchar(40) not null,
    primary key (`id`)
);

-- patient_id index
create index `patient_id_index`
    on `patient` (`id`);



-- receipt table
create table `receipt`
(
    `cost`           int      not null,
    `result_date`    date     not null,
    `id`             int      not null,
    `reception_date` datetime not null,
    `patient_id`     int      not null,
    `test_id`        int      null,
    primary key (`id`),
    constraint `patient_id`
        foreign key (`patient_id`) references `patient` (`id`),
    constraint `test_id`
        foreign key (`test_id`) references `test` (`id`)
);

-- index on receipt id
create index `receipt_cost_index`
    on `receipt` (`cost`);

-- sample table
create table `sample`
(
    `id`         int not null,
    `receipt_id` int not null,
    `test_id`   int not null,
    `patient_id` int not null,
    primary key (`id`),
    constraint `receipt_id_fk`
        foreign key (`receipt_id`) references `receipt` (`id`),
    constraint `sample_patient_id_fk`
        foreign key (`patient_id`) references `patient` (`id`),
    constraint `test_id_fk`
        foreign key (`test_id`) references `test` (`id`)
);


-- sample table id index
create index `sample_id_index`
    on `sample` (`id`);

-- section table
create table `section`
(
    `id`   int  not null,
    `name` text not null,
    primary key (`id`)
);
-- balance table
create table `balance`
(
    `id`         int        not null,
    `balanced`   tinyint(1) not null,
    `receipt_id` int        not null,
    primary key (`id`),
    constraint `receipt_id`
        foreign key (`receipt_id`) references `receipt` (`id`)
);
-- sample transfer table
create table `sample_transfer`
(
    `id`           int not null,
    `from_section` int not null,
    `to_section`   int not null,
    `sample_id`    int not null,
    primary key (`id`),
    constraint `sample_id_fk`
        foreign key (`sample_id`) references `sample` (`id`),
    constraint `sample_transfer_from_fk`
        foreign key (`from_section`) references `section` (`id`),
    constraint `sample_transfer_to_fk`
        foreign key (`to_section`) references `section` (`id`),
    constraint `sample_transfer_check`
        check (`from_section` <> `to_section`)
);

-- sample analyzed by table
create table `sample_analyzed_by`
(
    `id`         int not null,
    `sample_id`  int not null,
    `section_id` int not null,
    primary key (`id`),
    constraint `sample_analyzed_by_sample_id_fk`
        foreign key (`sample_id`) references sample (`id`),
    constraint `sample_analyzed_by_section_id_fk`
        foreign key (`section_id`) references `section` (`id`)
);
-- result table
create table `result`
(
    `id`          int      not null,
    `receipt_id`  int      not null,
    `patient_id`  int      not null,
    `date`        datetime not null,
    `sample_id`   int      not null,
    `description` text     null,
    `test_id`     int      null,
    primary key (`id`),
    constraint `result_patient_id_fk`
        foreign key (`patient_id`) references `patient` (`id`),
    constraint `result_receipt_id_fk`
        foreign key (`receipt_id`) references `receipt` (`id`),
    constraint `result_sample_id_fk`
        foreign key (`sample_id`) references sample (`id`),
    constraint `result_test_id_fk`
        foreign key (`test_id`) references `test` (`id`)
);

-- staff table
create table `staff`
(
    `id`         int  not null,
    `first_name` text not null,
    `last_name`  text not null,
    `section_id` int  not null,
    primary key (`id`),
    constraint `department_id`
        foreign key (`section_id`) references `section` (`id`)
);
-- visited by table
create table `visited_by`
(
    `id`         int not null,
    `patient_id` int not null,
    `staff_id`   int not null,
    primary key (`id`),
    constraint `patient_id_fk`
        foreign key (`patient_id`) references `patient` (`id`),
    constraint `staff_id_fk`
        foreign key (`staff_id`) references `staff` (`id`)
);


























