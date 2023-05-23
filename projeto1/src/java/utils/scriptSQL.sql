CREATE TABLE Marca(
codigomarca serial not null primary key,
nomemarca varchar(80)
);
CREATE TABLE Produto(
codigoproduto serial not null primary key,
nomeproduto varchar(80),
codigomarca integer references Marca(codigomarca)
);
CREATE TABLE usuario(
codigousuario serial primary key,
nomeusuario varchar (80) not null,
cpfusuario varchar(80) not null,
senhausuario varchar(80) not null
);
