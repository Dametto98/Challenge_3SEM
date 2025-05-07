--Nome: Caike Dametto RM: 558614
--Nome: Guilhetme Janunzzi RM: 558461

CREATE TABLE T_MM_FILIAL (
    cd_filial         NUMBER(8) NOT NULL,
    nm_filial         VARCHAR2(150) NOT NULL,
    ds_endereco       VARCHAR2(255) NOT NULL,
    nm_cidade         VARCHAR2(100) NOT NULL,
    sg_estado         VARCHAR2(2) NOT NULL,
    nr_linha          NUMBER(4) NOT NULL,
    nr_coluna         NUMBER(4) NOT NULL,
    qt_capacidade_max NUMBER(6) NOT NULL
);

ALTER TABLE t_mm_filial ADD CONSTRAINT t_mm_filial_pk PRIMARY KEY ( cd_filial );

CREATE TABLE t_mm_historico_posicao (
    cd_historico                  NUMBER(10) NOT NULL,
    t_mm_moto_cd_moto             NUMBER(9) NOT NULL,
    t_mm_posicao_patio_cd_posicao NUMBER(6) NOT NULL,
    dt_inicio                     DATE NOT NULL,
    dt_fim                        DATE,
    cd_filial1                    NUMBER NOT NULL,
    cd_filial                     NUMBER NOT NULL
);

ALTER TABLE t_mm_historico_posicao ADD CONSTRAINT t_mm_historico_posicao_pk PRIMARY KEY ( cd_historico );

CREATE TABLE t_mm_moto (
    cd_moto               NUMBER(9) NOT NULL,
    t_mm_filial_cd_filial NUMBER(8) NOT NULL,
    ds_placa              VARCHAR2(8),
    ds_chassi             unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    nm_modelo             VARCHAR2(50) NOT NULL,
    nr_ano                NUMBER(4) NOT NULL,
    ds_status             VARCHAR2(20) NOT NULL
);

ALTER TABLE t_mm_moto ADD CONSTRAINT t_mm_moto_pk PRIMARY KEY ( cd_moto );

CREATE TABLE t_mm_movimentacao (
    cd_movimentacao         NUMBER(10) NOT NULL,
    t_mm_usuario_cd_usuario NUMBER(9) NOT NULL,
    t_mm_moto_cd_moto       NUMBER(9) NOT NULL,
    ds_tipo                 VARCHAR2(20) NOT NULL,
    dt_hora                 DATE NOT NULL,
    ds_observacoes          VARCHAR2(255) NOT NULL,
    cd_filial1              NUMBER NOT NULL,
    cd_filial               NUMBER NOT NULL
);

ALTER TABLE t_mm_movimentacao ADD CONSTRAINT t_mm_movimentacao_pk PRIMARY KEY ( cd_movimentacao );

CREATE TABLE t_mm_posicao_patio (
    cd_posicao            NUMBER(6) NOT NULL,
    t_mm_filial_cd_filial NUMBER(8) NOT NULL,
    cd_identificacao      VARCHAR2(10) NOT NULL,
    nr_fila               NUMBER(4) NOT NULL,
    nr_coluna             NUMBER(4) NOT NULL,
    ds_area               VARCHAR2(50) NOT NULL,
    ds_ocupado            NUMBER
);

ALTER TABLE t_mm_posicao_patio ADD CONSTRAINT t_mm_posicao_patio_pk PRIMARY KEY ( cd_posicao );

CREATE TABLE t_mm_problema (
    cd_problema             NUMBER(9) NOT NULL,
    t_mm_moto_cd_moto       NUMBER(9) NOT NULL,
    t_mm_usuario_cd_usuario NUMBER(9) NOT NULL,
    ds_tipo                 VARCHAR2(20) NOT NULL,
    ds_descricao            VARCHAR2(255) NOT NULL,
    dt_registro             DATE NOT NULL,
    ds_resolvido            CHAR(1) NOT NULL,
    cd_filial1              NUMBER NOT NULL,
    cd_filial               NUMBER NOT NULL
);

ALTER TABLE t_mm_problema ADD CONSTRAINT t_mm_problema_pk PRIMARY KEY ( cd_problema );

CREATE TABLE t_mm_usuario (
    cd_usuario            NUMBER(9) NOT NULL,
    t_mm_filial_cd_filial NUMBER(8) NOT NULL,
    nm_usuario            VARCHAR2(150) NOT NULL,
    ds_email              VARCHAR2(100) NOT NULL,
    ds_senha              VARCHAR2(200) NOT NULL,
    ds_tipo               VARCHAR2(20) NOT NULL
);

ALTER TABLE t_mm_usuario ADD CONSTRAINT t_mm_usuario_pk PRIMARY KEY ( cd_usuario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_mm_historico_posicao
    ADD CONSTRAINT t_mm_historico_posicao_t_mm_moto_fk FOREIGN KEY ( t_mm_moto_cd_moto )
        REFERENCES t_mm_moto ( cd_moto );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_mm_historico_posicao
    ADD CONSTRAINT t_mm_historico_posicao_t_mm_posicao_patio_fk FOREIGN KEY ( t_mm_posicao_patio_cd_posicao )
        REFERENCES t_mm_posicao_patio ( cd_posicao );

ALTER TABLE t_mm_moto
    ADD CONSTRAINT t_mm_moto_t_mm_filial_fk FOREIGN KEY ( t_mm_filial_cd_filial )
        REFERENCES t_mm_filial ( cd_filial );

ALTER TABLE t_mm_movimentacao
    ADD CONSTRAINT t_mm_movimentacao_t_mm_moto_fk FOREIGN KEY ( t_mm_moto_cd_moto )
        REFERENCES t_mm_moto ( cd_moto );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_mm_movimentacao
    ADD CONSTRAINT t_mm_movimentacao_t_mm_usuario_fk FOREIGN KEY ( t_mm_usuario_cd_usuario )
        REFERENCES t_mm_usuario ( cd_usuario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_mm_posicao_patio
    ADD CONSTRAINT t_mm_posicao_patio_t_mm_filial_fk FOREIGN KEY ( t_mm_filial_cd_filial )
        REFERENCES t_mm_filial ( cd_filial );

ALTER TABLE t_mm_problema
    ADD CONSTRAINT t_mm_problema_t_mm_moto_fk FOREIGN KEY ( t_mm_moto_cd_moto )
        REFERENCES t_mm_moto ( cd_moto );

ALTER TABLE t_mm_problema
    ADD CONSTRAINT t_mm_problema_t_mm_usuario_fk FOREIGN KEY ( t_mm_usuario_cd_usuario )
        REFERENCES t_mm_usuario ( cd_usuario );

ALTER TABLE t_mm_usuario
    ADD CONSTRAINT t_mm_usuario_t_mm_filial_fk FOREIGN KEY ( t_mm_filial_cd_filial )
        REFERENCES t_mm_filial ( cd_filial );