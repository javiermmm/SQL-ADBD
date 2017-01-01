create table Cliente
(IdCliente CHAR(10) PRIMARY KEY,
 Nombre VARCHAR(25) NOT NULL,
 Direccion VARCHAR(60) NOT NULL,
 NumTC CHAR(16) NOT NULL);
 
create table Pedido
(IdPedido CHAR(10) PRIMARY KEY,
 IdCliente CHAR(10) NOT NULL REFERENCES Cliente on delete cascade,
 FechaPedido DATE NOT NULL,
 FechaExped DATE);

create table Autor
( idautor NUMBER PRIMARY KEY,
  Nombre VARCHAR(25));

create table Libro
(ISBN CHAR(15) PRIMARY KEY,
Titulo VARCHAR(60) NOT NULL,
Año CHAR(4) NOT NULL,
PrecioCompra NUMBER(6,2) DEFAULT 0,
PrecioVenta NUMBER(6,2) DEFAULT 0);

create table Autor_Libro
(ISBN CHAR(15),
Autor NUMBER,
CONSTRAINT al_PK PRIMARY KEY (ISBN, Autor),
CONSTRAINT libroA_FK FOREIGN KEY (ISBN) REFERENCES Libro on delete cascade,
CONSTRAINT autor_FK FOREIGN KEY (Autor) REFERENCES Autor);


create table Libros_Pedido(
ISBN CHAR(15),
IdPedido CHAR(10),
Cantidad NUMBER(3) CHECK (cantidad >0),
CONSTRAINT lp_PK PRIMARY KEY (ISBN, idPedido),
CONSTRAINT libro_FK FOREIGN KEY (ISBN) REFERENCES Libro on delete cascade,
CONSTRAINT pedido_FK FOREIGN KEY (IdPedido) REFERENCES Pedido on delete cascade);
