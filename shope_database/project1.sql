
create table stores(
    id int not null primary key ,
    city varchar(30) not null,
    adress varchar(30) not null,
    room_area int not null
);

create table workers(
    id int primary key ,
    name varchar(30) not null,
    store_id int not null,
    position varchar(30) not null,
    sex varchar(30),
    salary int not null,
    birthday date not null,
    phone_number varchar(30) not null,
    foreign key  (store_id) references stores(id)
);

create table products_in_stock(
    store_id integer,
    upc integer,
    amount int,
    foreign key (store_id) references stores(id),
    UNIQUE (store_id, upc)
);


create table clients(
    name varchar(30),
    bonus_card_id int primary key,
    sex varchar(30) not null ,
    email varchar(30),
    mobile_number varchar(30) not null,
    bonuses int not null
);

create table vendors(
    id int not null primary key ,
    name varchar(30) not null ,
    city varchar(30) not null
);

create table brands(
    id int not null primary key,
    title varchar(30) not null,
    country varchar(30) not null
);

create table products(
    title varchar(30) not null,
    upc int not null primary key,
    product_type_id int not null,
    sex varchar,
    size varchar(10),
    vendor_id int not null,
    description text,
    brand_id int not null,
    price int not null,
    bonus int,
    foreign key (vendor_id) references vendors(id),
    foreign key (brand_id) references brands(id)
);

create table product_types(
    id int not null primary key,
    title varchar(30) not null,
    season varchar
);

alter table products_in_stock add foreign key  (upc) references products(upc);

create table purchases(
    transaction_id int UNIQUE,
    upc int,
    date timestamp,
    client_id int,
    store_id int,
    amount int not null,
    price int,
    reduction int,
    summ int,
    foreign key (upc) references products(upc),
    foreign key (client_id) references clients(bonus_card_id),
    foreign key (store_id) references stores(id)
);

CREATE INDEX product_title ON products(title);
CREATE INDEX upc ON products(upc);
CREATE INDEX product_type_title ON product_types(title);
CREATE INDEX brandTitle ON brands(title);


insert into stores values(1,'Almaty','abaya 27',154);
insert into stores values(2,'Almaty','rosybakieva 17',186);
insert into stores values(3,'Astana','karasay batyra 45',96);
insert into stores values(4,'Atyrau','new york street 87',124);
insert into stores values(5,'Atyrau','new york street 89',128);

insert into vendors values(1,'TOO makarony','Almaty');
insert into vendors values(2,'TOO hozayushka','Astana');
insert into vendors values(3,'OOO qucherme','Moscow');
insert into vendors values(4,'IP Gulmarzhan','Shymkent');

insert into brands values(1,'Meteorit','Russia');
insert into brands values(2,'QASAQ','Kazakhstan');
insert into brands values(3,'FILA','France');
insert into brands values(4,'GUCCI','Italy');

insert into product_types values(1,'T-shirt','Summer');
insert into product_types values(2,'Jacket','Spring-Autumn');
insert into product_types values(3,'Down-bed','Winter');
insert into product_types values(4,'ball',null);

