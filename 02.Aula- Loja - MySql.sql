-- Banco de dados de uma loja 
-- Entidades, Vendedor, Produto, Endereco
-- Vendedor - Endereco (1:1), Vendedor - Produto (1:N)

CREATE DATABASE loja;

USE loja;

CREATE TABLE vendedor(
	idVendedor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    dataNasc DATE NOT NULL
);

CREATE TABLE produto(
	idProduto INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    desconto DECIMAL(4, 2) NOT NULL DEFAULT(0), -- 99.99 %; CASO NÃO FORNEÇA VALOR PARA DESCONTO, ELE IRÁ UTILIZAR O 0, 99.99%
    descontoAte DATE,
    quantidade INTEGER NOT NULL,
    idVendedor INTEGER NOT NULL,
    FOREIGN KEY(idVendedor) REFERENCES vendedor(idVendedor)
);

-- TABELA ENDERECO: id, cidade, uf, bairro, numero, complemento, idVendedor

CREATE TABLE endereco(
	idEndereco INTEGER PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(30) NOT NULL, -- Ubajara, São Paulo, -- VARCHAR = COMPRIMENTO VARIÁVEL
    uf CHAR(2) NOT NULL, -- CE. SP, PE -- CHAR = COMPRIMENTO FIXO
    rua VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    numero VARCHAR(15) NOT NULL,
    complemento VARCHAR(30) NOT NULL,
    idVendedor INTEGER UNIQUE NOT NULL, -- COM UNIQUE GARANTIMOS O RELACIONAMENTO 1:1
    FOREIGN KEY(idVendedor) REFERENCES vendedor(idVendedor)
);

