enum Prioridade { baixa, media, alta }

class Tarefa {
  String id;
  String titulo;
  String descricao;
  DateTime data;
  DateTime dataCriacao;
  String prioridade;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.data,
    required this.descricao,
    required this.prioridade,
  }) : dataCriacao = DateTime.now();
}
