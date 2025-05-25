# MotoMap - Protótipo Funcional (1º Sprint)

## Descrição do Projeto

Este projeto é o protótipo funcional mobile do **MotoMap**, um sistema inteligente para mapeamento de pátios e gestão de motos, desenvolvido como parte da disciplina de Desenvolvimento Mobile.

Esta entrega foca nos requisitos do **1º Sprint**, que incluem a criação da estrutura básica do aplicativo em React Native com Expo, navegação entre telas, um protótipo visual funcional, manipulação de formulários com estado e armazenamento local de dados.

## Tecnologias Utilizadas

* React Native
* Expo
* JavaScript
* React Navigation (para navegação entre telas)
* AsyncStorage (para armazenamento local)

## Funcionalidades Implementadas (1º Sprint)

### 1. Navegação entre Telas (5+ telas)
* O projeto utiliza a biblioteca `React Navigation` (Stack Navigator) para gerenciar o fluxo entre as telas.
* As seguintes telas foram implementadas e são navegáveis:
    * **HomeScreen:** Tela inicial com acesso às principais funcionalidades e listagem de motos salvas localmente.
    * **PatioVisualizacaoScreen:** Protótipo visual de como seria a visualização do pátio (com dados mockados).
    * **RegistrarMotoScreen:** Formulário para registrar novas motos.
    * **DetalhesMotoScreen:** Tela para exibir detalhes de uma moto selecionada (a partir da visualização do pátio, com dados mockados).
    * **FiliaisScreen:** Tela para listar filiais da empresa (com dados mockados).

### 2. Protótipo Visual Funcional
* Todas as telas implementadas possuem um layout funcional e coerente com o fluxo de uso proposto para o aplicativo.
* Foram utilizados dados mockados (fixos ou com `useState`) para simular o conteúdo dinâmico em telas como `PatioVisualizacaoScreen` e `FiliaisScreen`.
* O fluxo de navegação entre as telas é lógico e intuitivo.

### 3. Formulário com Manipulação de Estado
* A tela **`RegistrarMotoScreen`** contém um formulário para entrada de dados da moto (placa, modelo, status, filial, vaga).
* Os campos do formulário são controlados utilizando `useState` para gerenciar o estado dos inputs em tempo real.
* Os dados digitados pelo usuário são exibidos dinamicamente na tela antes do salvamento.
* Ao salvar, os dados são processados e armazenados localmente.

### 4. Armazenamento Local com AsyncStorage
* As informações das motos inseridas no formulário da tela `RegistrarMotoScreen` são salvas localmente utilizando `AsyncStorage`.
* Ao reiniciar o aplicativo, os dados salvos anteriormente são carregados e exibidos, por exemplo, na `HomeScreen`, demonstrando a persistência dos dados.

## Como Executar o Projeto

**Pré-requisitos:**
* Node.js (versão LTS recomendada)
* npm (geralmente vem com o Node.js)
* Expo Go (aplicativo no celular Android/iOS) ou um Emulador Android configurado.

**Passos:**

1.  **Clone o repositório (ou baixe os arquivos do projeto):**
    ```bash
    # Se estiver usando git
    # git clone <URL_DO_REPOSITORIO>
    # cd <PASTA_DO_PROJETO>
    ```
    (Caso não use Git para esta entrega, apenas certifique-se de estar no diretório raiz do projeto).

2.  **Instale as dependências:**
    Navegue até a pasta raiz do projeto no terminal e execute:
    ```bash
    npm install
    ```

3.  **Inicie o servidor de desenvolvimento Expo:**
    Ainda na pasta raiz do projeto, execute:
    ```bash
    npx expo start
    ```

4.  **Abra o aplicativo:**
    * **No Expo Go (Celular):** Após o comando `npx expo start`, um QR code será exibido no terminal. Abra o aplicativo Expo Go no seu celular e escaneie este QR code. Certifique-se de que o celular e o computador estão na mesma rede Wi-Fi.
    * **No Emulador Android:** Com o emulador Android já em execução (e configurado com o Android Studio, se necessário), você pode pressionar a tecla `a` no terminal onde o Expo está rodando.

## Estrutura do Projeto (Simplificada)

* `App.js`: Ponto de entrada principal, onde a navegação é configurada.
* `screens/`: Pasta contendo os arquivos de cada tela da aplicação (ex: `HomeScreen.js`, `RegistrarMotoScreen.js`, etc.).
* `assets/`: Para imagens e outros recursos estáticos.

---

Este `README.md` visa fornecer uma visão geral da entrega do 1º Sprint do projeto MotoMap.