INSERT INTO vendedor VALUES (1,'Devante','Kertzmann','sipes.rafael@example.net','2012-05-05'),(2,'Corrine','Herman','beer.jocelyn@example.org','1972-08-05'),(3,'Maia','Satterfield','dlakin@example.org','1998-02-12'),(4,'Lyda','Lesch','erosenbaum@example.net','2005-02-09'),(5,'Millie','Mosciski','wfisher@example.com','1993-03-30'),(6,'Alverta','Bergstrom','qhahn@example.org','1975-04-03'),(7,'Muhammad','Smitham','mgaylord@example.com','1977-05-05'),(8,'Haylee','Dickinson','della73@example.com','2012-05-25'),(9,'Melody','Dooley','mmertz@example.org','2010-09-21'),(10,'Karolann','Ziemann','pgorczany@example.org','1981-01-27'),(11,'Dejuan','Prosacco','msporer@example.org','1983-04-18'),(12,'Gregg','Ebert','vparisian@example.com','2002-10-02'),(13,'Coy','Little','raynor.mckayla@example.net','2005-05-19'),(14,'Brooklyn','Conn','gabrielle76@example.com','1996-07-12'),(15,'Delta','Kris','irwin.mills@example.org','1979-12-22'),(16,'Verdie','Howell','cschaden@example.com','1980-12-30'),(17,'Aisha','Fisher','yokuneva@example.org','2019-06-20'),(18,'Cali','Ebert','waelchi.daniella@example.net','1977-06-06'),(19,'Rosanna','Stehr','ivy76@example.com','1999-10-03'),(20,'Kyler','Frami','dax59@example.com','1981-07-13'),(21,'Harley','Howe','brown.hellen@example.com','1984-10-11'),(22,'Kaia','Greenholt','paxton44@example.org','2005-05-20'),(23,'Hayden','Gerhold','dylan.west@example.net','1982-08-02'),(24,'Adrienne','Dare','esther25@example.com','2015-01-17'),(25,'Ian','Glover','ryan.velda@example.com','1971-09-20'),(26,'Jamar','Koss','omayert@example.com','2005-07-18'),(27,'Jaron','Crona','turcotte.orland@example.net','1971-10-07'),(28,'Macie','Schuppe','violette.barton@example.org','2006-02-14'),(29,'Eldora','Mitchell','jaskolski.annie@example.com','2016-03-26'),(30,'Juvenal','Romaguera','goyette.benny@example.net','1971-07-13'),(31,'Catherine','Zemlak','helena.white@example.net','1990-07-13'),(32,'Casey','Weissnat','bo\'reilly@example.org','1996-01-12'),(33,'Jennings','Leffler','emard.bria@example.com','1973-10-14'),(34,'Toni','Keebler','lauren74@example.org','1975-06-08'),(35,'Daryl','Grant','orville.thiel@example.org','1978-08-23'),(36,'Lambert','Lueilwitz','uhessel@example.com','1985-11-11'),(37,'Toney','Bernier','ufriesen@example.com','1980-12-07'),(38,'Ismael','Thiel','pete.raynor@example.org','2011-04-11'),(39,'Missouri','Konopelski','genesis.heathcote@example.net','1989-03-04'),(40,'Lavinia','Haag','janice77@example.net','1980-07-14'),(41,'Hilario','Gusikowski','marcos.swaniawski@example.org','2020-04-16'),(42,'Eleazar','Weimann','zreynolds@example.net','2004-01-09'),(43,'Nat','Heaney','karlee88@example.com','1996-12-15'),(44,'Branson','Feeney','vivien98@example.com','1976-01-06'),(45,'Brianne','Pacocha','lola.torphy@example.net','2001-04-04'),(46,'Rosella','Hintz','rosanna92@example.net','1975-03-23'),(47,'Isadore','Dare','mcclure.brett@example.com','1970-08-25'),(48,'Opal','McLaughlin','shamill@example.org','2017-07-12'),(49,'Humberto','Gleason','hickle.ivah@example.com','2006-02-03'),(50,'Cayla','Price','bpadberg@example.org','2020-03-08'),(51,'Clifford','Keeling','troy.gutkowski@example.org','2010-12-10'),(52,'Salvatore','Altenwerth','corrine.wilderman@example.org','1971-12-31'),(53,'Leora','Price','bennett.schowalter@example.org','1978-08-28'),(54,'Helena','Haag','aliyah.steuber@example.com','1972-02-20'),(55,'Bria','Russel','presley.goyette@example.org','2018-10-06'),(56,'Lyric','Volkman','rocky22@example.com','1976-02-14'),(57,'Janiya','Deckow','brooke23@example.com','2008-08-22'),(58,'Natalia','Turcotte','o\'connell.cathryn@example.org','2014-06-13'),(59,'Jovan','Hauck','kylie.medhurst@example.com','1985-07-14'),(60,'Viva','Runte','dryan@example.net','1986-02-17'),(61,'Lilliana','Heller','antonietta28@example.net','2009-06-05'),(62,'Clovis','Wiza','izabella79@example.net','1989-01-09'),(63,'Dakota','Nitzsche','lance.kulas@example.net','1988-07-22'),(64,'Yoshiko','Rempel','arolfson@example.org','1981-05-24'),(65,'Brielle','Yundt','ffeil@example.net','2003-08-04'),(66,'Jalyn','Weimann','katlyn57@example.net','2016-11-04'),(67,'Harmon','Volkman','alek49@example.org','1975-08-16'),(68,'Eldora','Bauch','heaven.schowalter@example.net','1988-04-07'),(69,'Gerardo','Hamill','mlind@example.net','1997-05-16'),(70,'Leanna','Gleichner','kpollich@example.org','2011-08-19'),(71,'Elnora','Wolf','keeling.grayson@example.net','2009-07-26'),(72,'Claudia','McLaughlin','chodkiewicz@example.org','1989-08-07'),(73,'Gillian','Cormier','mcglynn.johnson@example.org','1986-01-14'),(74,'Justen','Jacobi','zromaguera@example.org','2013-01-18'),(75,'Kenny','Abshire','jayda80@example.com','2021-07-11'),(76,'Rose','Leffler','anissa85@example.com','1997-04-16'),(77,'Zola','Schiller','stracke.adelia@example.org','2003-10-10'),(78,'Nelson','Watsica','haylie14@example.org','1974-09-27'),(79,'Araceli','Lind','berge.rico@example.com','2011-12-01'),(80,'Burdette','Rohan','stamm.jodie@example.com','1990-09-14'),(81,'Vivian','Wiegand','isaiah.pfannerstill@example.ne','2014-12-24'),(82,'Madaline','Powlowski','anastasia.franecki@example.com','1996-03-25'),(83,'Maida','Wyman','rahsaan92@example.org','2004-08-03'),(84,'Urban','Nolan','rohan.aletha@example.net','2020-01-12'),(85,'Jettie','Batz','rowan80@example.org','2006-06-18'),(86,'Davonte','Moore','cole.kayleigh@example.net','1981-02-12'),(87,'Dusty','Kautzer','mayert.marshall@example.com','1970-05-25'),(88,'Alphonso','Wolff','wiza.gerson@example.net','1976-07-02'),(89,'Tristian','Schultz','alyce.stanton@example.org','2007-09-14'),(90,'Randall','Carter','jaycee58@example.net','1996-02-02'),(91,'Delta','Sawayn','vinnie40@example.com','1996-06-18'),(92,'Pinkie','Mohr','kilback.brandt@example.net','2011-03-13'),(93,'Leslie','Funk','rowan.barrows@example.org','1970-05-06'),(94,'Ellen','Jast','shad49@example.com','1986-04-18'),(95,'Meda','Conroy','ureichert@example.org','1979-11-09'),(96,'Vernie','Moen','rowland.mitchell@example.com','1994-10-17'),(97,'Mikel','Gleichner','stanley.walter@example.com','1990-10-06'),(98,'Domingo','Johns','kris.marlene@example.net','1976-01-17'),(99,'Milo','Morissette','crist.darrin@example.net','1997-06-10'),(100,'Ladarius','Torphy','wgreenholt@example.net','1992-09-21');
INSERT INTO produto VALUES (1,'Nulla quo eum molestiae praese',542.36,0.22,'2013-01-23',15,1),(2,'Beatae delectus tempora ea con',52.99,0.60,'2018-10-03',223,2),(3,'Nihil vero enim.',1652.86,0.27,'2020-07-07',235,3),(4,'Debitis aut non aspernatur at.',1854.68,0.31,'2015-02-18',270,4),(5,'Sed velit molestiae eveniet qu',909.11,0.95,'2012-06-30',159,5),(6,'Eligendi minima et.',1534.60,1.00,'2015-01-15',69,6),(7,'Maxime tenetur temporibus nece',2257.35,1.00,'2019-04-14',134,7),(8,'Neque ad perferendis dolorem a',2211.81,0.58,'2018-03-22',60,8),(9,'Voluptas praesentium enim.',1904.72,0.22,'2016-11-08',299,9),(10,'Qui totam non.',849.32,0.92,'2015-12-18',99,10),(11,'Placeat quo dignissimos.',802.73,0.00,'2021-01-24',40,11),(12,'Enim omnis nesciunt est placea',491.33,0.23,'2013-06-06',137,12),(13,'Quos incidunt sed.',20.49,0.00,'2022-04-09',206,13),(14,'Quod voluptatem ea rerum.',1112.60,0.23,'2013-12-05',47,14),(15,'Perspiciatis repellat voluptat',567.14,0.73,'2019-03-20',291,15),(16,'Aperiam est est.',985.61,0.21,'2020-12-06',127,16),(17,'Corporis quidem ratione.',358.63,0.59,'2022-05-27',247,17),(18,'Ipsa facere veniam.',1525.95,1.00,'2018-02-10',152,18),(19,'Doloremque aspernatur necessit',926.63,0.84,'2023-12-31',25,19),(20,'Id nam numquam at.',1885.42,0.19,'2018-12-14',115,20),(21,'Sapiente deserunt assumenda.',2246.44,0.97,'2023-01-22',170,21),(22,'Aut laudantium aut neque exerc',602.16,0.61,'2020-06-15',63,22),(23,'Cum omnis veritatis laborum qu',1699.59,0.14,'2012-08-07',161,23),(24,'Recusandae voluptas odit.',1750.12,0.80,'2016-07-27',289,24),(25,'Voluptas nihil ipsa omnis nisi',1205.22,0.33,'2017-06-22',202,25),(26,'Quo qui quia ipsa sed.',1938.58,0.84,'2024-09-01',198,26),(27,'Magni vel qui unde omnis.',65.60,0.95,'2015-05-23',129,27),(28,'Et aut ipsum temporibus.',2186.38,0.98,'2022-04-20',164,28),(29,'Similique sed maxime rerum.',1094.49,0.00,'2020-10-27',261,29),(30,'Aut enim ut.',2186.85,0.56,'2020-09-01',171,30),(31,'Inventore dicta laboriosam.',1484.78,0.85,'2024-09-09',205,31),(32,'Ab dolorem officia dolor.',1896.94,0.82,'2016-06-27',291,32),(33,'Iste exercitationem voluptas u',2305.20,0.11,'2012-11-27',49,33),(34,'Dolor enim facilis.',745.45,0.91,'2014-09-11',291,34),(35,'Sit dolorum animi quas at.',178.09,1.00,'2014-07-30',218,35),(36,'Voluptate ab sint consequatur ',1918.25,0.34,'2021-07-24',207,36),(37,'Beatae et quia vitae ipsam.',1346.60,0.93,'2015-07-13',63,37),(38,'Ipsum id rerum.',2425.65,0.15,'2024-03-23',261,38),(39,'Tempora ipsum voluptates velit',944.78,0.41,'2014-04-20',172,39),(40,'Occaecati quia nostrum ut repr',204.54,0.53,'2020-05-28',277,40),(41,'Dolorem aut perferendis quam.',351.47,0.94,'2020-11-18',30,41),(42,'Earum omnis quisquam rerum del',1805.09,0.32,'2014-02-04',203,42),(43,'Non id ut beatae.',303.75,0.80,'2014-03-13',228,43),(44,'Ex harum neque enim.',2105.07,0.20,'2019-03-03',127,44),(45,'Atque optio reprehenderit dolo',731.79,0.56,'2019-10-25',138,45),(46,'Adipisci nobis blanditiis maxi',1344.07,0.81,'2019-11-14',66,46),(47,'Accusantium minima quo volupta',1834.16,0.51,'2021-02-27',0,47),(48,'Ut esse rerum.',433.68,0.52,'2015-09-20',126,48),(49,'Et itaque eius explicabo qui.',1821.12,0.60,'2013-05-04',150,49),(50,'Et ab dolorum alias.',105.76,0.81,'2016-01-02',264,50),(51,'Ut officiis doloremque quia di',1884.52,0.78,'2021-05-29',257,51),(52,'Sint illo earum consequuntur d',438.20,0.51,'2024-02-27',78,52),(53,'Aut non consequatur inventore.',580.38,0.00,'2017-04-06',28,53),(54,'Architecto adipisci est iusto.',1398.42,0.40,'2015-05-05',116,54),(55,'Expedita et sint iusto.',2005.95,0.76,'2013-06-13',249,55),(56,'Qui ea velit.',1326.09,0.31,'2016-01-06',31,56),(57,'Autem repudiandae voluptatum h',2169.65,0.70,'2017-02-11',54,57),(58,'Placeat quia odio.',699.61,0.78,'2021-01-20',135,58),(59,'Qui vitae deserunt autem et.',1496.14,0.81,'2019-12-21',297,59),(60,'Et dolores tenetur.',795.35,0.92,'2018-07-28',93,60),(61,'A veritatis rerum dolore tempo',1411.93,0.00,'2015-01-08',130,61),(62,'Sapiente animi aliquid soluta ',1411.94,0.34,'2022-05-01',36,62),(63,'Animi rerum magnam.',1858.39,0.00,'2012-07-05',37,63),(64,'Perferendis voluptas quo ea.',1565.83,0.90,'2017-08-05',288,64),(65,'Aspernatur facilis commodi vol',1085.78,0.13,'2023-01-28',59,65),(66,'Fugit aliquid ea est optio dol',415.50,0.71,'2020-09-14',291,66),(67,'Ex quibusdam consequatur volup',1396.56,0.77,'2017-01-03',157,67),(68,'Explicabo laudantium cum autem',625.89,0.86,'2019-09-06',140,68),(69,'Id dignissimos dolores qui ear',2017.42,0.46,'2024-05-28',241,69),(70,'Id et voluptatem cum.',76.29,0.69,'2023-10-28',56,70),(71,'Aut rerum ut quibusdam.',1531.66,0.40,'2024-02-08',8,71),(72,'Dolore eaque dolores quis quia',726.10,0.76,'2014-05-26',213,72),(73,'Voluptas assumenda corporis au',1949.63,0.19,'2022-12-12',154,73),(74,'Omnis iusto enim vel velit mol',1407.46,0.34,'2019-04-30',205,74),(75,'Nostrum sunt magnam.',402.32,0.46,'2013-05-19',183,75),(76,'Id tempore ut sit qui.',484.55,0.17,'2024-06-19',194,76),(77,'Ab dolorem dolores molestias.',2002.08,0.55,'2012-07-06',206,77),(78,'Est accusamus omnis dolor magn',72.40,1.00,'2013-02-15',266,78),(79,'Et rerum nihil est et.',932.05,0.57,'2020-01-01',234,79),(80,'Perspiciatis cum repellat fuga',382.04,0.67,'2013-07-08',44,80),(81,'Dolor omnis atque non accusant',576.19,0.09,'2018-02-18',249,81),(82,'Cupiditate consectetur earum.',2223.65,0.57,'2014-10-01',197,82),(83,'Quis exercitationem minima ut ',680.25,0.62,'2016-06-16',79,83),(84,'Expedita ab eveniet voluptas a',1598.88,0.74,'2021-08-28',19,84),(85,'Est nam in.',402.41,0.58,'2017-12-18',220,85),(86,'Qui animi fugiat.',2385.84,1.00,'2015-03-08',72,86),(87,'Quis dolore et eos non.',412.37,0.60,'2020-12-10',31,87),(88,'Qui qui quo aut eum.',535.53,0.00,'2014-05-17',298,88),(89,'Praesentium porro occaecati et',323.80,0.43,'2015-11-07',158,89),(90,'Incidunt cum ea expedita.',2460.02,1.00,'2021-12-24',163,90),(91,'Aut necessitatibus veritatis u',1018.88,0.70,'2016-08-19',244,91),(92,'Dolores quia voluptas aperiam ',1553.95,0.03,'2018-07-19',87,92),(93,'Sit placeat eos et quia eos.',976.97,0.50,'2017-01-21',68,93),(94,'Totam omnis quae doloribus est',1987.21,0.91,'2022-09-05',298,94),(95,'Facere nostrum suscipit quos n',1841.05,0.32,'2014-03-09',34,95),(96,'Suscipit optio qui facere a.',959.24,0.60,'2017-08-31',30,96),(97,'Et et modi qui aperiam dolores',1453.17,0.42,'2020-12-13',196,97),(98,'Architecto et distinctio ratio',42.92,0.10,'2012-07-04',275,98),(99,'Harum autem illum blanditiis t',1566.60,0.14,'2016-10-22',173,99),(100,'Excepturi quidem asperiores.',791.29,0.87,'2012-12-17',224,100);
INSERT INTO endereco VALUES (1,'West Cindy','PI','Harber Dam','Voluptatem quia eos nostrum ex','150','Suite 706',1),(2,'Dillonport','RS','Gavin Shoal','Sed velit ea voluptatem quam n','58198','Apt. 088',2),(3,'Kyliestad','RS','Delpha Neck','Quia aut modi natus voluptatum','833','Suite 952',3),(4,'West Abigale','RS','Russel Valley','Non debitis dolore est volupta','17240','Apt. 042',4),(5,'New Annieburgh','PE','Daugherty Spur','Iste assumenda quae dolorem.','16851','Apt. 419',5),(6,'Pietrofort','PE','Maria Glen','Voluptas eos iusto porro quo e','736','Suite 312',6),(7,'Gerlachmouth','BA','Kieran Coves','Eos totam aperiam inventore er','493','Apt. 337',7),(8,'East Eliasfurt','PE','Manuela Extension','Minus quae vel accusantium.','6190','Suite 746',8),(9,'Port Elmorefurt','AM','Terrell Heights','Delectus quidem sunt molestias','1875','Apt. 674',9),(10,'East Melisa','RJ','Jacey Pine','Tenetur ut odit corrupti offic','9061','Suite 535',10),(11,'East Kenya','BA','Katrina Gateway','Quasi accusantium ipsam volupt','4252','Suite 996',11),(12,'Ryanstad','RS','Cesar Motorway','Necessitatibus in explicabo et','379','Apt. 959',12),(13,'South Rosario','BA','Brayan Plaza','Totam dicta et voluptas quia u','622','Suite 846',13),(14,'Homenickbury','RS','Audrey Course','Ut et laborum non est.','92427','Suite 371',14),(15,'New Frieda','AM','Nadia Cove','Nihil optio iusto consequuntur','545','Apt. 464',15),(16,'Sandybury','SP','Abshire Park','Sit consequatur voluptates sun','289','Suite 605',16),(17,'South Isadore','PE','Alek Key','Ipsam ipsam aut magni sunt.','0113','Apt. 483',17),(18,'Jacynthebury','PI','Langworth Vista','Amet delectus dolorem veniam d','43764','Apt. 760',18),(19,'Stromanton','BA','Candido Isle','Voluptates ipsam minima dolore','55821','Suite 596',19),(20,'New Kasey','PI','Sporer Greens','In unde quis voluptates quis.','04865','Apt. 570',20),(21,'East Bridget','SP','Schumm Spurs','Omnis dolor nesciunt atque rer','0710','Suite 355',21),(22,'Farrellview','RJ','Howe Drive','Molestias cupiditate maiores v','7326','Suite 970',22),(23,'Lake Margarett','CE','Rath Parks','Ipsa repudiandae nam soluta sa','24461','Suite 216',23),(24,'West Crystalland','PE','Jaclyn Camp','Dolorum voluptatum impedit ear','4443','Apt. 583',24),(25,'Dibberthaven','RJ','Nienow Junction','Excepturi possimus vero quis m','57365','Apt. 242',25),(26,'Lake Alaynahaven','CE','Hackett Brooks','Vero voluptatem delectus et cu','492','Suite 718',26),(27,'North Altheahaven','BA','Antonio Mountain','Molestiae delectus ipsam sit i','5163','Suite 846',27),(28,'New Christaview','RS','Kuvalis Wells','Occaecati eligendi id architec','43982','Suite 938',28),(29,'Kaliborough','RJ','Fern Neck','Qui inventore omnis quibusdam ','9204','Suite 916',29),(30,'Elainaside','PE','Neil Forges','Consectetur fuga repellendus f','952','Apt. 109',30),(31,'West Amber','PE','Minerva Pines','Enim incidunt consequatur sint','8419','Apt. 584',31),(32,'South Jasen','PI','Cecilia Spur','Nisi tenetur illo eos vel.','38977','Suite 626',32),(33,'East Joesph','PE','Amy Stream','Autem qui est mollitia alias a','520','Suite 474',33),(34,'New Neldaside','SP','Connelly Shoals','Ullam similique ut quaerat exp','170','Apt. 432',34),(35,'Baileeside','PE','Monty Wall','Eveniet sint dolore dolorum qu','9765','Apt. 035',35),(36,'Lake Theresiamouth','AM','Flatley Expressway','Corporis minima autem laborios','5094','Suite 281',36),(37,'East Jaiden','BA','Jettie Lake','Maiores repellendus ea labore ','1459','Apt. 264',37),(38,'Alizemouth','BA','Michale Fords','Illo omnis veritatis voluptatu','7680','Apt. 323',38),(39,'Hackettborough','SP','Legros Throughway','Expedita omnis in quasi conseq','7522','Apt. 294',39),(40,'Ivoryburgh','AM','Maggio Throughway','Dolores reiciendis dolorum nes','8491','Apt. 374',40),(41,'Jacquelynmouth','BA','Kshlerin Fall','Excepturi similique quasi magn','4170','Apt. 716',41),(42,'Parkerfurt','BA','Frank Harbors','Reprehenderit et quia a.','23611','Apt. 021',42),(43,'Altenwerthstad','PE','Callie Run','Perferendis ut voluptas et ist','1284','Apt. 586',43),(44,'Magaliburgh','BA','Renner Glen','Dicta eos iure voluptatem accu','136','Apt. 479',44),(45,'West Merl','PE','Brant Isle','Et voluptatem vel odit omnis.','013','Suite 157',45),(46,'Lake Remingtonside','PE','Mohammed Bypass','Suscipit consectetur omnis und','841','Apt. 317',46),(47,'Jonesburgh','RS','Pfeffer Ranch','Qui unde sit fugiat aut omnis.','206','Suite 561',47),(48,'Lake Jettie','PI','Block Burgs','Magni et ex omnis et nisi in q','935','Suite 015',48),(49,'Windlerborough','BA','Hettinger Vista','Et expedita velit veniam porro','69906','Suite 977',49),(50,'East Garnett','SP','Rowland Streets','Aut tempore et incidunt in.','0539','Suite 780',50),(51,'West Derrick','PI','Kuhic Shoals','Qui eaque rem vitae nulla repu','4633','Suite 892',51),(52,'Lindgrenburgh','SP','Rice Burgs','Et illum molestiae dolores est','054','Suite 621',52),(53,'Jacobsbury','SP','Jefferey Port','Quia accusamus voluptatibus au','49058','Suite 472',53),(54,'West Daryl','PE','Darlene Island','Aspernatur nisi id consequatur','97757','Suite 385',54),(55,'Staceytown','PE','Veum Freeway','Quia recusandae assumenda vel ','4716','Apt. 079',55),(56,'Rebekaport','AM','Archibald Drive','Consequatur atque reprehenderi','37079','Suite 417',56),(57,'Port Deionmouth','AM','Murazik Forges','Voluptatibus dolorem fugit lab','31364','Suite 848',57),(58,'Schmelerport','RJ','Caleigh Flats','Eum amet quae nesciunt ut comm','4017','Suite 412',58),(59,'Morissetteton','SP','Osinski Ford','Accusamus quia quam sed.','9938','Suite 130',59),(60,'West Vitaside','PI','Borer Greens','Necessitatibus hic et quod.','03591','Apt. 156',60),(61,'Cloydtown','PI','Noemy Hills','Aliquam eos ratione animi corr','6285','Apt. 559',61),(62,'Franeckiton','RJ','Sawayn Parks','Eveniet dignissimos ut volupta','705','Apt. 831',62),(63,'Wolffmouth','RS','Orpha Courts','Alias labore sit sunt molestia','113','Suite 889',63),(64,'Bogisichmouth','RJ','Hettinger Lock','Et et sit aspernatur dolorem b','30559','Suite 164',64),(65,'Gaylordmouth','RJ','Considine Junctions','Eum ut earum provident itaque.','4492','Apt. 920',65),(66,'Marquisfort','PE','Mercedes Roads','Sit molestias voluptatem nobis','0205','Suite 736',66),(67,'Monahanchester','BA','April Park','Est quis animi sunt ea sit dol','4313','Suite 617',67),(68,'Jedidiahtown','RS','Schmitt Summit','Aut enim vel rerum nostrum aut','5903','Suite 977',68),(69,'New Edgardoview','RJ','Raquel Ford','Dignissimos soluta eos quo asp','8150','Apt. 020',69),(70,'Lake Jacky','PE','Casper Square','Voluptas quo consequatur porro','089','Suite 522',70),(71,'Mrazburgh','PI','Corkery Manors','Officia neque voluptate aut es','4087','Apt. 751',71),(72,'South Lorenzoland','SP','Toy Mission','Dolorum sapiente a et enim ea ','589','Suite 613',72),(73,'Lindgrenstad','RJ','Eino Alley','Sed illum rem aut ipsum labore','20989','Apt. 799',73),(74,'Lake Florence','CE','McClure Shoals','Eos deserunt libero deserunt e','181','Suite 191',74),(75,'Selenafort','SP','Nikolaus Course','Voluptas ut et velit eos.','807','Apt. 970',75),(76,'Lake Freidastad','BA','Abe Shore','Sit sapiente qui doloribus est','37713','Apt. 546',76),(77,'Gonzalomouth','RS','Bergnaum Station','Mollitia qui occaecati sapient','7613','Apt. 628',77),(78,'Port Felicityview','CE','Rylan Canyon','Sit ut ab possimus voluptatibu','76096','Apt. 438',78),(79,'East Kristoferfurt','SP','Makenna Crossing','Aut iure vel in voluptas ex.','03038','Suite 555',79),(80,'West Ayana','SP','Juvenal Landing','Omnis et pariatur perspiciatis','077','Suite 059',80),(81,'Rickieview','RS','Marguerite Mission','Debitis voluptatibus beatae a ','522','Apt. 478',81),(82,'Port Dawnland','PI','Leuschke Fort','Ex deleniti cumque facere volu','75197','Suite 266',82),(83,'East Glenniehaven','AM','Koch Mall','Nisi voluptatem temporibus sin','767','Apt. 525',83),(84,'Hegmannton','RS','Lemke Track','Voluptas dolores ipsum veritat','68884','Apt. 474',84),(85,'Kesslerberg','BA','Waelchi Cliff','Officiis natus quod qui est.','353','Suite 730',85),(86,'Pfefferview','AM','Elenor Pike','Et iure aut ut.','3749','Apt. 413',86),(87,'Makenzieshire','AM','Maia Avenue','Itaque est magnam voluptas aut','7230','Apt. 880',87);

