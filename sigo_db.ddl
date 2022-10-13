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
  ADD CONSTRAINT anexos_ibfk_1 FOREIGN KEY (id_contrato) REFERENCES contratos (id_contrato) ON DELETE CASCADE
  ADD CONSTRAINT anexos_ibfk_2 FOREIGN KEY (numero_empleado) REFERENCES contacto (contacto_id) ON DELETE CASCADE 

ALTER TABLE asignaciones
  ADD CONSTRAINT asignaciones_ibfk_2 FOREIGN KEY (numero_proyecto) REFERENCES proyecto (id_proyecto) ON DELETE CASCADE
  ADD CONSTRAINT asignaciones_ibfk_3 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE
  ADD CONSTRAINT asignaciones_ibfk_4 FOREIGN KEY (aprobador) REFERENCES contacto (contacto_id) ON DELETE CASCADE
  ADD CONSTRAINT asignaciones_ibfk_5 FOREIGN KEY (numero_supervisor) REFERENCES contacto (contacto_id) ON DELETE CASCADE
  ADD CONSTRAINT asignaciones_ibfk_6 FOREIGN KEY (numero_consultor) REFERENCES contacto (contacto_id) ON DELETE CASCADE 

ALTER TABLE asignacion_recurso
  ADD CONSTRAINT asignacion_recurso_ibfk_2 FOREIGN KEY (num_recurso_mat) REFERENCES recursos_materiales (id_recurso) ON DELETE CASCADE
  ADD CONSTRAINT asignacion_recurso_ibfk_3 FOREIGN KEY (num_empleado) REFERENCES contacto (contacto_id) ON DELETE CASCADE 

ALTER TABLE contratos
  ADD CONSTRAINT contratos_ibfk_1 FOREIGN KEY (numero_compania) REFERENCES empresa (empresa_id) ON DELETE CASCADE
  ADD CONSTRAINT contratos_ibfk_2 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE
  ADD CONSTRAINT contratos_ibfk_3 FOREIGN KEY (numero_empleado) REFERENCES contacto (contacto_id) ON DELETE CASCADE 

ALTER TABLE orden_de_compra
  ADD CONSTRAINT orden_de_compra_ibfk_1 FOREIGN KEY (numero_compania) REFERENCES empresa (empresa_id) ON DELETE CASCADE
  ADD CONSTRAINT orden_de_compra_ibfk_2 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE 

ALTER TABLE proyecto
  ADD CONSTRAINT proyecto_ibfk_2 FOREIGN KEY (tipo_documento) REFERENCES tipo_doc (id_tipo_doc) ON DELETE CASCADE
  ADD CONSTRAINT proyecto_ibfk_3 FOREIGN KEY (id_anexo) REFERENCES anexos (id_anexo) ON DELETE CASCADE
  ADD CONSTRAINT proyecto_ibfk_4 FOREIGN KEY (id_contrato) REFERENCES contratos (id_contrato) ON DELETE CASCADE
  ADD CONSTRAINT proyecto_ibfk_5 FOREIGN KEY (id_orden_compra) REFERENCES orden_de_compra (id_orden_compra) ON DELETE CASCADE
  ADD CONSTRAINT proyecto_ibfk_6 FOREIGN KEY (numero_cliente) REFERENCES empresa (empresa_id) ON DELETE CASCADE 

ALTER TABLE recursos_materiales
  ADD CONSTRAINT recursos_materiales_ibfk_1 FOREIGN KEY (estatus) REFERENCES estatus_recurso_material (id_estatus) ON DELETE CASCADE 

ALTER TABLE revisiones
  ADD CONSTRAINT revisiones_ibfk_2 FOREIGN KEY (Estatus) REFERENCES estatus_revision_docs_proyecto (id_estatus_revisor) ON DELETE CASCADE
  ADD CONSTRAINT revisiones_ibfk_3 FOREIGN KEY (tipo_documento) REFERENCES tipo_doc (id_tipo_doc) ON DELETE CASCADE
  ADD CONSTRAINT revisiones_ibfk_4 FOREIGN KEY (Revisor) REFERENCES contacto (contacto_id) ON DELETE CASCADE 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--------------------------Modulo Reporte de Tiempo-----------------------------
-------------------------------------------------------------------------------
CREATE TABLE calendario (
  calendario_id number(11) NOT NULL ,
  fecha number NOT NULL,
  anio number NOT NULL,
  mes number NOT NULL,
  semana number NOT NULL,
  dia number NOT NULL,
  nombre_dia varchar2(20) NOT NULL,
  CONSTRAINT calendario_pk PRIMARY KEY(calendario_id)
);

CREATE SEQUENCE seq_calendario_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_calendario BEFORE
    INSERT ON calendario
    FOR EACH ROW
BEGIN
    :new.calendario_id := seq_calendario_id.nextval;
