--Nome: Caike Dametto RM: 558614
--Nome: Guilhetme Janunzzi RM: 558461

SET SERVEROUTPUT ON

DECLARE
  -- Cursor para obter os dados ordenados por código da moto
  CURSOR c_motos IS
    SELECT CD_MOTO, DS_PLACA, ROW_NUMBER() OVER (ORDER BY CD_MOTO) AS linha
    FROM T_MM_MOTO
    WHERE DS_PLACA IS NOT NULL
    ORDER BY CD_MOTO;
    
  -- Variáveis para armazenar os valores
  v_cod_moto NUMBER;
  v_placa_atual VARCHAR2(8);
  v_placa_anterior VARCHAR2(8);
  v_placa_proxima VARCHAR2(8);
  v_linha_atual NUMBER := 0;
  v_total_linhas NUMBER;
  
BEGIN
  -- Obter o total de linhas
  SELECT COUNT(*) INTO v_total_linhas FROM T_MM_MOTO WHERE DS_PLACA IS NOT NULL;
  
  DBMS_OUTPUT.PUT_LINE('=== RELATÓRIO DE MOTOS (PLACAS ANTERIORES E PRÓXIMAS) ===');
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
  DBMS_OUTPUT.PUT_LINE(RPAD('Cod_Moto', 10) || RPAD('Anterior', 10) || 
                       RPAD('Atual', 10) || 'Próximo');
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
  
  -- Percorrer as motos
  FOR moto IN c_motos LOOP
    v_linha_atual := moto.linha;
    v_cod_moto := moto.CD_MOTO;
    v_placa_atual := moto.DS_PLACA;
    
    -- Obter placa anterior
    BEGIN
      SELECT DS_PLACA INTO v_placa_anterior
      FROM (
        SELECT DS_PLACA, ROW_NUMBER() OVER (ORDER BY CD_MOTO) AS linha
        FROM T_MM_MOTO
        WHERE DS_PLACA IS NOT NULL
      ) 
      WHERE linha = v_linha_atual - 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_placa_anterior := 'Vazio';
    END;
    
    -- Obter próxima placa
    BEGIN
      SELECT DS_PLACA INTO v_placa_proxima
      FROM (
        SELECT DS_PLACA, ROW_NUMBER() OVER (ORDER BY CD_MOTO) AS linha
        FROM T_MM_MOTO
        WHERE DS_PLACA IS NOT NULL
      ) 
      WHERE linha = v_linha_atual + 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_placa_proxima := 'Vazio';
    END;
    
    -- Exibir a linha formatada
    DBMS_OUTPUT.PUT_LINE(
      RPAD(v_cod_moto, 10) || 
      RPAD(v_placa_anterior, 10) || 
      RPAD(v_placa_atual, 10) || 
      v_placa_proxima
    );
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
END;
/