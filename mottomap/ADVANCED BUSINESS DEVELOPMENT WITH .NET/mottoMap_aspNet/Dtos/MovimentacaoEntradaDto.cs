using System.ComponentModel.DataAnnotations;

namespace MotoMap.Api.DotNet.Dtos
{
    public class MovimentacaoEntradaDto
    {
        [Required]
        public int MotoId { get; set; }

        [Required]
        public int UsuarioId { get; set; }

        public int? PosicaoId { get; set; }

        public string? Observacoes { get; set; }
    }
}