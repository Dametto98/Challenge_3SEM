using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MotoMap.Api.DotNet.Models
{
    public enum TipoMovimentacao
    {
        ENTRADA,
        SAIDA
    }

    public class Movimentacao
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public TipoMovimentacao Tipo { get; set; }

        [Required]
        public DateTime DataHora { get; set; }

        public string? Observacoes { get; set; } // Nullable

        [Required]
        public int MotoId { get; set; }

        [Required]
        public int UsuarioId { get; set; }

        public int? PosicaoId { get; set; } // Nullable
    }
}