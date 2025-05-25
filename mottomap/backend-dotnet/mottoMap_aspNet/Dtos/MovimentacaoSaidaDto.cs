using System.ComponentModel.DataAnnotations;

namespace MotoMap.Api.DotNet.Dtos
{
    public class MovimentacaoSaidaDto
    {
        [Required]
        public int MotoId { get; set; }

        [Required]
        public int UsuarioId { get; set; }

        public string? Observacoes { get; set; }
    }
}