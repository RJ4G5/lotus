import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:image/image.dart' as IMG;
import '../../globals.dart' as globals;
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import './model_table_cliente.dart';
import './model_db_cliente.dart';
import 'package:file_picker/file_picker.dart';


class FORM_CLIENTE {
  var Context;

  final CNPJ_CPF = TextEditingController();

  final ImgBase64 = TextEditingController();
  final Nome_fisico_juridico = TextEditingController();
  final RazaoSocial_nascimento = TextEditingController();

  final Email = TextEditingController();
  final Telefone = TextEditingController();
  final Cep = TextEditingController();
  final Endereco = TextEditingController();
  final Numero = TextEditingController();
  final Bairro = TextEditingController();
  final Cidade = TextEditingController();

  final DataTable = [];



  void listClientes() async {
    Hive.openBox('testBox').then((db) => {
          this.DataTable.clear(),
          db.values.forEach((cliente) {
            this.DataTable.insert(0, cliente.toTD());
            print(cliente.toTD());
          }),
          this.Context.state.setState(() => {})
        });
  }

  void save() async {
   // var box = await Hive.openBox('testBox');
    var box = await Hive.openLazyBox('testBox');

    if (this.require()) {
      DB_CLIENTE cliente_DB = await box.get(CNPJ_CPF.text);

      DB_CLIENTE new_cliente = await DB_CLIENTE(
        cnpjcpf: CNPJ_CPF.text,
        img: ImgBase64.text,
        nome_fisico_juridico: Nome_fisico_juridico.text,
        razao_social_nascimento: RazaoSocial_nascimento.text,
        email: Email.text,
        telefone: Telefone.text,
        cep: Cep.text,
        endereco: Endereco.text,
        numero: Numero.text,
        bairro: Bairro.text,
        cidade: Cidade.text,
      );
      if (cliente_DB == null) {
        await box.put(CNPJ_CPF.text, new_cliente);
        await box.compact();  
        await box.close();
        
        this.DataTable.insert(0, new_cliente.toTD());
        this.clearForm();
        this.setSnackBar('Salvo!', Color(0xFF388E3C));
      } else {         
     
        await box.put(CNPJ_CPF.text, new_cliente);
        await box.compact();  
        await box.close();
        this.DataTable[globals.tableIndexSelected] = new_cliente.toTD();
        this.clearForm();
        this.setSnackBar('Atualizado!', Color(0xFF388E3C));
      }
    }
  }

  void clearForm() {
    this.CNPJ_CPF.clear();
    this.ImgBase64.clear();
    this.Nome_fisico_juridico.clear();
    this.RazaoSocial_nascimento.clear();
    this.Email.clear();
    this.Telefone.clear();
    this.Cep.clear();
    this.Endereco.clear();
    this.Numero.clear();
    this.Bairro.clear();
    this.Cidade.clear();
    globals.CNPJ_CPF_enabled = true;
    globals.tableIndexSelected = -1;
    this.Context.state.setState(() => {});
  }

  void delete() async {
    var box = await Hive.openLazyBox('testBox');
    TD td = this.DataTable[globals.tableIndexSelected];
    box.delete(td.cnpjcpf).then((value) => {
          this.DataTable.remove(td),
          box.compact(),       
          box.close(),
          this.clearForm(),
          this.setSnackBar('Removido com sucesso!', Color(0xFF388E3C))
        });
  }

  void getCliente(String key) async {
    final DB = await Hive.openBox('testBox');
    DB_CLIENTE cliente = DB.get(key);

    this.CNPJ_CPF.text = cliente.cnpjcpf;
    this.ImgBase64.text = cliente.img;
    this.Nome_fisico_juridico.text = cliente.nome_fisico_juridico;
    this.RazaoSocial_nascimento.text = cliente.razao_social_nascimento;
    this.Email.text = cliente.email;
    this.Telefone.text = cliente.telefone;
    this.Cep.text = cliente.cep;
    this.Endereco.text = cliente.endereco;
    this.Numero.text = cliente.numero;
    this.Bairro.text = cliente.bairro;
    this.Cidade.text = cliente.cidade;

    globals.tableIndexSelected = this.DataTable.indexWhere(((td) => td.cnpjcpf == cliente.cnpjcpf));
    globals.CNPJ_CPF_enabled = false;
    
    DB.close();

    if (key.length > 14)
      this.activeForm("CNPJ");
    else
      this.activeForm("CPF");
  }


  void activeForm(String key) {
    switch (key) {
      case "CPF":
        this.Context.state.setState(
            () => {globals.razao_width = 100, globals.fantazia_width = 302});
        break;
      case "CNPJ":
        this.Context.state.setState(
            () => {globals.razao_width = 200, globals.fantazia_width = 200});
        break;
    }
  }

  bool require() {
    bool resposta = false;
    if (this.CNPJ_CPF.text.length > 14) {
      this.RazaoSocial_nascimento.text.length == 0
          ? this.setSnackBar('Razao Social obrigatorio!', Color(0xFFB71C1C))
          : resposta = true;
    }
    if (this.CNPJ_CPF.text.length == 14) {
      this.Nome_fisico_juridico.text.length == 0
          ? this.setSnackBar('O nome é obrigatorio!', Color(0xFFB71C1C))
          : resposta = true;
    }

    return resposta;
  }

  void search(e) {
    Hive.openBox('testBox').then((db) => {
          this.DataTable.clear(),
          db.values.forEach((cliente) {
            if (this.removeAcent(cliente.toString()).contains(e.toLowerCase())) {
              this.DataTable.insert(0, cliente.toTD());
            }
          }),
          this.Context.state.setState(() => {}),
          db.close()
        });
  }

  void setContext(BuildContext context) async {
    this.Context = await context;
  }

  String removeAcent(String frase) {
    var acentos = 'áàãâéêíóôõúüçÁÀÃÂÉÊÍÓÔÕÚÜÇ'.split("");
    var s_acentos = "aeeiooouucAAAAEEIOOOUUC".split("");
    var a = frase.split("");
    a.asMap().forEach((index_a, letra) => {
          acentos.asMap().forEach((index_acentos, acento) {
            if (letra == acento) {
              a[index_a] = s_acentos[index_acentos];
            }
          })
        });

    return a.join();
  }

  void selectImagem() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg','png','jpeg'],
      );
      if (result != null) {
          File file = File(result.files.first.path.toString());
          var image = IMG.decodeImage(file.readAsBytesSync())!;
 
          var thumbnail = IMG.copyResize(image, width: 200);         
          this.ImgBase64.text =  base64.encode(IMG.encodeJpg(thumbnail));  
          this.Context.state.setState(() => {}); 
      }
      
  }
  void removeImagem(){
      this.ImgBase64.clear();
      this.Context.state.setState(() => {}); 
  }
  getImagemPerfil(){
      return MemoryImage(Base64Decoder().convert(this.ImgBase64.text));
  }

  

  String setPathExc(String path) {
      final DB =  Hive.openBox('config');
      DB.then((conn) => conn.put("path", path));   
      return path;
  }

  String getPathExc(){
    final DB =  Hive.openBox('config');
     return DB.then((conn) => conn.get("path")).toString();   
      
  }

  void setSnackBar(String text, Color background) {
    final snackBar = SnackBar(
      width: 300,
      duration: const Duration(seconds: 1),
      backgroundColor: background,
      content: Text(text),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(this.Context).showSnackBar(snackBar);
  }
}
