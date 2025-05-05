
# MotoMap – Sistema Inteligente de Gestão de Pátios

## 📱 Descrição Geral

O **MotoMap** é um sistema desenvolvido para auxiliar na organização e gestão dos pátios de motos da empresa **Mottu**. A proposta surgiu a partir de uma dor apresentada pela própria empresa: a dificuldade em manter o controle físico e visual de centenas de motos distribuídas em filiais diferentes. Para resolver isso, o MotoMap oferece um sistema integrado, com organização visual, controle de movimentações e auxílio à triagem de veículos utilizando visão computacional.

## 🚀 Objetivos

- **Organizar o pátio** por meio de vagas demarcadas em linhas e colunas.
- **Controlar entradas, saídas e status** das motos nas filiais.
- **Auxiliar a triagem de veículos** com uso de câmeras e IA de visão computacional.
- **Melhorar a rastreabilidade** e o histórico de movimentações das motos.
- **Oferecer uma visualização clara** do pátio por meio da interface mobile.

## 🧠 Divisão de Papéis no Sistema

### Administradores

- **Administrador Geral**:
  - Cadastra novas filiais.
  - Registra motos no sistema.
  - Designa administradores locais às filiais.
- **Administrador Local**:
  - Gerencia colaboradores da filial.
  - Supervisiona o pátio e gera relatórios.
  - Acompanha movimentações e status das motos.

### Colaboradores

- **Colaborador de Pátio**:
  - Responsável pela entrada, movimentação e triagem das motos.
  - Registra o local físico da moto no pátio.
  - Descreve problemas observados no veículo.
- **Colaborador Mecânico**:
  - Responsável por resolver os problemas cadastrados.
  - Após o conserto, altera o status da moto para “Pronta”.
  - Realoca a moto para a área correta do pátio.

## 🏢 Estrutura do Sistema

### Filial

- Cada filial tem um pátio com estrutura de **linhas e colunas**, informadas no cadastro.
- O pátio é dividido em áreas:
  - **PRONTAS**: motos disponíveis para aluguel.
  - **MINHA_MOTTU**: motos destinadas a clientes do plano.
  - **PROBLEMAS_SIMPLES**: falhas de fácil resolução.
  - **PROBLEMAS_GRAVES**: falhas críticas e estruturais.
  - **IRRECUPERÁVEIS**: motos com perda total ou problemas legais graves.

## 📲 Funcionalidades da Aplicação Mobile

- **Cadastro de Filiais e Colaboradores**
- **Triagem de Entrada de Motos**:
  - Avaliação inicial.
  - Registro do problema.
  - Alocação da moto com base em visão computacional (vagas disponíveis).
- **Movimentação Interna**:
  - Mudança de área no pátio conforme status.
- **Visualização do Pátio**:
  - Interface gráfica com vagas em formato de matriz.
  - Visualização de motos ocupando cada vaga.
  - Detalhes: placa, modelo, status, problemas.
- **Busca por Chassi ou Placa**
- **Histórico e Status das Motos**
- **Atualização do Status por Mecânicos**

## 🧩 Tecnologias Utilizadas

### Desenvolvimento Mobile (React Native + Expo)
- Interface intuitiva com navegação entre telas.
- Componentização e uso de imagens, formulários, e botões interativos.
- Comunicação com a API .NET e Java via HTTP.

### Backend ASP.NET Core + EF Core (com Oracle)
- Cadastro e gerenciamento de motos e filiais.
- Lógica de organização das motos no pátio.
- Endpoints RESTful para integração com o app mobile.

### Backend Spring Boot + JPA
- Controle de movimentações de motos.
- Registro de entradas e alterações de status.
- Histórico de atividades das motos.

### Banco de Dados Oracle
- Tabelas relacionadas a motos, colaboradores, filiais, status e movimentações.
- Relacionamentos bem definidos com integridade referencial.

## 📡 Infraestrutura

- **Docker** para orquestração de ambientes.
- **Hospedagem em Azure VM**, garantindo acesso interno entre as APIs e o app.

## ✅ Requisitos Atendidos por Disciplina

### Desenvolvimento Mobile
- App com mais de 5 telas (Home, Entrada, Visualização, Detalhes, Cadastro, etc.).
- Duas estratégias de navegação: Stack e Tab.
- Imagens e formulários interativos.
- Uso do `Linking` para acesso a documentos e materiais externos.
- Consumo de API RESTful.

### Desenvolvimento Web (Não aplicável nesta entrega)

### Back-End
- APIs RESTful separadas por responsabilidades (.NET e Java).
- Códigos organizados com rotas, controladores, serviços e entidades.
- Documentação da API.

### Banco de Dados
- Uso exclusivo do banco Oracle.
- Projeto do banco relacional com relacionamentos bem definidos.
- Scripts de criação e povoamento de dados.

### Infraestrutura
- Uso de containers Docker.
- Deploy em máquina virtual na Azure.
- APIs acessíveis via endpoints.
