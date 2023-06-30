--creamos la base de datos para una factura

/*putnto1*/
/*Creamos la base de datos*/
create database Actividad1

/*usamos la base de datos*/
use Actividad1

/*putnto2*/
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
/*aqui podemos agregar las columnas que necesitemos en la tabla que quieran*/
alter table Articulo
add NombreArticulo nvarchar(15)

/*para mostrar la tabla que necesitemos*/
select*
from Articulo

/*para llenar los datos para clientes*/
insert into	Cliente(Cedula,Direccion,Celular,Email,Saldo_trim1,Saldo_trim2,Saldo_trim3,Nombre,Apellido,Telefono_fijo)
values('8781627','carrera 56d #69c-42','98217898','sofia.mejia@gmail.com', 2266, 42500, 90200,'sofia','mejia','7128638')

/*para llenar los datos para Articulos*/
insert into	Articulo(Descripcion,Precio,Existencia,categoria,Stock,NombreArticulo)
values('Papas de limon Margarita',2500 ,180 ,'bebida alcohol',200,'margarita limon')

/*para llenar los datos para el pedido*/
insert into	Pedido(id_cliente, fecha, id_vendedor)
values(19,'2023-9-21',10)

/*para llenar los datos para vendedores*/
insert into	Vendedor(Nombre, Apellido, Direccion, Telefono, Email, Cuota, Ventas)      
values('sofia', 'sanchez','carrera 21c #978-12','2321314','sofia.sanchez@gmail.com',8,487)

/*para llenar los datos para DetallePedido*/
insert into	DetallePedido( id_pedido,id_articulo,Cantidad)
values(10,14,52)

alter table Articulo
drop column NombreArticulo

