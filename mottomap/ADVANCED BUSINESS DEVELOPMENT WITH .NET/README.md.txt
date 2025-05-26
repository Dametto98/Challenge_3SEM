# 🏍️ MotoMap - Módulo de Movimentações e Histórico (.NET)

O MotoMap é um sistema desenvolvido para auxiliar na organização e gestão dos pátios de motos da empresa Mottu. Este módulo específico, desenvolvido em ASP.NET Core (C#), é o **Dono das Ações** relacionadas às operações temporais e integrações externas do sistema.

## 🔵 Responsabilidades do Módulo .NET

Este módulo é crucial para:

- Gerenciar o histórico de todas as movimentações de motos.
- Registrar entradas e saídas de motos no pátio.
- Manter o histórico de qual posição cada moto ocupou e por quanto tempo.
- Possibilitar integrações com serviços externos (ex: um sistema de IA para triagem de veículos).

## 👨‍💻 Equipe

- Caike Dametto – RM: 558614
- Guilherme Janunzzi – RM: 558461

## 🛠️ Tecnologias Utilizadas

- ASP.NET Core
- C#
- Entity Framework Core (para interação com banco de dados)

## 🧱 Componentes Principais

### Entidades (Modelos EF Core)

1. **Movimentacao**: Representa o registro de uma movimentação de moto.
   - Atributos:
     - `id` (int): Identificador único da movimentação.
     - `tipo` (string/enum): Tipo da movimentação (ex: "ENTRADA", "SAIDA").
     - `dataHora` (DateTime): Data e hora da movimentação.
     - `observacoes` (string, opcional): Observações adicionais.
   - Relacionamentos:
     - `MotoId` (int): Chave estrangeira para a entidade Moto (gerenciada por outro serviço/módulo).
     - `UsuarioId` (int): Chave estrangeira para o Usuário que realizou a movimentação.
     - `PosicaoId` (int, opcional): Chave estrangeira para a Posição no pátio (relevante para saídas ou para registrar a posição de entrada).

2. **HistoricoPosicao**: Mantém o histórico de ocupação das posições pelas motos.
   - Atributos:
     - `id` (int): Identificador único do registro de histórico.
     - `dataInicio` (DateTime): Data e hora em que a moto entrou na posição.
     - `dataFim` (DateTime, nullable): Data e hora em que a moto saiu da posição (nulo se a moto ainda está na posição).
   - Relacionamentos:
     - `MotoId` (int): Chave estrangeira para a entidade Moto.
     - `PosicaoId` (int): Chave estrangeira para a entidade Posição.

### Controladores (Controllers)

1. **MovimentacaoController**: Responsável por gerenciar as movimentações de entrada e saída.
   - `POST /movimentacoes/entrada`: Registra a entrada de uma moto no pátio. Ao registrar uma entrada, um novo registro em HistoricoPosicao é criado com `dataInicio` preenchida e `dataFim` nula.
   - `POST /movimentacoes/saida`: Registra a saída de uma moto. Atualiza o registro correspondente em HistoricoPosicao, preenchendo `dataFim`.

2. **HistoricoController**: Responsável por consultas relacionadas ao histórico de posições.
   - `GET /historico/posicoes/atuais`: Consulta as posições atualmente ocupadas (onde `dataFim` em HistoricoPosicao é `null`).
   - Outros endpoints podem ser adicionados para consultar históricos completos por moto, por posição, etc.

## 🔗 Comunicação com Outros Módulos (ex: Módulo Java)

A comunicação entre este módulo .NET e outros módulos (como o de Java, que gerencia motos, filiais, etc.) é realizada primariamente via HTTP REST.

- **Método Principal**: HTTP REST.
  - Exemplo: Quando o módulo Java cadastra uma nova moto e a designa para um pátio, ele pode chamar o endpoint deste módulo .NET para registrar a entrada inicial:
    ```http
    POST http://api-dotnet/movimentacoes/entrada
    Content-Type: application/json

    {
      "motoId": 123,
      "posicaoId": 456,
      "usuarioId": 789,
      "observacoes": "Entrada inicial da moto no pátio X."
    }
    ```

- **Método Avançado (Opcional)**: Para cenários que exigem maior desacoplamento e resiliência, pode-se considerar o uso de mensageria com **Apache Kafka** ou **RabbitMQ** para comunicação assíncrona baseada em eventos (ex: um evento `MotoPosicionadaEvent` após uma entrada ser registrada).

## 📌 Exemplo de Fluxo de Código (Registro de Entrada)

```csharp
// No MovimentacaoController.cs

[ApiController]
[Route("movimentacoes")]
public class MovimentacaoController : ControllerBase
{
    private readonly SeuDbContext _context; // Seu DbContext do EF Core

    public MovimentacaoController(SeuDbContext context)
    {
        _context = context;
    }

    [HttpPost("entrada")]
    public async Task<IActionResult> RegistrarEntrada([FromBody] MovimentacaoEntradaDto dto)
    {
        // Validações do DTO (omissas para brevidade)

        // Cria a movimentação
        var movimentacao = new Movimentacao
        {
            MotoId = dto.MotoId,
            PosicaoId = dto.PosicaoId, // Posição onde a moto está entrando
            UsuarioId = dto.UsuarioId,
            Tipo = "ENTRADA", // Ou um enum/constante
            DataHora = DateTime.UtcNow,
            Observacoes = dto.Observacoes
        };
        _context.Movimentacoes.Add(movimentacao);

        // Cria o registro no histórico de posições
        var historico = new HistoricoPosicao
        {
            MotoId = dto.MotoId,
            PosicaoId = dto.PosicaoId,
            DataInicio = DateTime.UtcNow,
            DataFim = null // Moto está atualmente nesta posição
        };
        _context.HistoricoPosicoes.Add(historico);

        await _context.SaveChangesAsync();

        // Pode retornar o objeto criado ou um status Ok/Created
        return CreatedAtAction(nameof(RegistrarEntrada), new { id = movimentacao.Id }, movimentacao);
    }

    // DTO para o corpo da requisição de entrada
    public class MovimentacaoEntradaDto
    {
        public int MotoId { get; set; }
        public int PosicaoId { get; set; }
        public int UsuarioId { get; set; }
        public string? Observacoes { get; set; }
    }
}

# 🚀 Como Executar o Projeto

---

## ✅ Pré-requisitos

* .NET SDK (versão 6.0 ou superior recomendada)
* Um ambiente de desenvolvimento integrado (IDE) como Visual Studio, JetBrains Rider ou Visual Studio Code.
* Acesso a um banco de dados compatível com EF Core (ex: SQL Server, PostgreSQL, SQLite) e string de conexão configurada em `appsettings.json`.

---

## 🔧 Passo a Passo

1.  **Clone o repositório**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO_DOTNET>
    cd <NOME_DA_PASTA_DO_PROJETO_DOTNET>
    ```

2.  **Configure o Banco de Dados**
    * Atualize a string de conexão em `appsettings.json` (e `appsettings.Development.json`).
    * Aplique as migrações do EF Core (se estiver usando Code First):
        ```bash
        dotnet ef database update
        ```

3.  **Execute o projeto**
    ```bash
    dotnet run
    ```
    Ou execute diretamente pela sua IDE.

4.  **Acesse a documentação da API (Swagger/OpenAPI)**
    Por padrão, geralmente disponível em: `http://localhost:<PORTA>/swagger` (ex: `http://localhost:5001/swagger`)

---

## 🔗 Endpoints da API

### Movimentações (`/movimentacoes`)

| Método | Endpoint         | Descrição                                                       |
| :----- | :--------------- | :-------------------------------------------------------------- |
| POST   | `/entrada`       | Registra a entrada de uma moto no pátio e cria histórico.      |
| POST   | `/saida`         | Registra a saída de uma moto e atualiza dataFim no histórico. |
| GET    | `/{id}`          | Busca uma movimentação específica por ID.                     |
| GET    | `/moto/{motoId}` | Lista todas as movimentações de uma moto específica.          |

*Exportar para as Planilhas*

### Histórico de Posições (`/historico`)

| Método | Endpoint             | Descrição                                                              |
| :----- | :------------------- | :--------------------------------------------------------------------- |
| GET    | `/posicoes/atuais`   | Lista todas as motos e suas posições atuais (dataFim == null).        |
| GET    | `/moto/{motoId}`     | Lista todo o histórico de posições de uma moto específica.            |
| GET    | `/posicao/{posicaoId}`| Lista todo o histórico de ocupação de uma posição específica.          |

*Exportar para as Planilhas*

*(Obs: Alguns endpoints acima são sugestões e podem precisar ser implementados conforme a necessidade.)*

---

## 🗂️ Estrutura Sugerida do Projeto (ASP.NET Core Web API)

```plaintext
SEU_PROJETO_DOTNET/
├── Controllers/                # Controladores da API
│   ├── MovimentacaoController.cs
│   └── HistoricoController.cs
├── Data/                       # DbContext e Migrações do EF Core
│   ├── SeuDbContext.cs
│   └── Migrations/
├── Dtos/                       # Objetos de Transferência de Dados
│   ├── MovimentacaoDto.cs
│   └── HistoricoPosicaoDto.cs
├── Models/                     # Entidades do Domínio (EF Core)
│   ├── Movimentacao.cs
│   └── HistoricoPosicao.cs
├── Services/                   # Lógica de negócios (opcional, pode estar nos controllers para projetos menores)
├── appsettings.json            # Configurações da aplicação
├── appsettings.Development.json # Configurações de desenvolvimento
├── Program.cs                  # Configuração e inicialização da aplicação
├── SeuProjetoDotNet.csproj     # Arquivo de projeto .NET
└── README.md                   # Este arquivo

## 📅 Licença
**MotoMap © 2025 - FIAP**\
Todos os direitos reservados.