SELECT * FROM vendedor;
SELECT * FROM produto;
SELECT * FROM endereco;

-- PROJEÇÃO / o que se quer ver/mostrar
SELECT NOW() AS agora;
SELECT 1 + 1 AS resultado; -- ALIAS = apelido.
SELECT nome AS nomeVendedor FROM vendedor; -- Podemos escolher quais colunas ver na tabela
SELECT nome, sobrenome FROM vendedor;
SELECT dataNasc AS aniversario FROM vendedor;
SELECT nome AS nomeProduto, preco FROM produto;


-- SELEÇÃO: É filtrar os registros da tabela
SELECT idVendedor, nome, sobrenome FROM vendedor WHERE idVendedor = 1; -- LIsta o vendedor com o id =1
SELECT * FROM vendedor WHERE idVendedor != 1; -- Lista todos menos o vendedor com o id = 1
SELECT * FROM vendedor WHERE idVendedor = 1 OR idVendedor = 2; -- Lista todas as colunas, onde o vendedor é 1 ou 2
SELECT * FROM vendedor WHERE idVendedor != 1 AND idVendedor != 2; -- Lista todas as linhas, onde o vendedor é diferente 1 e 2
SELECT * FROM vendedor WHERE email = "jr@gmail.com"; -- RESULTADO VAZIO, sem resgitros