END;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE TABLE catalogo_actividades (
  catalogo_act_id number(11) NOT NULL,
  nombre_actividad varchar2(50) NOT NULL,
  tipo varchar2(50) NOT NULL,
  subtipo varchar2(50) NOT NULL,
  facturable varchar2(2) NOT NULL,
  observaciones_cliente varchar2(300) NOT NULL,
  observaciones_supervisor varchar2(300) NOT NULL,
  CONSTRAINT catalogo_actividades_pk PRIMARY KEY(catalogo_act_id)
);

CREATE SEQUENCE seq_catalogo_act_id_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER trgr_tbl_catalogo_actividades BEFORE
    INSERT ON catalogo_actividades
    FOR EACH ROW
BEGIN
    :new.catalogo_act_id := seq_catalogo_act_id_id.nextval;
END;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE TABLE encabezado_reporte (
  encabezado_id number(11) NOT NULL ,
  cliente_id number(11) DEFAULT NULL,
  proyecto_id number(11) DEFAULT NULL,
  consultor_id number(11) NOT NULL,
  aprobador_cliente number(11) NOT NULL,
  aprobador_interno number(11) NOT NULL,
  anio number(11) NOT NULL,
  semana_anio number(11) NOT NULL,
  horas_facturables number(3) NOT NULL,
  horas_no_facturables number(3) NOT NULL,
  total_horas number(3) NOT NULL,
  estado varchar2(20)  DEFAULT NULL,
  fecha_rev_cliente date DEFAULT NULL,
  fecha_rev_supervisor date DEFAULT NULL,
  CONSTRAINT encabezado_reporte_pk PRIMARY KEY(encabezado_id)
  );

  CREATE SEQUENCE seq_encabezado_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

  CREATE OR REPLACE TRIGGER trgr_tbl_encabezado_reporte BEFORE
      INSERT ON encabezado_reporte
      FOR EACH ROW
  BEGIN
      :new.encabezado_id := seq_encabezado_id.nextval;
  END;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

CREATE TABLE estado_revision (
  estado_rev_id number(11) NOT NULL ,
  nombre_estado varchar2(50)  NOT NULL,
  CONSTRAINT estado_revision_pk PRIMARY KEY(estado_rev_id)
);

CREATE SEQUENCE seq_estado_rev_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

  CREATE OR REPLACE TRIGGER trgr_tbl_estado_revision BEFORE
      INSERT ON estado_revision
      FOR EACH ROW
  BEGIN
      :new.estado_rev_id := seq_estado_rev_id.nextval;
  END;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE TABLE lineas_reporte (
  lineas_id number(11) NOT NULL ,
  actividad_id number(11) NOT NULL,
  fecha_actividad number(11) NOT NULL,
  horas_actividad number(11) NOT NULL,
  observaciones_cliente varchar2(300)  NOT NULL,
  observaciones_supervisor varchar2(300)  NOT NULL,
  encabezado_reporte_id number(11) NOT NULL,
  CONSTRAINT lineas_reporte_pk PRIMARY KEY(lineas_id)
);

CREATE SEQUENCE seq_lineas_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

  CREATE OR REPLACE TRIGGER trgr_tbl_lineas_reporte BEFORE
      INSERT ON lineas_reporte
      FOR EACH ROW
  BEGIN
      :new.lineas_id := seq_lineas_id.nextval;
  END;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE TABLE revisiones_actividad (
  rev_act_id number(11) NOT NULL ,
  fecha_rev date NOT NULL,
  reviso_cliente number(11) NOT NULL,
  reviso_supervisor number(11) NOT NULL,
  estado_revision number(11) NOT NULL,
  CONSTRAINT revisiones_actividad_pk PRIMARY KEY(rev_act_id)
);

CREATE SEQUENCE seq_rev_act_id START WITH 1 INCREMENT BY 1 NOCACHE ORDER;

  CREATE OR REPLACE TRIGGER trgr_tbl_revisiones_actividad BEFORE
      INSERT ON revisiones_actividad
      FOR EACH ROW
  BEGIN
      :new.rev_act_id := seq_rev_act_id.nextval;
  END;

