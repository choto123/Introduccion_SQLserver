create database Actividad2

use Actividad2

create table Libro(
id_libro int primary key identity(1,1)not null,
Titulo nvarchar(15)not null,
id_editorial int not null,
area nvarchar(15)
)
create table Autor(
id_autor int primary key identity(1,1)not null,
Nombre nvarchar(15)not null,
Nacionalidad nvarchar(15)not null
)

create table Lector(
id_lector int primary key identity(1,1)not null,
Dni varchar(25)not null,
Direccion nvarchar(30),
Carrera varchar(15)not null,
Edad int not null,
Telefono varchar(15)not null
)
create table Editorial(
id_editorial int primary key identity(1,1)not null,
Nombre nvarchar(15)not null
)
create table LibroAutor(
id_autor int not null,
id_libro int not null,
constraint libroAutor_Autor foreign key (id_autor) references Autor(id_autor),
constraint libroAutor_libro foreign key (id_libro) references Libro(id_libro)
)

create table Prestamo(
id_lector int not null,
id_libro int not null,
fecha_prestamo date not null,
fecha_devolucion date not null,
constraint Prestamo_Lector foreign key (id_Lector) references Lector(id_Lector),
constraint Prestamo_libro foreign key (id_libro) references Libro(id_libro)
)

insert into Libro(Titulo, id_editorial, area)
values('Juancho Paisa', 1,'')

insert into Autor(Nombre, Nacionalidad)
values('Jaime Calle', 'Española')

insert into Editorial(Nombre)
values('Matarin')

insert into Lector(Dni, Direccion, Carrera,Edad,Telefono)
values('321878621', 'calle 23 #32-4','ingenieria',18,'12357152')

insert into Prestamo(id_libro, id_lector, fecha_devolucion)
values(1,1,2021-03-16, 2021-07-16)