insert into products values('Jacket Gucci S21 Ultra',1111,2,'Male','XXL',3,'very good jacket',4,20000,2000);
insert into products values('1465 t-shirt limitary edition',1145,1,'Unisex','L',4,'very good t short',2,10000,1000);
insert into products values('Fila downbed 12 pro max',1457,3,'Female','M',2,'very good downbed',3,100000,12000);
insert into products values('a',1,2,'Male','XXL',3,'very good a',4,20000,2000);
insert into products values('b',2,1,'Unisex','L',4,'very good b',2,10000,1000);
insert into products values('c',3,3,'Female','M',2,'very good c',3,100000,12000);
insert into products values('d',4,2,'Male','XXL',3,'very good d',4,20000,2000);
insert into products values('e',5,1,'Unisex','L',4,'very good e',2,10000,1000);
insert into products values('f',6,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('g',7,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('h',8,2,'Male','XXL',3,'very good ',4,20000,2000);
insert into products values('l',9,1,'Unisex','L',4,'very good ',2,10000,1000);
insert into products values('m',10,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('n',11,2,'Male','XXL',3,'very good ',4,20000,2000);
insert into products values('o',12,1,'Unisex','L',4,'very good ',2,10000,1000);
insert into products values('k',13,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('y',14,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('mw',15,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('nw',16,2,'Male','XXL',3,'very good ',4,20000,2000);
insert into products values('ow',17,1,'Unisex','L',4,'very good ',2,10000,1000);
insert into products values('kw',18,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('yw',19,3,'Female','M',2,'very good ',3,100000,12000);
insert into products values('yws',20,3,'Female','M',2,'very good ',3,100000,12000);

insert into workers values(1,'Baga',1,'Kassir','Male',200000,'2000-01-01','87057894562');
insert into workers values(2,'Maga',2,'Kassir','Male',200000,'2000-01-01','87054877547');
insert into workers values(3,'Saga',3,'Kassir','Male',200000,'2000-01-01','87054585547');
insert into workers values(4,'Kaha',4,'Kassir','Male',200000,'2000-01-01','84751846754');

insert into products_in_stock values(1,1111,100);
insert into products_in_stock values(1,1145,100);
insert into products_in_stock values(1,1457,100);

insert into products_in_stock values(2,1111,100);
insert into products_in_stock values(2,1145,100);
insert into products_in_stock values(2,1457,100);

insert into products_in_stock values(3,1111,100);
insert into products_in_stock values(3,1145,100);
insert into products_in_stock values(3,1457,100);

insert into products_in_stock values(4,1111,100);
insert into products_in_stock values(4,1145,100);
insert into products_in_stock values(4,1457,100);

insert into clients values('Dias',1,'Male','dias@gmail.com','87081234567',0);
insert into clients values('Baha',2,'Male','baha@gmail.com','87081278567',0);
insert into clients values('Fara',3,'Male','fara@gmail.com','87081234767',0);
insert into clients values('Kura',4,'Female','kura@gmail.com','87081594567',0);

do
$$
    begin
        INSERT INTO purchases VALUES (1,1111, current_timestamp,1,1,15,20000,0,0);
        update clients set bonuses = bonuses + 2000 * 15 where bonus_card_id = 1;
        update purchases set summ = 20000 * purchases.amount where transaction_id = 1;
        update products_in_stock set amount = amount - 15 where store_id = 1 and upc = 1111;
    end;
$$;

do
$$
    begin
        INSERT INTO purchases VALUES (2,1145, current_timestamp,1,2,15,10000,0,0);
        update clients set bonuses = bonuses + 1000 * 15 where bonus_card_id = 1;
        update purchases set summ = 10000 * purchases.amount where transaction_id = 2;
        update products_in_stock set amount = amount - 15 where store_id = 2 and upc = 1145;
    end;
$$;

do
$$
    begin
        INSERT INTO purchases VALUES (3,1457, current_timestamp,1,3,15,100000,0,0);
        update clients set bonuses = bonuses + 12000 * 15 where bonus_card_id = 1;
        update purchases set summ = 100000 * purchases.amount where transaction_id = 3;
        update products_in_stock set amount = amount - 15 where store_id = 3 and upc = 1457;
    end;
$$;


do
$$
    begin
        INSERT INTO purchases VALUES (5,1111, current_timestamp,2,4,15,20000,0,0);
        update clients set bonuses = bonuses + 2000 * 15 where bonus_card_id = 2;
        update purchases set summ = 20000 * purchases.amount where transaction_id = 5;
        update products_in_stock set amount = amount - 15 where store_id = 4 and upc = 1111;
    end;
$$;

do
$$
    declare
        lim int;
        bal int;
    begin
        INSERT INTO purchases VALUES (4,1457, current_timestamp,1,3,15,100000,0,0);
        update purchases set summ = 100000 * purchases.amount where transaction_id = 4;
        update products_in_stock set amount = amount - 15 where store_id = 3 and upc = 1457;
        select bonuses into bal from clients where bonus_card_id = 1;
        select summ into lim from purchases where transaction_id = 4;

        if bal <= lim then
            update purchases set reduction = bal where transaction_id = 4;
            update purchases set summ = summ - bal where transaction_id = 4;
            update clients set bonuses = 0 where bonus_card_id=1;
        else
            update purchases set reduction = summ where transaction_id = 4;
            update purchases set summ = 0 where transaction_id = 4;
            update clients set bonuses = bonuses -  lim where bonus_card_id = 1;
        end if;
    end;
$$;


INSERT INTO purchases VALUES (6,1145, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (7,1457, current_timestamp,null,2,15,10000,0,150000);
INSERT INTO purchases VALUES (8,1145, current_timestamp,null,3,15,15000,0,225000);
INSERT INTO purchases VALUES (9,1, current_timestamp,null,5,15,12000,0,180000);
INSERT INTO purchases VALUES (10,2, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (11,3, current_timestamp,null,2,15,10000,0,150000);
INSERT INTO purchases VALUES (12,4, current_timestamp,null,3,15,15000,0,225000);
INSERT INTO purchases VALUES (13,5, current_timestamp,null,4,15,12000,0,180000);
INSERT INTO purchases VALUES (14,6, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (15,7, current_timestamp,null,2,15,10000,0,150000);
INSERT INTO purchases VALUES (16,1, current_timestamp,null,4,15,12000,0,180000);
INSERT INTO purchases VALUES (17,2, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (18,3, current_timestamp,null,2,15,10000,0,150000);
INSERT INTO purchases VALUES (19,4, current_timestamp,null,1,15,15000,0,225000);
INSERT INTO purchases VALUES (20,5, current_timestamp,null,4,15,12000,0,180000);
INSERT INTO purchases VALUES (21,6, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (22,7, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (23,1145, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (24,1457, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (25,1145, current_timestamp,null,1,15,15000,0,225000);
INSERT INTO purchases VALUES (26,8, current_timestamp,null,1,15,12000,0,180000);
INSERT INTO purchases VALUES (27,9, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (28,10, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (29,11, current_timestamp,null,1,15,15000,0,225000);
INSERT INTO purchases VALUES (30,12, current_timestamp,null,1,15,12000,0,180000);
INSERT INTO purchases VALUES (31,13, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (32,14, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (33,15, current_timestamp,null,1,15,12000,0,180000);
INSERT INTO purchases VALUES (34,16, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (35,17, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (36,18, current_timestamp,null,1,15,15000,0,225000);
INSERT INTO purchases VALUES (37,19, current_timestamp,null,1,15,12000,0,180000);
INSERT INTO purchases VALUES (38,20, current_timestamp,null,1,15,10000,0,150000);
INSERT INTO purchases VALUES (39,20, current_timestamp,null,1,15,10000,0,150000);




select purchases.upc, purchases.store_id, sum(purchases.amount), products.title
from purchases, products where store_id=1 and purchases.upc=products.upc
group by purchases.upc, products.title, purchases.store_id
order by sum(purchases.amount) desc
limit 20;

select purchases.upc , purchases.store_id, sum(purchases.amount), products.title
from purchases, products where store_id=2 and purchases.upc=products.upc
group by purchases.upc, products.title, purchases.store_id
order by sum(purchases.amount) desc
limit 20;

select purchases.upc, purchases.store_id, sum(purchases.amount), products.title
from purchases, products where store_id=3 and purchases.upc=products.upc
group by purchases.upc, products.title, purchases.store_id
order by sum(purchases.amount) desc
limit 20;

select purchases.upc, purchases.store_id, sum(purchases.amount), products.title
from purchases, products where store_id=4 and purchases.upc=products.upc
group by purchases.upc, products.title, purchases.store_id
order by sum(purchases.amount) desc
limit 20;

select purchases.upc, purchases.store_id, sum(purchases.amount), products.title
from stores, purchases, products where city='Almaty' and purchases.upc=products.upc and purchases.store_id=stores.id
group by stores.city, purchases.upc, products.title, purchases.store_id
order by sum(purchases.amount) desc
limit 20;

select purchases.upc, purchases.store_id, sum(purchases.amount), products.title
from stores, purchases, products where city='Astana' and purchases.upc=products.upc and purchases.store_id=stores.id
group by stores.city, purchases.upc, products.title, purchases.store_id
order by sum(purchases.amount) desc
limit 20;

select purchases.upc, purchases.store_id, sum(purchases.amount), products.title
from stores, purchases, products where city='Atyrau' and purchases.upc=products.upc and purchases.store_id=stores.id
group by stores.city, purchases.upc, products.title, purchases.store_id
order by sum(purchases.amount) desc
limit 20;


select purchases.store_id, sum(purchases.amount)
from purchases
group by purchases.store_id
order by sum(purchases.amount) desc
limit 5;

SELECT product_types.title
FROM product_types
WHERE product_types.title in (SELECT pt.title FROM product_types pt
                                INNER JOIN products
                                    ON products.product_type_id = pt.id
                                INNER JOIN purchases
                                    ON purchases.upc = products.upc
                              WHERE pt.title != 'ball'
)
LIMIT 3







