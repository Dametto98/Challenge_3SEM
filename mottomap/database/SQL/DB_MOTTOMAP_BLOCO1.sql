--Nome: Caike Dametto RM: 558614
--Nome: Guilhetme Janunzzi RM: 558461

SET SERVEROUTPUT ON

DECLARE
  -- Cursor para consulta 1: Motos por filial e status
  CURSOR c_motos_filial IS
    SELECT f.NM_FILIAL, m.DS_STATUS, COUNT(*) AS QT_MOTOS
    FROM T_MM_MOTO m
    JOIN T_MM_FILIAL f ON m.CD_FILIAL = f.CD_FILIAL
    GROUP BY f.NM_FILIAL, m.DS_STATUS
    ORDER BY f.NM_FILIAL, m.DS_STATUS;
    
  -- Cursor para consulta 2: Problemas não resolvidos por modelo
  CURSOR c_problemas_modelo IS
    SELECT m.NM_MODELO, COUNT(p.CD_PROBLEMA) AS QT_PROBLEMAS
    FROM T_MM_PROBLEMA p
    JOIN T_MM_MOTO m ON p.CD_MOTO = m.CD_MOTO
    WHERE p.DS_RESOLVIDO = 0
    GROUP BY m.NM_MODELO
    ORDER BY QT_PROBLEMAS DESC;
    
  -- Cursor para consulta 3: Movimentações por tipo e usuário
  CURSOR c_movimentacoes_usuario IS
    SELECT u.NM_USUARIO, mv.DS_TIPO, COUNT(*) AS QT_MOVIMENTACOES
    FROM T_MM_MOVIMENTACAO mv
    JOIN T_MM_USUARIO u ON mv.CD_USUARIO = u.CD_USUARIO
    GROUP BY u.NM_USUARIO, mv.DS_TIPO
    ORDER BY u.NM_USUARIO, QT_MOVIMENTACOES DESC;
    
BEGIN
  DBMS_OUTPUT.PUT_LINE('=== RELATÓRIO 1: DISTRIBUIÇÃO DE MOTOS POR FILIAL E STATUS ===');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  FOR r IN c_motos_filial LOOP
    DBMS_OUTPUT.PUT_LINE('Filial: ' || RPAD(r.NM_FILIAL, 25) || 
                         'Status: ' || RPAD(r.DS_STATUS, 15) || 
                         'Quantidade: ' || r.QT_MOTOS);
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== RELATÓRIO 2: PROBLEMAS NÃO RESOLVIDOS POR MODELO ===');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  FOR r IN c_problemas_modelo LOOP
    DBMS_OUTPUT.PUT_LINE('Modelo: ' || RPAD(r.NM_MODELO, 20) || 
                         'Problemas pendentes: ' || r.QT_PROBLEMAS);
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== RELATÓRIO 3: MOVIMENTAÇÕES POR USUÁRIO E TIPO ===');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  FOR r IN c_movimentacoes_usuario LOOP
    DBMS_OUTPUT.PUT_LINE('Usuário: ' || RPAD(r.NM_USUARIO, 20) || 
                         'Tipo: ' || RPAD(r.DS_TIPO, 15) || 
                         'Quantidade: ' || r.QT_MOVIMENTACOES);
  END LOOP;
END;
/