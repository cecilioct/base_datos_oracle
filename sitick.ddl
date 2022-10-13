--
-- Estructura de tabla para la tabla departamento
--
CREATE TABLE departamento (
  departamento_id Number(11) NOT NULL,
  nombre varchar2(50)  NOT NULL,
  CONSTRAINT departamento_pk PRIMARY KEY(departamento_id)
);

CREATE SEQUENCE seq_departamento_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_departamento_id BEFORE
    INSERT ON departamento
    FOR EACH ROW

BEGIN
    :new.departamento_id := seq_departamento_id.nextval;
END;
/
--
-- Estructura de tabla para la empresa
--
CREATE TABLE empresa (
  empresa_id Number(11) NOT NULL,
  nombre varchar2(30)  NOT NULL,
  razon_social varchar2(40) NOT NULL,
  CONSTRAINT empresa_pk PRIMARY KEY(empresa_id)
);
CREATE SEQUENCE seq_empresa_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_empresa_id BEFORE
    INSERT ON empresa
    FOR EACH ROW

BEGIN
    :new.empresa_id := seq_empresa_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla puesto
--
CREATE TABLE puesto(
  puesto_id Number(11) NOT NULL,
  nombre varchar2(50) NOT NULL,  --detalle aquí
  CONSTRAINT puesto_pk PRIMARY KEY(puesto_id)
);
CREATE SEQUENCE seq_puesto_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_puesto_id BEFORE
    INSERT ON puesto
    FOR EACH ROW

BEGIN
    :new.puesto_id := seq_puesto_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla contacto
