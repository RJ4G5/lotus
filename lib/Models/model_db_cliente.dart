import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class DB_CLIENTE  {
  DB_CLIENTE({ 
        required this.cnpjcpf,
        this.img = "",
        this.nome_fisico_juridico = "",
        this.razao_social_nascimento = "",
        this.email = "",
        this.telefone = "",
        this.cep = "",
        this.numero = "",
        this.bairro = "",
        this.cidade= ""
    });

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
  String numero;
   
  @HiveField(8)
  String bairro;
   
  @HiveField(9)
  String cidade;

  @override
  String toString() {
    return "";
  }
}