SELECT * FROM produto WHERE preco > 300;
SELECT * FROM produto WHERE preco >= 300;
SELECT * FROM produto WHERE preco < 100;
SELECT * FROM produto WHERE preco >= 100 AND preco <= 500; -- Listando produtos da faixa de preco 100 - 500
SELECT * FROM produto WHERE desconto > 0.0 AND descontoAte < CURRENT_DATE(); -- Lista produtos com desconto, mas com datas expiradas
SELECT * FROM produto WHERE quantidade < 20; -- Lista os produtos abaixo do estoque de 20
SELECT * FROM produto WHERE quantidade = 0; -- Lista produtos sem estoque  
SELECT * FROM vendedor WHERE YEAR(dataNasc) < 2000; -- Lista os vendedores que nasceram antes dos anos 2000
SELECT * FROM produto WHERE quantidade >= 20 AND quantidade <= 100;
SELECT * FROM produto WHERE quantidade BETWEEN 20 AND 100; -- Lista os produtos com quantidade entre 20 e 100
SELECT * FROM vendedor WHERE idVendedor IN(1, 25, 30, 80, 90); -- Evita utilizar o OR excessivamente
SELECT COUNT(*) FROM vendedor; -- Quantidade de linhas na query/busca
SELECT * FROM produto WHERE descontoAte IS NULL; -- Lista produtos em que a data é nula
SELECT * FROM produto WHERE descontoAte IS NOT NULL; -- Lista produtos em que a data não é nula

