create database veterinaria;

use veterinaria;

create table animal
(
	id_animal int primary key auto_increment,
    descripcion varchar(25)
);

create table raza
(
	id_raza int primary key auto_increment,
    descripcion varchar(25),
    id_animal int,
    foreign key(id_animal) references animal(id_animal)
);

create table cliente
(
	id_cliente int primary key auto_increment,
    nombre varchar(50),
    apellido varchar(50),
    usuario varchar(25),
    pass varchar(25)
);

create table mascota
(
	id_mascota int primary key auto_increment,
    edad int,
    peso decimal(8,2),
    id_raza int,
    id_cliente int,
    foreign key(id_raza) references raza(id_raza),
    foreign key(id_cliente) references cliente(id_cliente)
);

create table veterinario
(
	id_veterinario int primary key auto_increment,
    nombre varchar(50),
    apellido varchar(50)
);

create table tipo_servicio
(
	id_tipo int primary key auto_increment,
    descripcion varchar(25)
);

create table servicio
(
	id_servicio int primary key auto_increment,
    descripcion varchar(25),
    costo decimal(8,2),
    stock int,
    id_tipo int,
    foreign key(id_tipo) references tipo_servicio(id_tipo)
);

create table cab_boleta
(
	num_boleta int primary key auto_increment,
    fecha_boleta date,
    total_boleta decimal(8,2),
    id_cliente int,
    id_veterinario int,
    foreign key(id_cliente) references cliente(id_cliente),
    foreign key(id_veterinario) references veterinario(id_veterinario)
);

create table det_boleta
(
	num_boleta int,
	id_mascota int,
    id_servicio int,
    cantidad int,
    costoxpeso decimal(8,2),
    importe decimal(8,2),
    primary key(num_boleta, id_mascota, id_servicio),
    foreign key(num_boleta) references cab_boleta(num_boleta),
    foreign key(id_mascota) references mascota(id_mascota),
    foreign key(id_servicio) references servicio(id_servicio)
);

/*****************************************************************************************/
/*****************************PROCEDIMIENTOS ALMACENADOS**********************************/
/*****************************************************************************************/
use veterinaria;
/************************/
/*********Animal*********/
/************************/

/*Listar*/
DELIMITER //
create procedure usp_listar_animal()
begin
	select * from animal;
end;
//DELIMITER ;

/*Insertar*/
DELIMITER //
create procedure usp_insert_animal(
	in p_descripcion varchar(25)
)
begin
	insert into animal(descripcion) values(p_descripcion);
end;
//DELIMITER ;

/*Update*/
DELIMITER //
create procedure usp_update_animal(
	in p_descripcion varchar(25),
    in p_id_animal int
)
begin
	update animal set 
    descripcion = p_descripcion
    where id_animal = p_id_animal;
end;
//DELIMITER ;

/*Obtener*/
DELIMITER //
create procedure usp_get_animal(
	in p_id_animal int
)
begin
	select * from animal
    where id_animal = p_id_animal;
end;
//DELIMITER ;

/*Buscar*/
DELIMITER //
create procedure usp_buscar_animal(
	in p_valor varchar(25)
)
begin
	select * from animal
    where descripcion like concat('%',p_valor,'%');
end;
//DELIMITER ;

/*Delete*/
DELIMITER //
create procedure usp_eliminar_animal(
	in p_id_animal int
)
begin
	delete from animal
    where id_animal = p_id_animal;
end;
//DELIMITER ;

/************************/
/**********Raza**********/
/************************/

/*Listar*/
DELIMITER //
create procedure usp_listar_raza()
begin
	select * from raza;
end;
//DELIMITER ;

/*Insertar*/
DELIMITER //
create procedure usp_insert_raza(
	in p_descripcion varchar(25),
	in p_id_animal int
)
begin
	insert into raza(descripcion, id_animal) values(p_descripcion, p_id_animal);
end;
//DELIMITER ;

/*Update*/
DELIMITER //
create procedure usp_update_raza(
	in p_descripcion varchar(25),
	in p_id_animal int,
    in p_id_raza int
)
begin
	update raza set
    descripcion = p_descripcion,
    id_animal = p_id_animal
    where id_raza = p_id_raza;
end;
//DELIMITER ;

/*Obtener*/
DELIMITER //
create procedure usp_get_raza(
	in p_id_raza int
)
begin
	select * from raza 
    where id_raza = p_id_raza;
end;
//DELIMITER ;

/*Buscar*/
DELIMITER //
create procedure usp_buscar_raza(
	in p_valor varchar(25)
)
begin
	select * from raza 
    where descripcion like concat('%',p_valor,'%');
end;
//DELIMITER ;

/*Delete*/
DELIMITER //
create procedure usp_eliminar_raza(
	in p_id_animal int
)
begin
	delete from raza
    where id_animal = p_id_animal;
end;
//DELIMITER ;

/************************/
/*********Cliente********/
/************************/

/*Listar*/
DELIMITER //
create procedure usp_listar_cliente()
begin
	select * from cliente;
end;
//DELIMITER ;

/*Insertar*/
DELIMITER //
create procedure usp_insert_cliente(
	in p_nombre varchar(50),
    in p_apellido varchar(50),
    in p_usuario varchar(25),
    in p_pass varchar(25)
)
begin
	insert into cliente(nombre, apellido, usuario, pass)
    values(p_nombre, p_apellido, p_usuario, p_pass);
end;
//DELIMITER ;

/*Update*/
DELIMITER //
create procedure usp_update_cliente(
	in p_nombre varchar(50),
    in p_apellido varchar(50),
    in p_usuario varchar(25),
    in p_pass varchar(25),
    in p_id_cliente int
)
begin
	update cliente set
    nombre = p_nombre,
    apellido = p_apellido,
    usuario = p_usuario,
    pass = p_pass
    where id_cliente = p_id_cliente;
end;
//DELIMITER ;

/*Obtener*/
DELIMITER //
create procedure usp_get_cliente(
	in p_id_cliente int
)
begin
	select * from cliente
    where id_cliente = p_id_cliente;
end;
//DELIMITER ;

/*Buscar*/
DELIMITER //
create procedure usp_buscar_cliente(
	in p_valor varchar(50)
)
begin
	select * from cliente
    where 	nombre like concat('%',p_valor,'%') or
			apellido like concat('%',p_valor,'%');
end;
//DELIMITER ;

/*Delete*/
DELIMITER //
//DELIMITER ;