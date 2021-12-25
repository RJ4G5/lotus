import 'package:hive/hive.dart';
import './model_table_cliente.dart';

@HiveType(typeId: 0)
class DB_CLIENTE extends HiveObject {
  DB_CLIENTE(
      {required this.cnpjcpf,
      this.img = "",
      this.nome_fisico_juridico = "",
      this.razao_social_nascimento = "",
      this.email = "",
      this.telefone = "",
      this.cep = "",
      this.endereco = "",
      this.numero = "",
      this.bairro = "",
      this.cidade = ""});

  @HiveField(0)
  String cnpjcpf;

  @HiveField(1)
  String img;

  @HiveField(2)
  String nome_fisico_juridico;

  @HiveField(3)
  String razao_social_nascimento;

  @HiveField(4)
  String email;

  @HiveField(5)
  String telefone;

  @HiveField(6)
  String cep;

  @HiveField(7)
  String endereco;

  @HiveField(8)
  String numero;

  @HiveField(9)
  String bairro;

  @HiveField(10)
  String cidade;

  TD toTD() {
    return TD(
        this.cnpjcpf,
        this.cnpjcpf.length > 14
            ? this.razao_social_nascimento
            : this.nome_fisico_juridico,
        telefone);
  }

  @override
  String toString() {
    TD td = this.toTD();

    return (td.cnpjcpf+ " "+ td.nome +" " + td.telefone).toLowerCase();
  }
}
