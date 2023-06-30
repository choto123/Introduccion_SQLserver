--Creamos una base de datos
create database Biblioteca

use Biblioteca

--creamos tabla para Libros
create table Libros(
id_libro int primary key identity (1,1)not null,
Titulo_libro nvarchar(15)not null,
Editorial nvarchar(15)not null,
Area nvarchar(15)not null
)
--creamos tabla para Autor
create table Autor(
id_autor  int primary key identity (1,1)not null,
Nombre nvarchar(12) not null,
Nacionalidad nvarchar(12)not null
)
--creamos tabla para Editorial
create table Editorial(
id_editorial int primary key identity (1,1)not null,
Nombre nvarchar(15)not null
)

--creamos tabla de Lector
create table Lector(
id_lector int primary key identity(1,1)not null,
DNI varchar(15)not null,
Direccion nvarchar(25)not null,
Carrera nvarchar(12)not null,
Edad int not null,
Telefono varchar(15)not null
)
--creamos tabla para Prestamo
create table Prestamo(
id_lector int not null,
id_libro int not null,
FechaPrestamo date not null,
FechaDevolucion date not null
)
--creamos tabla para libroAutor
create table LibroAutor(
idAutor int not null,
idLibro int not null,
constraint Libro_Autor foreign key (idAutor) references Autor(id_autor),
constraint Libro_Libro foreign key (idAutor) references Libros(id_libro)
)
--editar la tabla lector, adicionando el email
alter table Lector
add Email nvarchar(25)

--Llenamos todos los datos 10 veces
--Autor
insert into Autor(Nombre, Nacionalidad)values
('juan','venezuela'),
('andres','comlombia'),
('esteban','peru'),
('emiliano','brazil'),
('matias','portugal'),
('david','españa'),
('oscar','rusia'),
('estiven','colombiana'),
('sofia','americana'),
('andrea','venezuela')

--Editorial
insert into Editorial(Nombre)values
('Az Editora'),
('EdiMend'),
('Crear Ediciones'),
('Crear Ediciones'),
('EdiMend'),
('Ediciones Bromera'),
('Ediciones de la U'),
('Ediciones Paraninfo'),
('EdiMend'),
('EdiMend')

--Lector
insert into Lector(DNI,Direccion,Carrera,Edad,Telefono,Email)values
('12984','calle 18n 81-92','ingenieria',18 ,'3826763','esteban.orti@gmail.com'),
('51245','carrera 78a 81-92','arquitectura',16 ,'728381','juan.sanchez@gmail.com'),
('523215','calle 98ss 81-92','gastronomia',11 ,'28189','andres.toro@gmail.com'),
('531566','calle 28b 81-92','diseño',19 ,'827891','jaime.alvarez@gmail.com'),
('5352','diagonal 38aa 81-92','ingenieria',28 ,'8927389','andrea.salama@gmail.com'),
('6433','calle 48ab 81-92','arquitectura',38 ,'1232184','paola.mcqeen@gmail.com'),
('8973245','calle 58s 81-92','arquitectura',22 ,'826741','sergio.cordoba@gmail.com'),
('857938','calle 65b 81-92','diseño',41 ,'786214','tomas.ramirez@gmail.com'),
('837458','calle 73i 81-92','ingenieria',24 ,'87427198','stiven.tascon@gmail.com'),
('87532','calle 78o 81-92','diseño',15 ,'894261','jose.restrepo@gmail.com')

--libro
insert into Libros(Titulo_libro,Editorial,Area)values
('el llamdo leo','Az Editora','guerra'),
('el verdugo','EdiMend','filosofia'),
('vladimir','Crear Ediciones','informativo'),
('alistar','Crear juiwnui','educativo'),
('poppy','Editorial juan','narrativo'),
('mañas ru','Editorial san','guerra'),
('el rey leon','Ediciones upa','obra teatral'),
('el principito','Ediciones ino','relatos'),
('niños calle','EdiMend','fantasia'),
('frijolito','Edifo','historia')

--lbroautor
insert into LibroAutor(idAutor,idLibro)values
(1,20),
(2,21),
(3,22),
(4,23),
(5,24),
(6,25),
(7,26),
(8,27),
(9,28),
(10,29)

--prestamo
insert into Prestamo(id_lector,id_libro,FechaPrestamo,FechaDevolucion)values
(1,20,'2023/06/12','2023/06/01'),
(2,21,'2023/02/21','2023/06/05'),
(3,22,'2023/03/25','2023/07/07'),
(4,23,'2023/05/10','2023/03/03'),
(5,24,'2023/03/19','2023/01/13'),
(6,25,'2023/01/13','2023/03/19'),
(7,26,'2023/03/03','2023/05/10'),
(8,27,'2023/07/07','2023/03/25'),
(9,28,'2023/06/05','2023/02/21'),
(10,29,'2023/06/01','2023/06/12')