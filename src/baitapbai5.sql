create database BaiTap05Views;
use BaiTap05Views;
create table products
(
    id                 int,
    productCode        int,
    productName        varchar(255),
    productPrice       int,
    productAmount      int,
    productDescription varchar(255),
    productStatus      varchar(255)
);

create unique index pr_code on products (productCode);

create index compositIndex on products (productName, productPrice);
explain select productAmount
from products
where productName = 'DEN VAU'
  and productPrice = 100;

create view productss as
select *
from products;

create or replace view productss as
select id, productPrice, productCode, productName, productAmount
from products;

update BaiTap05Views.productss
set id = 11
where productCode = 5;

delimiter //

create procedure selectall()
begin
select * from products;
end //
delimiter ;

call selectall();

delimiter //

create procedure creatNewProduct(id int, p_code int, p_name varchar(255), p_price int)
begin
insert into products(id, productCode, productName, productPrice) value (id, p_code, p_name, p_price);
end //

delimiter ;

call creatNewProduct(11,9,'n',30000);

delimiter //
create procedure editProduct(ids int, p_code int, p_name varchar(255), p_price int)
begin
update products set productCode = p_code, productName = p_name, productPrice = p_price where id= ids;
end //
delimiter ;

call editProduct(6,5,'a',50);

delimiter //
create procedure deleteProduct(ids int)
begin
delete from products where id = ids;
end //
delimiter ;

call deleteProduct(12);
call deleteProduct(8);