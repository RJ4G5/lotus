import 'package:hive/hive.dart';

import '../Models/model_db_cliente.dart';

class ClenteAdapter extends TypeAdapter<DB_CLIENTE> {
  @override
  final typeId = 0;

  @override
  DB_CLIENTE read(BinaryReader reader) {
    return DB_CLIENTE(
        cnpjcpf: reader.readString(),
        img: reader.readString(),
        nome_fisico_juridico: reader.readString(),
        razao_social_nascimento: reader.readString(),
        email: reader.readString(),
        telefone: reader.readString(),
        cep: reader.readString(),
        numero: reader.readString(),
        bairro: reader.readString(),
        cidade: reader.readString(),

    );
  }

  @override
  void write(BinaryWriter writer, DB_CLIENTE obj) {
    writer.writeString(obj.cnpjcpf);
    writer.writeString(obj.img);
    writer.writeString(obj.nome_fisico_juridico);
    writer.writeString(obj.razao_social_nascimento);
    writer.writeString(obj.email);
    writer.writeString(obj.telefone);
    writer.writeString(obj.cep);
    writer.writeString(obj.numero);
    writer.writeString(obj.bairro);
    writer.writeString(obj.cidade);
  }
}