SELECT * FROM vendedor  WHERE nome = "Devante";
SELECT * FROM vendedor WHERE nome LIKE "Dev%"; -- % = QUALQUER TEXTO EM SEGUIDA
SELECT * FROM vendedor WHERE sobrenome LIKE "%ann";
SELECT * FROM vendedor WHERE nome LIKE "%an%"; -- Busca 'an' em qualquer lugar do nome
SELECT * FROM vendedor WHERE email LIKE "%@gmail.com%"; -- Busca o @gmail.com no final
SELECT * FROM vendedor WHERE email LIKE "%.org%"; -- Busca .org no final
SELECT * FROM vendedor WHERE dataNasc LIKE "%-10-%"; -- Busca os vendedores com aniversário no mês 10

-- ORDENAÇÃO

SELECT * FROM produto ORDER BY preco; -- ASC = crescente (padrão) vs DESC
SELECT * FROM produto ORDER BY preco DESC;
SELECT * FROM produto WHERE quantidade BETWEEN 20 AND 100 ORDER BY preco;
SELECT * FROM vendedor ORDER BY nome; -- Ordem alfabética
SELECT * FROM vendedor ORDER BY nome, sobrenome; -- Se os nomes forem iguais, usa o sobrenome para desempate
SELECT * FROM vendedor LIMIT 10;

