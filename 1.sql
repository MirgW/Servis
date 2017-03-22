CREATE TABLE company    				-- компании заказчики
(
	co_id SERIAL 		NOT NULL,     -- ID заказчика
	co_name VARCHAR(40) 	not null, -- наименование заказчика
	co_adress TEXT  	null,         -- адрес заказчика

	 primary key (co_id)
);

INSERT INTO company VALUES (1,'Volvo','Ленина 1');
INSERT INTO company VALUES (2,'Zenit','Ленина 2');

CREATE TABLE people               -- заказчики  
(
	pe_id SERIAL 		NOT NULL,       -- ID заказчика 
	pe_name_f VARCHAR(40) 	not null, -- фамилия заказчика 
	pe_name_i VARCHAR(40) 	not null, -- имя заказчика
	pe_name_o VARCHAR(40) 	not null, -- отчество заказчика
	pe_com_id INT2         null,     -- ID компании заказчика
	pe_tel    VARCHAR(40)  null,     -- телефон заказчика
	pe_adress TEXT  	null,           -- адрес заказчика
	pe_email  VARCHAR(40)  null,     -- е-mail заказчика

	primary key (pe_id),
	foreign key (pe_com_id) references company (co_id)
	 on delete restrict on update restrict
);

INSERT INTO people VALUES (1,'Петров','Петок','Петрович',1,'2-12-25','Пушкина 5','1@mail.com');
INSERT INTO people VALUES (2,'Сидоров','Сидр','Сидорович',1,'2-10-57','Пушкина 15','5@mail.com');
INSERT INTO people VALUES (3,'Иванов','Иван','Иванович',2,'5-16-54','Пушкина 14','14@mail.com');


CREATE TABLE typeservice            -- типы сервисов
(
	ty_id SERIAL 		NOT NULL,         -- ID типов 
	ty_name VARCHAR(40) 	not null,   -- наименование сервисов

	primary key (ty_id)
);

INSERT INTO typeservice (ty_name) VALUES ('Запрос информации');
INSERT INTO typeservice (ty_name) VALUES ('Инцедент');
INSERT INTO typeservice (ty_name) VALUES ('Запрос на обслуживания');
INSERT INTO typeservice (ty_name) VALUES ('Изменение');
INSERT INTO typeservice (ty_name) VALUES ('Обращение');


CREATE TABLE master                   -- мастера 
(
	ma_id SERIAL 		NOT NULL,           -- ID мастера
	ma_name_f VARCHAR(40) 	not null,     -- фамилия мастера
	ma_name_i VARCHAR(40) 	not null,     -- имя мастера
	ma_name_o VARCHAR(40) 	not null,     -- отчество мастера
	ma_tel    VARCHAR(40)  null,         -- телефон мастера
	ma_email  VARCHAR(40)  null,         -- e-mail мастера

	primary key (ma_id) 
);

INSERT INTO master VALUES (1, 'Петров','Петок','Петрович','2-12-25','01@mail.com');
INSERT INTO master VALUES (2, 'Петров1','Петок1','Петрович1','21-12-25','02@mail.com');
INSERT INTO master VALUES (3, 'Петров2','Петок2','Петрович2','22-12-25','03@mail.com');
INSERT INTO master VALUES (4, 'Петров3','Петок3','Петрович3','23-12-25','04@mail.com');

CREATE TABLE service            -- обслужываемые сервисы
(
	se_id SERIAL     NOT NULL,     -- ID сервиса
	se_name VARCHAR(40)  not null, -- наименование сервиса

	primary key (se_id) 
);

INSERT INTO service (se_name) VALUES ('Пожарка');
INSERT INTO service (se_name) VALUES ('ПК');
INSERT INTO service (se_name) VALUES ('Видео');
INSERT INTO service (se_name) VALUES ('Телефоны');

CREATE TABLE status							-- статус заявки
(
	st_id SERIAL NOT NULL, 				-- ID статуса
	st_name VARCHAR(40) NOT NULL, 	-- наименование статуса
	primary key (st_id) 
);
INSERT INTO status (st_name) VALUES ('открыта');
INSERT INTO status (st_name) VALUES ('закрыта');
INSERT INTO status (st_name) VALUES ('назначена');
INSERT INTO status (st_name) VALUES ('выполнена');
INSERT INTO status (st_name) VALUES ('отменена');
INSERT INTO status (st_name) VALUES ('решено с замечанием');

