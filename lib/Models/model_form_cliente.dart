
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import './model_table_cliente.dart';
import './model_db_cliente.dart';
import '../main.dart';


class FORM_CLIENTE{


    

    var Context;

    final CNPJ_CPF = TextEditingController();
    final Img = TextEditingController(); 
    final Nome_fisico_juridico = TextEditingController();
    final RazaoSocial_nascimento = TextEditingController();
 
    final Email = TextEditingController();
    final Telefone = TextEditingController();
    final Cep = TextEditingController();
    final Numero = TextEditingController();
    final Bairro = TextEditingController();
    final Cidade = TextEditingController();
    
    final DataTable = [
                    TD( '21.291.366/0001-37','Jéssica Malu Galvão', '(31) 98883-8995'),
                  
                 ];

    void save() async {

      // this.DataTable.insert(0, TD('Melqui', '21.291.366/0001-37', "Excluir"));
       var box = await  Hive.openBox('testBox');
     
  
        this.Context.state.setState(()=>{});

        if(this.require()){

              /**/
            DB_CLIENTE cliente = await box.get(CNPJ_CPF.text);
         
            if(cliente == null){
                await box.put(CNPJ_CPF.text, DB_CLIENTE(
                        cnpjcpf: CNPJ_CPF.text,
                        img: Img.text,
                        nome_fisico_juridico: Nome_fisico_juridico.text,
                        razao_social_nascimento: RazaoSocial_nascimento.text,
                        email: Email.text,
                        telefone: Telefone.text,
                        cep: Cep.text,
                        numero: Numero.text,
                        bairro: Bairro.text,
                        cidade: Cidade.text,
                  ));
            }else{
                   print(cliente.cnpjcpf);
                   print(cliente.nome_fisico_juridico);
            }
          
        }
        
    }
    void delete(){

    }

    bool require(){
        bool resposta = false;
        if(this.CNPJ_CPF.text.length > 14){
            this.RazaoSocial_nascimento.text.length == 0  ?  this.setSnackBar('Razao Social obrigatorio!',Color(0xFFB71C1C)) : resposta = true;      
        }
        if(this.CNPJ_CPF.text.length == 14){
            this.Nome_fisico_juridico.text.length == 0  ?  this.setSnackBar('O nome é obrigatorio!', Color(0xFFB71C1C)) : resposta = true;
        }

        return resposta;
    }

    void setContext(BuildContext context){
        this.Context = context;
    }

    void setSnackBar(String text, Color background){
            final snackBar = SnackBar(
                                width: 300,
                                duration: const Duration(seconds: 1),
                                backgroundColor: background,
                                content:  Text(text),
                                behavior: SnackBarBehavior.floating,
                                
                            );
            ScaffoldMessenger.of(this.Context).showSnackBar(snackBar);
    }

}