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
-------------------------------------------------------------------------------
------------------------------Modulo Asignaciones------------------------------
-------------------------------------------------------------------------------
CREATE TABLE anexos (
  id_anexo NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  id_contrato number(25) NOT NULL,
  fecha_elab_anexo date NOT NULL,
  numero_empleado number(25) NOT NULL,
  nombre_archivo varchar2(40) NOT NULL,
  archivo_anexo varchar(100) NOT NULL,
  fecha_envio_cliente date DEFAULT NULL,
  fecha_aprob_cliente date DEFAULT NULL,
CONSTRAINT id_anexos_pk PRIMARY KEY(id_anexo)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE asignaciones (
  id_asignaciones NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  numero_cliente number(25) NOT NULL,
  numero_proyecto number(25) NOT NULL,
  aprobador number(25) NOT NULL,
  numero_supervisor number(25) NOT NULL,
  numero_consultor number(25) NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_fin date DEFAULT NULL,
CONSTRAINT id_asignaciones_pk PRIMARY KEY(id_asignaciones)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE asignacion_recurso (
  id_asign NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  num_empleado number(25) NOT NULL,
  num_recurso_mat number(25) NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_fin date DEFAULT NULL,
  fecha_entrega_recurso date NOT NULL,
  fecha_devolucion_recurso date DEFAULT NULL,
  observaciones varchar(100) NOT NULL,
CONSTRAINT id_asign_pk PRIMARY KEY(id_asign)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE contratos (
  id_contrato NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  numero_compania number(25) NOT NULL,
  numero_cliente number(25) NOT NULL,
  fecha_elaboracion date NOT NULL,
  numero_empleado number(25) NOT NULL,
  nombre_archivo varchar(100) NOT NULL,
  url_archivo varchar2(50) NOT NULL,
  fecha_envio_cliente date NOT NULL,
  fecha_aprob_cliente date DEFAULT NULL,
CONSTRAINT id_contrato_pk PRIMARY KEY(id_contrato)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE estatus_recurso_material (
  id_estatus NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  estatus_rec varchar2(10) NOT NULL,
CONSTRAINT id_estatus_pk PRIMARY KEY(id_estatus)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE estatus_revision_docs_proyecto (
  id_estatus_revisor NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  estatus varchar2(20) NOT NULL,
CONSTRAINT id_estatus_revisor_pk PRIMARY KEY(id_estatus_revisor)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE orden_de_compra (
  id_orden_compra NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  num_oc_cliente varchar2(30) NOT NULL,
  numero_compania number(25) NOT NULL,
  numero_cliente number(25) NOT NULL,
  fecha_elab_oc date NOT NULL,
  concepto varchar(100) NOT NULL,
  moneda varchar2(25) NOT NULL,
  monto BINARY_DOUBLE NOT NULL,
CONSTRAINT id_orden_compra_pk PRIMARY KEY(id_orden_compra)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE proyecto (
  id_proyecto NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre_proyecto varchar2(30) NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_fin date DEFAULT NULL,
  numero_cliente number(25) NOT NULL,
  tipo_documento number(25) DEFAULT NULL,
  id_contrato number(25) DEFAULT NULL,
  id_anexo number(25) DEFAULT NULL,
  id_orden_compra number(25) DEFAULT NULL,
CONSTRAINT id_proyecto_pk PRIMARY KEY(id_proyecto)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE recursos_materiales (
  id_recurso NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  tipo_dispositivo varchar2(25) NOT NULL,
  marca varchar2(25) NOT NULL,
  modelo varchar2(25) NOT NULL,
  numero_serie varchar2(25) NOT NULL,
  sku varchar2(25) NOT NULL,
  descripcion varchar(100) NOT NULL,
  estatus number(25) NOT NULL,
CONSTRAINT id_recurso_pk PRIMARY KEY(id_recurso)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE revisiones (
  id_revision NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  tipo_documento number(25) NOT NULL,
  identificador_documento number(25) NOT NULL,
  Revisor number(25) NOT NULL,
  Estatus number(25) NOT NULL,
  Fecha_de_Revision date NOT NULL,
CONSTRAINT id_revision_pk PRIMARY KEY(id_revision)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
CREATE TABLE tipo_doc (
  id_tipo_doc NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  docs varchar2(20) NOT NULL,
CONSTRAINT id_tipo_doc_pk PRIMARY KEY(id_tipo_doc)
);
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTER TABLE anexos
  ADD CONSTRAINT anexos_ibfk_1 FOREIGN KEY (id_contrato) REFERENCES contratos (id_contrato) ON DELETE CASCADE;
  ADD CONSTRAINT anexos_ibfk_2 FOREIGN KEY (numero_empleado) REFERENCES contacto (contacto_id) ON DELETE CASCADE ;

ALTER TABLE asignaciones
  ADD CONSTRAINT asignaciones_ibfk_2 FOREIGN KEY (numero_proyecto) REFERENCES proyecto (id_proyecto) ON DELETE CASCADE;
  ADD CONSTRAINT asignaciones_ibfk_3 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE;
  ADD CONSTRAINT asignaciones_ibfk_4 FOREIGN KEY (aprobador) REFERENCES contacto (contacto_id) ON DELETE CASCADE;
  ADD CONSTRAINT asignaciones_ibfk_5 FOREIGN KEY (numero_supervisor) REFERENCES contacto (contacto_id) ON DELETE CASCADE;
  ADD CONSTRAINT asignaciones_ibfk_6 FOREIGN KEY (numero_consultor) REFERENCES contacto (contacto_id) ON DELETE CASCADE ;

ALTER TABLE asignacion_recurso
  ADD CONSTRAINT asignacion_recurso_ibfk_2 FOREIGN KEY (num_recurso_mat) REFERENCES recursos_materiales (id_recurso) ON DELETE CASCADE;
  ADD CONSTRAINT asignacion_recurso_ibfk_3 FOREIGN KEY (num_empleado) REFERENCES contacto (contacto_id) ON DELETE CASCADE ;

ALTER TABLE contratos
  ADD CONSTRAINT contratos_ibfk_1 FOREIGN KEY (numero_compania) REFERENCES empresa (empresa_id) ON DELETE CASCADE;
  ADD CONSTRAINT contratos_ibfk_2 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE;
  ADD CONSTRAINT contratos_ibfk_3 FOREIGN KEY (numero_empleado) REFERENCES contacto (contacto_id) ON DELETE CASCADE ;

ALTER TABLE orden_de_compra
  ADD CONSTRAINT orden_de_compra_ibfk_1 FOREIGN KEY (numero_compania) REFERENCES empresa (empresa_id) ON DELETE CASCADE;
  ADD CONSTRAINT orden_de_compra_ibfk_2 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE ;

ALTER TABLE proyecto
  ADD CONSTRAINT proyecto_ibfk_2 FOREIGN KEY (tipo_documento) REFERENCES tipo_doc (id_tipo_doc) ON DELETE CASCADE;
  ADD CONSTRAINT proyecto_ibfk_3 FOREIGN KEY (id_anexo) REFERENCES anexos (id_anexo) ON DELETE CASCADE;
  ADD CONSTRAINT proyecto_ibfk_4 FOREIGN KEY (id_contrato) REFERENCES contratos (id_contrato) ON DELETE CASCADE;
  ADD CONSTRAINT proyecto_ibfk_5 FOREIGN KEY (id_orden_compra) REFERENCES orden_de_compra (id_orden_compra) ON DELETE CASCADE;
  ADD CONSTRAINT proyecto_ibfk_6 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE ;

ALTER TABLE recursos_materiales
  ADD CONSTRAINT recursos_materiales_ibfk_1 FOREIGN KEY (estatus) REFERENCES estatus_recurso_material (id_estatus) ON DELETE CASCADE ;

ALTER TABLE revisiones
  ADD CONSTRAINT revisiones_ibfk_2 FOREIGN KEY (Estatus) REFERENCES estatus_revision_docs_proyecto (id_estatus_revisor) ON DELETE CASCADE;
  ADD CONSTRAINT revisiones_ibfk_3 FOREIGN KEY (tipo_documento) REFERENCES tipo_doc (id_tipo_doc) ON DELETE CASCADE;
  ADD CONSTRAINT revisiones_ibfk_4 FOREIGN KEY (Revisor) REFERENCES contacto (contacto_id) ON DELETE CASCADE ;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
