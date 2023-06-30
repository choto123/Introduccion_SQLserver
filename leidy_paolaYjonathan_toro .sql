/*putnto1*/
/*Creamos la base de datos*/
create database Ventas

/*usamos la base de datos*/
use Ventas

/*																			putnto2*/
/*creamos la tabla para los clientes*/
create table Cliente(
id_cliente int primary key identity(1,1) not null,
Cedula varchar(30) not null,
Direccion nvarchar(50) null,
Celular varchar(15) null,
Email nvarchar(80) default('desconocido'),
Saldo_trim1 decimal(10,2),
Saldo_trim2 decimal(10,2),
Saldo_trim3 decimal(10,2)
)
/*creamos la tabla para el vendedor*/
create table Vendedor(
id_vendedor int primary key identity(1,1)not null,
Nombre nvarchar(15)not null,
Apellido nvarchar(15)not null,
Direccion nvarchar(50),
Telefono varchar(15) null,
Email nvarchar(80) default('desconocido'),
Cuota decimal(10,2),
Ventas decimal(10,2)
)

/*creamos la tabla para los articulos*/
create table Articulo(
id_articulo int primary key identity(1,1)not null,
NombreArticulo nvarchar(30) not null,
Descripcion varchar(200),
Precio decimal(10,2)not null check(precio>=0.00),
Existencia int,
categoria varchar(80) not null
)

/*creamos la tabla para los pedidos*/
create table Pedido(
id_pedido int primary key identity(1,1)not null,
id_cliente int not null,
fecha date,
id_vendedor int not null,
constraint pedido_cliente foreign key (id_cliente)references Cliente(id_cliente),
constraint pedido_articulo foreign key (id_vendedor)references Vendedor(id_vendedor)
)

/*creamos la tabla para los detalles de los pedidos*/
create table DetallePedido(
id_pedido int not null,
id_articulo int not null,
Cantidad int check(Cantidad>=0),
primary key(id_pedido,id_articulo),
constraint detallePedido_pedido foreign key (id_pedido)references Pedido(id_pedido),
constraint detallePedido_articulo foreign key (id_articulo)references Articulo(id_articulo)
)

--                                                                    Final Punto2

--																		Inicio Punto4 Modificar
/*aqui podemos agregar las columnas que necesitemos en la tabla clientes*/
alter table Cliente
add Nombre nvarchar(15)

alter table Cliente
add Apellido nvarchar(15)

alter table Cliente
add Telefono_fijo varchar(30)

/*aqui podemos agregar las columnas que necesitemos en la tabla Articulo*/
alter table Articulo
add Stock int not null
--																	Final Punto4

--																	Inicio Punto5
/*para llenar los datos para clientes*/
insert into	Cliente(Cedula,Direccion,Celular,Email,Saldo_trim1,Saldo_trim2,Saldo_trim3,Nombre,Apellido,Telefono_fijo)
values('8781627','carrera 56d #69c-42','98217898','sofia.mejia@gmail.com', 2266, 42500, 90200,'sofia','mejia','7128638'),
('1286987125', 'calle 10 n 47','3214469874','marioflorez@hotmail.com',2250,1500,9749,'mario', 'flores','12341245'),
('7126987783', 'cra 48 s 10','3154569852','susanaquintero@hotmail.com',5200,1500,3215,'susana','quintero','1244512'),
('3586987122', 'cra 45 ab 120','3184569825','linarios@hotmail.com',3500,1000,2345,'lina','rios','124512'),
('1586987789', 'cra 89 aa 218','3224569888','juansanchez@hotmail.com',6500,3550,9782,'juan','sanchez','162353'),
('4896987358', 'cra 11 q 874','3104569456','josediaz11@hotmail.com',8200,3950,1234,'jose','diaz','124643'),
('4126987147', 'cra 60 l 479','3114569258','marianaromero@hotmail.com',6800,3900,2876,'mariana','romero','978462'),
('3566987125', 'cra 72 s 98','3124569357','luzgomez@hotmail.com', 8900,3100,1004,'luz','gomez','28765412'),
('1896987278', 'cra 69 a 185','3184569452','danielquintero@hotmail.com',1300,3400,8600,'daniel','quintero','974828'),
('1786987454', 'cra 91 k 2','3204569357','luisaarias@hotmail.com',2330,3250,9400,'luisa','arias','884628')