-- CONSTRAINTs for table encabezado_reporte
--
ALTER TABLE encabezado_reporte
   CONSTRAINT encabezado_anio_fk FOREIGN KEY (anio) REFERENCES calendario (calendario_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT encabezado_aproba_cliente_fk FOREIGN KEY (aprobador_cliente) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT encabezado_aproba_interno FOREIGN KEY (aprobador_interno) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT encabezado_cliente_fk FOREIGN KEY (cliente_id) REFERENCES empresa (empresa_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT encabezado_consultor_fk FOREIGN KEY (consultor_id) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT encabezado_proyecto_fk FOREIGN KEY (proyecto_id) REFERENCES proyecto (id_proyecto) ON DELETE CASCADE ON UPDATE CASCADE;

-- CONSTRAINTs for table lineas_reporte
--
ALTER TABLE lineas_reporte
   CONSTRAINT lineas_actividad_fk FOREIGN KEY (actividad_id) REFERENCES catalogo_actividades (catalogo_act_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT lineas_encabezado_fk FOREIGN KEY (encabezado_reporte_id) REFERENCES encabezado_reporte (encabezado_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT lineas_fecha_fk FOREIGN KEY (fecha_actividad) REFERENCES calendario (calendario_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- CONSTRAINTs for table revisiones_actividad
--
ALTER TABLE revisiones_actividad
   CONSTRAINT revisiones_contacto_fk FOREIGN KEY (reviso_cliente) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT revisiones_contactosup_fk FOREIGN KEY (reviso_supervisor) REFERENCES contacto (contacto_id) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT revisiones_estado_fk FOREIGN KEY (estado_revision) REFERENCES estado_revision (estado_rev_id) ON DELETE CASCADE ON UPDATE CASCADE;
   
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
--
-- Table structure for table catalogo_servicios
--

CREATE TABLE catalogo_servicios (
  servicio_id number(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre varchar2(5) COLLATE utf8_unicode_ci NOT NULL,
  descripcion varchar2(100) COLLATE utf8_unicode_ci NOT NULL,
  CONSTRAINT catalogo_servicios_pk PRIMARY KEY (servicio_id)
);

-- --------------------------------------------------------
--
-- Table structure for table encabezado_presupuesto
--
CREATE TABLE encabezado_presupuesto (
  enc_pre_id number(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre varchar2(100) COLLATE utf8_unicode_ci NOT NULL,
  moneda_capura varchar2(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'USD, MXN',
  created_at date NOT NULL,
  last_update date NOT NULL,
  contacto_id number(11) NOT NULL,
  capturado char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT 's,n',
  fecha_revision date DEFAULT NULL,
  estatus varchar2(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'aprovado o rechazado',
  observaciones varchar2(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  CONSTRAINT encabezado_presupuesto_pk PRIMARY KEY (enc_pre_id),
  CONSTRAINT encabezado_presupuesto_fk1 FOREIGN KEY (contacto_id) REFERENCES contacto (contacto_id)
);

-- --------------------------------------------------------
--
-- Table structure for table lineas_presupuesto
--

CREATE TABLE lineas_presupuesto (
  lineas_pre_op number(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  contacto_id number(11) NOT NULL,
  dimension number(11) NOT NULL,
  mes_presupuesto number(11) NOT NULL,
  tipo_servicio number(11) NOT NULL,
  valor_presupuesto number(11) NULL,
  enc_pre_id number(11) NOT NULL,
  CONSTRAINT lineas_presupuesto_pk PRIMARY KEY (lineas_pre_op),
  CONSTRAINT lineas_presupuesto_fk_1 FOREIGN KEY (mes_presupuesto) REFERENCES meses (meses_id),
  CONSTRAINT lineas_presupuesto_fk_2 FOREIGN KEY (tipo_servicio) REFERENCES catalogo_servicios (servicio_id),
  CONSTRAINT lineas_presupuesto_fk_3 FOREIGN KEY (dimension) REFERENCES tipo_dimension (tipo_dimension_id),
  CONSTRAINT lineas_presupuesto_fk_4 FOREIGN KEY (enc_pre_id) REFERENCES encabezado_presupuesto (enc_pre_id),
  CONSTRAINT lineas_presupuesto_fk_5 FOREIGN KEY (contacto_id) REFERENCES contacto (contacto_id)
);
-- --------------------------------------------------------
--
-- Table structure for table meses
--

CREATE TABLE meses (
  meses_id number(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre varchar2(20) COLLATE utf8_unicode_ci NOT NULL,
  CONSTRAINT meses_pk PRIMARY KEY (meses_id)
) COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
--
-- Table structure for table nvl_consultores
--

CREATE TABLE nvl_consultores (
  nvl_id number(11) NOT NULL,
  nivel varchar2(2) COLLATE utf8_unicode_ci NOT NULL,
  nombre varchar2(20) COLLATE utf8_unicode_ci NOT NULL,
  year varchar2(4) COLLATE utf8_unicode_ci NOT NULL,
  tarifa_usd number(11) NOT NULL,
  TC number(11) NOT NULL,
  tarifa_mxn number(11) NOT NULL,
  CONSTRAINT nvl_consultores_pk PRIMARY KEY (nvl_id)
);

-- --------------------------------------------------------
--
-- Table structure for table tipo_dimension
--

CREATE TABLE tipo_dimension (
  tipo_dimension_id number(11) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  nombre varchar2(20) COLLATE utf8_unicode_ci NOT NULL,
  CONSTRAINT tipo_dimension_pk PRIMARY KEY (tipo_dimension_id)
);

-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
