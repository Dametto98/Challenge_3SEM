--Nome: Caike Dametto RM: 558614
--Nome: Guilhetme Janunzzi RM: 558461

SET SERVEROUTPUT ON

DECLARE
  -- Cursor para consulta 1: Ocupa��o por �rea e filial
  CURSOR c_ocupacao_area IS
    SELECT f.NM_FILIAL, pp.DS_AREA, 
           SUM(pp.DS_OCUPADO) AS QT_OCUPADAS,
           COUNT(*) AS QT_TOTAL,
           ROUND(SUM(pp.DS_OCUPADO)/COUNT(*)*100, 2) AS PERC_OCUPACAO
    FROM T_MM_POSICAO_PATIO pp
    JOIN T_MM_FILIAL f ON pp.CD_FILIAL = f.CD_FILIAL
    GROUP BY f.NM_FILIAL, pp.DS_AREA
    ORDER BY f.NM_FILIAL, PERC_OCUPACAO DESC;
    
  -- Cursor para consulta 2: Tempo m�dio por posi��o
  CURSOR c_tempo_posicao IS
    SELECT pp.CD_IDENTIFICACAO, 
           AVG(NVL(hp.DT_FIM, SYSDATE) - hp.DT_INICIO) AS TEMPO_MEDIO_DIAS
    FROM T_MM_HISTORICO_POSICAO hp
    JOIN T_MM_POSICAO_PATIO pp ON hp.CD_POSICAO = pp.CD_POSICAO
    GROUP BY pp.CD_IDENTIFICACAO
    ORDER BY TEMPO_MEDIO_DIAS DESC;
    
  -- Cursor para consulta 3: Motos com mais movimenta��es
  CURSOR c_motos_movimentadas IS
    SELECT m.NM_MODELO, m.DS_PLACA, COUNT(*) AS QT_MOVIMENTACOES
    FROM T_MM_MOVIMENTACAO mv
    JOIN T_MM_MOTO m ON mv.CD_MOTO = m.CD_MOTO
    GROUP BY m.NM_MODELO, m.DS_PLACA
    HAVING COUNT(*) >= 1
    ORDER BY QT_MOVIMENTACOES DESC;
    
BEGIN
  DBMS_OUTPUT.PUT_LINE('=== RELAT�RIO 1: OCUPA��O DO P�TIO POR �REA E FILIAL ===');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  FOR r IN c_ocupacao_area LOOP
    DBMS_OUTPUT.PUT_LINE('Filial: ' || RPAD(r.NM_FILIAL, 25) || 
                         '�rea: ' || RPAD(r.DS_AREA, 15) || 
                         'Ocupadas: ' || RPAD(r.QT_OCUPADAS || '/' || r.QT_TOTAL, 10) || 
                         'Percentual: ' || r.PERC_OCUPACAO || '%');
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== RELAT�RIO 2: TEMPO M�DIO POR POSI��O NO P�TIO ===');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  FOR r IN c_tempo_posicao LOOP
    DBMS_OUTPUT.PUT_LINE('Posi��o: ' || RPAD(r.CD_IDENTIFICACAO, 10) || 
                         'Tempo m�dio (dias): ' || ROUND(r.TEMPO_MEDIO_DIAS, 2));
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== RELAT�RIO 3: MOTOS COM MAIS MOVIMENTA��ES ===');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  FOR r IN c_motos_movimentadas LOOP
    DBMS_OUTPUT.PUT_LINE('Modelo: ' || RPAD(r.NM_MODELO, 20) || 
                         'Placa: ' || RPAD(r.DS_PLACA, 10) || 
                         'Movimenta��es: ' || r.QT_MOVIMENTACOES);
  END LOOP;
END;
/