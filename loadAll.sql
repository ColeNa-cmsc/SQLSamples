INSERT INTO employee VALUES
(1,'E','One','Main St','Baltimore','MD',21201,'1A','2020-01-01','e1@email.com'),
(2,'E','Two','Oak St','Columbia','MD',21044,'2B','2021-02-01','e2@email.com'),
(3,'E','Three','Pine St','Ellicott City','MD',21043,'3C','2019-03-01','e3@email.com'),
(4,'E','Four','Maple St','Towson','MD',21204,'4D','2022-04-01','e4@email.com'),
(5,'E','Five','Elm St','Laurel','MD',20723,'5E','2020-05-01','e5@email.com'),
(6,'E','Six','Cedar St','Rockville','MD',20850,'6F','2018-06-01','e6@email.com');

INSERT INTO partner VALUES
(1),
(2),
(3);


INSERT INTO associate VALUES
(4),
(5),
(6);

INSERT INTO clients VALUES
(1,'A','One','St1','City','MD',21001,'1','a1@email.com',1200,'residential'),
(2,'B','Two','St2','City','MD',21002,'2','a2@email.com',1500,'residential'),
(3,'C','Three','St3','City','MD',21003,'3','a3@email.com',2000,'commercial'),
(4,'D','Four','St4','City','MD',21004,'4','a4@email.com',2500,'industrial'),
(5,'E','Five','St5','City','MD',21005,'5','a5@email.com',1300,'residential'),
(6,'F','Six','St6','City','MD',21006,'6','a6@email.com',1800,'commercial'),
(7,'G','Seven','St7','City','MD',21007,'7','a7@email.com',2200,'industrial'),
(8,'H','Eight','St8','City','MD',21008,'8','a8@email.com',1600,'residential'),
(9,'I','Nine','St9','City','MD',21009,'9','a9@email.com',1700,'commercial'),
(10,'J','Ten','St10','City','MD',21010,'10','a10@email.com',2100,'industrial'),
(11,'K','Eleven','St11','City','MD',21011,'11','a11@email.com',1400,'residential'),
(12,'L','Twelve','St12','City','MD',21012,'12','a12@email.com',2300,'commercial');

INSERT INTO property_owners VALUES
(1,'o1@email.com','Owner','One','1 Rolling Road','Baltimore City','MD',21041,'1'),
(2,'o2@email.com','Owner','Two','2 Rolling Road','Baltimore City','MD',21041,'1'),
(3,'o3@email.com','Owner','Three','3 Leeds Avenue','Baltimore City','MD',21040,'1'),
(4,'o4@email.com','Owner','Four','4 Rolling Road','Baltimore City','MD',21041,'2'),
(5,'o5@email.com','Owner','Five','5 Rolling Road','Baltimore City','MD',21041,'2'),
(6,'o6@email.com','Owner','Six','6 Leeds Avenue','Baltimore City','MD',21040,'2'),
(7,'o6@email.com','Pat','Doe','7 Leeds Avenue','Baltimore City','MD',21040,'2');

INSERT INTO rental_properties VALUES
(1,'residential',2,900,1,1200,100, TRUE,'101 St','Baltimore','MD',21201,'1A'),
(2,'residential',3,1200,2,1500,120, TRUE,'102 St','Baltimore','MD',21044,'2B'),
(3,'residential',2,950,1,1300,110, TRUE,'103 St','Ellicott City','MD',21043,'3C'),
(4,'residential',4,1600,2,1800,150, TRUE,'104 St','Ellicott City','MD',21204,'4D'),
(5,'residential',3,1100,2,1400,120, TRUE,'105 St','Laurel','MD',20723,'5E'),
(6,'residential',1,700,1,1000,90, TRUE,'106 St','Laurel','MD',20850,'6F'),
(7,'commercial',0,2000,0,3000,300, TRUE,'201 St','Baltimore','MD',21202,NULL),
(8,'commercial',0,2500,0,3500,350, TRUE,'202 St','Baltimore','MD',21045,NULL),
(9,'commercial',0,1800,0,2800,280, TRUE,'203 St','Ellicott City','MD',21042,NULL),
(10,'commercial',0,2200,0,3200,320, TRUE,'204 St','Ellicott City','MD',21286,NULL),
(11,'commercial',0,2100,0,3100,310, TRUE,'205 St','Laurel','MD',20724,NULL),
(12,'commercial',0,2600,0,3600,360, TRUE,'206 St','Laurel','MD',20852,NULL),
(13,'industrial',0,4000,0,5000,500, TRUE,'301 St','Baltimore','MD',21226,NULL),
(14,'industrial',0,4200,0,5200,520, TRUE,'302 St','Baltimore','MD',21046,NULL),
(15,'industrial',0,4500,0,5500,550, TRUE,'303 St','Ellicott City','MD',21043,NULL),
(16,'industrial',0,4800,0,5800,580, TRUE,'304 St','Ellicott City','MD',21234,NULL),
(17,'industrial',0,4600,0,5600,560, TRUE,'305 St','Laurel','MD',20725,NULL),
(18,'industrial',0,4900,0,5900,590, TRUE,'306 St','Laurel','MD',20855,NULL),
(19,'commercial',0,2100,0,3100,310, TRUE,'207 St','Laurel','MD',20723,NULL);

INSERT INTO leases VALUES
(1,1,'2024-01-01',1200,1200,12,'2024-01-01','2024-12-31'),
(2,2,'2024-03-01',1500,1500,12,'2024-03-01','2026-01-31'),
(3,3,'2024-05-01',3000,3000,12,'2024-05-01','2025-05-28'),
(4,4,'2024-03-01',5000,5000,12,'2024-03-01','2025-04-30'),
(5,5,'2024-07-01',1400,1400,12,'2024-07-01','2025-07-30'),
(6,6,'2024-02-01',3200,3200,12,'2024-02-01','2025-02-28');

INSERT INTO sign VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6);

INSERT INTO rent_out VALUES
(1,1),(2,2),(7,3),(13,4),(5,5),(10,6);

INSERT INTO owned_by VALUES
(1,1),(2,1),(3,1),(4,4),(5,5),(6,6),(7,2),(8,3),(9,4),(10,3),(11,4),(12,5),(13,1),(14,2),(15,3),(16,4),(17,5),(18,6),(19,7);

INSERT INTO assigned VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6);

INSERT INTO assigned_to VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6);

INSERT INTO written_by VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6);

INSERT INTO involve VALUES
(1,1,1),(2,2,2),(3,3,7),(4,4,13),
(5,5,5),(6,6,10);

INSERT INTO property_viewings VALUES
(1,1,1,'10:00','2025-10-10'),
(1,1,2,'10:00','2025-10-10'),
(1,1,3,'10:00','2025-10-10'),
(2,2,2,'11:00','2026-11-03'),
(3,3,7,'12:00','2024-03-12'),
(4,4,13,'13:00','2024-01-17'),
(5,5,5,'14:00','2022-09-22'),
(6,6,10,'15:00','2026-02-11'),
(1,7,3,'10:30','2021-06-16'),
(2,8,4,'11:30','2022-01-17'),
(3,9,8,'12:30','2023-07-18'),
(4,10,14,'13:30','2024-12-19'),
(5,11,6,'14:30','2025-03-20'),
(6,12,12,'15:30','2025-01-21');