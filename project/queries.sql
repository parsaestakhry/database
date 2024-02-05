-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- patient select
SELECT * FROM `patient`;

-- results on a certain date
SELECT * FROM `result` WHERE `date` = CURRENT_TIMESTAMP;

-- selecting all the samples
SELECT * FROM `sample`

-- data inserts to patient table
INSERT INTO `lab-database`.`patient` (`id`, `conditions`, `sex`, `age`, `first_name`, `last_name`) VALUES (1, 'quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac', 'Female', 98, 'Shay', 'Arndtsen');
INSERT INTO `lab-database`.`patient` (`id`, `conditions`, `sex`, `age`, `first_name`, `last_name`) VALUES (2, 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', 'Male', 95, 'Garvy', 'Kenner');
INSERT INTO `lab-database`.`patient` (`id`, `conditions`, `sex`, `age`, `first_name`, `last_name`) VALUES (3, 'pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus', 'Male', 23, 'Conrade', 'Lages');
INSERT INTO `lab-database`.`patient` (`id`, `conditions`, `sex`, `age`, `first_name`, `last_name`) VALUES (4, 'suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque', 'Non-binary', 55, 'Florri', 'Thalmann');
INSERT INTO `lab-database`.`patient` (`id`, `conditions`, `sex`, `age`, `first_name`, `last_name`) VALUES (5, 'dui vel nisl duis ac nibh fusce lacus purus aliquet at', 'Genderqueer', 17, 'Ellary', 'Tussaine');
INSERT INTO `lab-database`.`patient` (`id`, `conditions`, `sex`, `age`, `first_name`, `last_name`) VALUES (136, 'cough', 'M', 20, 'Parsa', 'Estakhri');