/*para llenar los datos para Articulos*/
insert into	Articulo(Descripcion,Precio,Existencia,categoria,Stock,NombreArticulo)
values('Papas de limon Margarita',2500 ,180 ,'A',200,'margarita limon'),
('cafe colcafe tarro de 500 G',5.000,20,'A',45,'colcafe'),
('azucar morena  de 400 G', 6.000,30,'B',40,'azucar'),
('sal la reina de 500 G', 7.000,40,'C',70,'sal'),
('aceite la buena mesa de 1000 G', 8.000,20,'D',45,'aceite'),
('arroz diana de 600 G', 4.000,50,'E',90,'arroz'),
('pasta larga de 300 G', 2.000,60,'G',89,'pasta'),
('coca cola 3 litros', 1.000,10,'H',32,'coca cola'),
('queso colanta 500 G', 8.000,60,'I',74,'queso'),
('jamon pietran de 300 G', 9.000,20,'J',32,'jamon')


/*para llenar los datos para el pedido*/
insert into	Pedido(id_cliente, fecha, id_vendedor)
values(1,'2023/06/12',1),
(2,'2023/02/21',2),
(3,'2023/03/25',3),
(4,'2023/05/10',4),
(5,'2023/03/19',5),
(6,'2023/01/13',6),
(7,'2023/03/03',7),
(8,'2023/07/07',8),
(9,'2023/06/05',9),
(10,'2023/06/01',10)

/*para llenar los datos para DetallePedido*/
insert into DetallePedido(id_pedido,id_articulo,Cantidad)
values
(3,1,10),
(4,2,20),
(5,3,30),
(6,4,40),
(7,5,50),
(8,6,60),
(9,7,70),
(10,8,80),
(11,9,90),
(12,10,76)

/*para llenar los datos para vendedores*/
insert into	Vendedor(Nombre, Apellido, Direccion, Telefono, Email, Cuota, Ventas)      
values('sofia', 'sanchez','carrera 21c #978-12','2321314','sofia.sanchez@gmail.com',8,487),
('andres','cepeda','carrera 45 n 78 15','6049632145','andrescepeda@hotmail.com',4, 5.000),
('carolina','gomez','calle 64 n 25 65','6029632145','carolinagomez@hotmail.com',7, 6.000),
('marlon','diaz','carrera 78 n 71 24','6079632145','marlondiaz@hotmail.com',3, 7.000),
('juan jose ','botero','calle 98 n 35 74','6039632145','juanjosebotero@hotmail.com',8, 2.000),
('diana','ruiz','carrera 35 n 17 38','6099632145','dianaruiz@hotmail.com',9, 3.000),
('leidy','pino','calle 125 n 45 21','6089632145','leidypino@hotmail.com',7, 4.000),
('milena','gomez','carrera 21 n 30 45','6049632145','milenagomez@hotmail.com',6, 6.000),
('jose','osorio','calle 68 n 14 74','6049632145','joseosorio@hotmail.com',8, 7.000),
('cristian','montoya','carrera 73 n 96 96','6079632145','cristianmontoya@hotmail.com',5, 9.000)

--																	Final Punto5

--																	Inicio Punto6 Consulta
/*para mostrar la tabla que necesitemos*/
select*
from Cliente

select Nombre,Email
from Cliente

select Existencia
from Articulo

select id_pedido
from DetallePedido

--punto2
select Nombre,Apellido,Cedula
from Cliente

--punto3
select distinct * from Articulo 
 
--punto 4
select *
from Pedido
where fecha = '2023/02/21'

--punto  5
select *
from Articulo
where not categoria ='G'

--punto 6
select *
from Cliente
where id_cliente < 5

--punto7
select *
from Articulo
where Existencia > 10 and categoria = 'A'

--punto 8
select *
from Pedido
where id_cliente = 5

--punto9
select *
from Cliente
order by Nombre

--punto 10
select *
from Cliente
order by  Nombre desc

--punto 11
select *
from Vendedor
where ventas > Cuota

--punto 12
select *
from Vendedor
where Nombre = 'f%'--NO HAY

--punto 13
select *
from Articulo
where Precio between 10000 and 100000--NO HAY

--punto 14
select *
from Articulo
where  Precio not between 10000 and 100000