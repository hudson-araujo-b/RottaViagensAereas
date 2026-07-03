namespace RottaViagensAereas.Models
{
    public class UsuarioModel
    {
        public int Id { get; set; }
        public string Nome { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string SenhaHash { get; set; } = string.Empty;
        public string NivelAcesso { get; set; } = string.Empty;
        public string? Telefone { get; set; }
        public string? Cpf { get; set; }
        public string? Cep { get; set; }
        public DateOnly? DataNascimento { get; set; }
    }
}