SELECT * FROM vendedor WHERE nome LIKE "J%" LIMIT 5;
SELECT * FROM vendedor WHERE idVendedor BETWEEN 10 AND 30 LIMIT 10;

SELECT *
FROM produto
WHERE desconto > 0.0 AND descontoAte > CURRENT_DATE()
ORDER BY preco DESC
LIMIT 50; -- Podemos quebrar linha para organizar melhor
-- LIMIT 50 => OS PRIMEIROS 50 RESULTADOS DA QUERY

SELECT idVendedor FROM endereco WHERE uf = "CE"; -- Listar o id dos vendedores de CE
SELECT idVendedor, uf FROM endereco WHERE uf IN("SP", "RJ", "PI");
SELECT * FROM vendedor WHERE YEAR(dataNasc) > 2000; -- Lista os vendedores que nasceram após 2000
SELECT * FROM vendedor WHERE MONTH(dataNasc) = 10; -- Lista os vendedores que nasceram em outubro
SELECT * FROM vendedor WHERE MONTH(dataNasc) = MONTH(CURRENT_DATE); -- Lista os vendedores que nasceram no mês atual da query

-- Query 1) Listar os produtos com desconto maior que 50;
SELECT * FROM produto WHERE desconto > 0.5;

-- Query 2) Listar os produtos que estão abaixo do estoque de 5;
SELECT * FROM produto WHERE quantidade < 5;