CREATE TABLE manager										-- менеджеры
(
	mg_id SERIAL NOT NULL,
	mg_name_f VARCHAR(40) 	not null,     -- фамилия менеджера
	mg_name_i VARCHAR(40) 	not null,     -- имя менеджера
	mg_name_o VARCHAR(40) 	not null,     -- отчество менеджера
	mg_tel    VARCHAR(40)  null,           -- телефон менеджера	

	primary key (mg_id) 
);

INSERT INTO manager VALUES (1, 'Менеджер 1','имя','отчество','21-2-5');
INSERT INTO manager VALUES (2, 'Менеджер 2','имя 2','отчество 2','21-2-5');

CREATE TABLE mservice																	-- мастера по сервисам
(
	ms_ser_id INT2 NOT NULL,														-- ID сервиса
	ms_mas_id INT2 NOT NULL,														-- ID мастера

	primary key (ms_ser_id,ms_mas_id),
	foreign key (ms_ser_id) references service (se_id)
	 on delete restrict on update restrict,
	foreign key (ms_mas_id) references master (ma_id)
	 on delete restrict on update restrict
);

INSERT INTO mservice VALUES (1,1);
INSERT INTO mservice VALUES (2,1);
INSERT INTO mservice VALUES (3,1);
INSERT INTO mservice VALUES (4,1);
INSERT INTO mservice VALUES (1,2);
INSERT INTO mservice VALUES (2,2);

CREATE TABLE application											-- заявки 
(
	ap_id SERIAL NOT NULL,											-- ID заявки
  ap_typ_id INT2 NOT NULL,										-- ID тип заявки
	ap_inform VARCHAR(200),											-- информация
	ap_start TIME without time zone null,				-- время поступления
	ap_end TIME without time zone null,				  -- время закрытия
	ap_sta_id INT2 NOT NULL,										-- ID текущий статус
	ap_ser_id INT2 NOT NULL,										-- ID сервиса
	ap_mas_id INT2 NOT NULL,										-- ID текущий мастер
	ap_man_id INT2 NOT NULL,										-- ID текущий менеджер
	ap_com_id INT2 null,     										-- ID компании заказчика
	ap_rez VARCHAR(40) NULL,										-- решение
	ap_app_id INT2 NULL,												-- ID вышестояшее заявка
	ap_srok TIME without time zone null,				-- время контрольного срока
	ap_plan TIME without time zone null,				-- время планируемого срока
	ap_place VARCHAR(40),												-- место по заявке

primary key (ap_id),
	foreign key (ap_typ_id) references typeservice (ty_id)
	 on delete restrict on update restrict,
	foreign key (ap_sta_id) references status (st_id)
	 on delete restrict on update restrict,
	foreign key (ap_ser_id) references service (se_id)
	 on delete restrict on update restrict,
	foreign key (ap_mas_id) references master (ma_id)
	 on delete restrict on update restrict,
	foreign key (ap_man_id) references manager (mg_id)
	 on delete restrict on update restrict,
	foreign key (ap_com_id) references company (co_id)
	 on delete restrict on update restrict,
	foreign key (ap_app_id) references application (ap_id)
	 on delete restrict on update restrict
);

INSERT INTO application VALUES (1,5,'неработает что-то 1','2002-12-20 18:00:00',
		'2002-12-20 18:00:00',6,4,4,2,2,'решение',NULL,'2002-12-22 18:00:00',
		'2002-12-23 18:00:00','место 1');
INSERT INTO application VALUES (2,4,'неработает что-то 2','2002-12-20 18:00:00',
		'2002-12-20 18:00:00',6,4,4,2,2,'решение',NULL,'2002-12-22 18:00:00',
		'2002-12-23 18:00:00','место 2');
INSERT INTO application VALUES (3,4,'неработает что-то 3','2002-12-20 18:00:00',
		'2002-12-20 18:00:00',6,4,4,2,2,'решение',NULL,'2002-12-22 18:00:00',
		'2002-12-23 18:00:00','место 3');