--
CREATE TABLE contacto (
  contacto_id Number(11) NOT NULL,
  nombre varchar2(30)  NOT NULL,
  apellido varchar2(30)  NOT NULL,
  sexo varchar2(10)  NOT NULL,
  edad Number(10) NOT NULL,
  correo varchar2(70)  NOT NULL,
  telefono varchar2(15)  NOT NULL,
  siglas varchar2(15)  NOT NULL,
  horario_entrada TIMESTAMP NOT NULL,
  horario_salida TIMESTAMP NOT NULL,
  empresa_id Number(11) NOT NULL,
  departamento_id Number(11) DEFAULT NULL,
  puesto_id Number(11) DEFAULT NULL,
  reporta_a Number(11) DEFAULT NULL,
  CONSTRAINT contacto_pk PRIMARY KEY(contacto_id),
  CONSTRAINT cont_emp_fk FOREIGN KEY (empresa_id) REFERENCES empresa (empresa_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT cont_dep_fk FOREIGN KEY (departamento_id) REFERENCES departamento (departamento_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT cont_pue_fk FOREIGN KEY (puesto_id) REFERENCES puesto (puesto_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT cont_con_fk FOREIGN KEY (reporta_a) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE --detalle aqui

);
CREATE SEQUENCE seq_contacto_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_contacto_id BEFORE
    INSERT ON contacto
    FOR EACH ROW

BEGIN
    :new.contacto_id := seq_contacto_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla role
--
CREATE TABLE role (
  role_id Number(11) NOT NULL,
  titulo varchar2(50)  NOT NULL,
  CONSTRAINT role_pk PRIMARY KEY(role_id)

);
CREATE SEQUENCE seq_role_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_role_id BEFORE
    INSERT ON role
    FOR EACH ROW

BEGIN
    :new.role_id := seq_role_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla role
--
CREATE TABLE estado_cuenta (
  estado_cuenta_id Number(11) NOT NULL,
  titulo varchar2(30)  NOT NULL,
  CONSTRAINT estado_cuenta_pk PRIMARY KEY(estado_cuenta_id)
);
CREATE SEQUENCE seq_estado_cuenta_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_estado_cuenta_id BEFORE
    INSERT ON estado_cuenta
    FOR EACH ROW

BEGIN
    :new.estado_cuenta_id := seq_estado_cuenta_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla role
--
CREATE TABLE usuario (
  usuario_id Number(11) NOT NULL, --detalle aqui
  nombre_usuario varchar2(50)  NOT NULL,
  contrasenia varchar2(30)  NOT NULL,
  role_id Number(11) NOT NULL,
  cuenta_id Number(11) DEFAULT NULL,
  estado_cuenta_id Number(10) NOT NULL,
  CONSTRAINT usuario_pk PRIMARY KEY(usuario_id)
  CONSTRAINT usu_rol_fk FOREIGN KEY (role_id) REFERENCES role (role_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT usu_cue_fk FOREIGN KEY (cuenta_id) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT usu_est_fk FOREIGN KEY (estado_cuenta_id) REFERENCES estado_cuenta (estado_cuenta_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE SEQUENCE seq_usuario_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_usuario_id BEFORE
    INSERT ON usuario
    FOR EACH ROW

BEGIN
    :new.usuario_id := seq_usuario_id.nextval;
END;
/
--
--
--
-------------
--
-- Estructura de tabla para la tabla tipo_ticket
--
CREATE TABLE tipo_ticket(
  tipo_ticket_id Number(11) NOT NULL,
  nombre varchar2(20) NOT NULL,
  CONSTRAINT tipo_ticket_pk PRIMARY KEY(tipo_ticket_id)
);
CREATE SEQUENCE seq_tipo_ticket_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_tipo_ticket_id BEFORE
    INSERT ON tipo_ticket
    FOR EACH ROW

BEGIN
    :new.tipo_ticket_id := seq_tipo_ticket_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla estado_ticket
--
CREATE TABLE estado_ticket (
  estado_ticket_id Number(11) NOT NULL,
  titulo varchar2(30)  NOT NULL,
  color varchar2(20)  NOT NULL,
  CONSTRAINT estado_ticket_pk PRIMARY KEY(estado_ticket_id)
);
CREATE SEQUENCE seq_estado_ticket_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_estado_ticket_id BEFORE
    INSERT ON estado_ticket
    FOR EACH ROW

BEGIN
    :new.estado_ticket_id := seq_estado_ticket_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla prioridad_ticket
--
CREATE TABLE prioridad_ticket (
  prioridad_ticket_id Number(11) NOT NULL,
  titulo varchar2(30)  NOT NULL,
  tiempo_respuesta varchar2(30)  NOT NULL,
  tiempo_resolucion varchar2(30)  NOT NULL,
  CONSTRAINT prioridad_ticket_pk PRIMARY KEY(prioridad_ticket_id)
);
CREATE SEQUENCE seq_prioridad_ticket_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_prioridad_ticket_id BEFORE
    INSERT ON prioridad_ticket
    FOR EACH ROW

BEGIN
    :new.prioridad_ticket_id := seq_prioridad_ticket_id.nextval;
END;
/
--
-- Estructura de tabla para la tabla ticket
--
CREATE TABLE ticket (
  ticket_id Number(11) NOT NULL,
  asunto varchar2(40) NOT NULL,
  tipo_ticket_id Number(11) NOT NULL,
  producto_servicio varchar2(40)  NOT NULL,
  descripcion varchar2(255)  NOT NULL,
  cliente varchar2(60)  NOT NULL,
  correo varchar2(70)  NOT NULL,
  empresa varchar2(60)  NOT NULL,
  fecha_apertura date DEFAULT NULL,
  fecha_cierre date DEFAULT NULL,
  fecha_actualización date DEFAULT NULL,
  hora_actualizacion timestamp(6) DEFAULT NULL,
  actualizado_por varchar2(60)  DEFAULT NULL,
  prioridad_ticket_id Number(11) NOT NULL,
  estado_ticket_id Number(11) DEFAULT NULL,
  CONSTRAINT ticket_pk PRIMARY KEY(ticket_id),
  CONSTRAINT tic_tit_fk FOREIGN KEY (tipo_ticket_id) REFERENCES tipo_ticket (tipo_ticket_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT tic_pri_fk FOREIGN KEY (prioridad_ticket_id) REFERENCES prioridad_ticket (prioridad_ticket_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT tic_est_fk FOREIGN KEY (estado_ticket_id) REFERENCES estado_ticket (estado_ticket_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE SEQUENCE seq_ticket_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_ticket_id BEFORE
    INSERT ON ticket
    FOR EACH ROW

BEGIN
    :new.ticket_id := seq_ticket_id.nextval;
END;
/
--
--
-- Estructura de tabla para la tabla equipo_trabajo
--
CREATE TABLE equipo_trabajo (
  equipo_trabajo_id Number(11) NOT NULL,
  consultor_id Number(11) NOT NULL,
  jerarquia Number(10) NOT NULL,
  ticket_id Number(10) NOT NULL,
  CONSTRAINT equipo_trabajo_pk PRIMARY KEY(equipo_trabajo_id),
  CONSTRAINT eqt_con_fk FOREIGN KEY (consultor_id) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT eqt_tic_fk FOREIGN KEY (ticket_id) REFERENCES ticket (ticket_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE SEQUENCE seq_equipo_trabajo_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_equipo_trabajo_id BEFORE
    INSERT ON equipo_trabajo
    FOR EACH ROW

BEGIN
    :new.equipo_trabajo_id := seq_quipo_trabajo_id.nextval;
END;
--