-- Query 3) Listar os produtos que estavam em promoção ano passado;
SELECT * FROM produto WHERE YEAR(descontoAte) = 2021;
-- SELECT * FROM produto WHERE YEAR(descontoAte) IN(2021);

-- Query 4) Listar os vendedores nascidos entre 1990 e 2001;
SELECT * FROM vendedor WHERE YEAR(dataNasc) BETWEEN 1990 AND 2001;

-- Query 5) Listar o ID dos vendedores que moram na cidade de Campinas;
SELECT idVendedor FROM endereco WHERE cidade = "Campinas";
-- SELECT idVendedor FROM endereco WHERE cidade IN("Campinas")
-- SELECT idVendedor FROM endereco WHERE cidade LIKE "%Campinas";

-- JUNÇÃO

SELECT idVendedor FROM endereco WHERE uf = "CE";
SELECT * FROM vendedor WHERE idVendedor;

SELECT * FROM vendedor
	INNER JOIN endereco -- JUNTA A LINHA DO VENDEDOR COM O SEU RESPECTIVO ENDERECO
    ON vendedor.idVendedor = endereco.idVendedor; -- COMPARA CHAVE PRIMARIA COM A CHAVE EXTRANGEIRA
    
    
SELECT nome, sobrenome, uf, cidade FROM vendedor
	INNER JOIN endereco -- JUNTA A LINHA DO VENDEDOR COM O SEU RESPECTIVO ENDERECO
    ON vendedor.idVendedor = endereco.idVendedor
WHERE uf = "CE" AND nome LIKE("j%"); -- uf IN("SP", "CE", "PI");


SELECT * FROM vendedor
	INNER JOIN produto -- JUNTA CADA VENDEDOR COM O SEU PRODUTO
    ON vendedor.idVendedor = produto.idVendedor;


SELECT * FROM vendedor
	INNER JOIN produto
    ON vendedor.idVendedor = produto.idVendedor
	INNER JOIN endereco
    ON vendedor.idVendedor = endereco.idVendedor;
    
    
