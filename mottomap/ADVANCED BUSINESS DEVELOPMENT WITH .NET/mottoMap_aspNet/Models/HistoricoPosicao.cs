using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MotoMap.Api.DotNet.Models
{
    public class HistoricoPosicao
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        public DateTime DataInicio { get; set; }

        public DateTime? DataFim { get; set; } // Nullable

        [Required]
        public int MotoId { get; set; }

        [Required]
        public int PosicaoId { get; set; }
    }
}