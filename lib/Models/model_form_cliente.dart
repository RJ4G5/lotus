
import 'package:flutter/material.dart';
import './model_table_cliente.dart';
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

    final Data = [
                    TD('Jéssica Malu Galvão', '21.291.366/0001-37', "Excluir"),
                    TD('CEL CONSULTORIA E GESTÃO EMPRESARIAL LTDA', '172.113.753-02', "Excluir"),
                    TD('C.C.L. GEBER E CIA LTDA', '93.155.119/0001-14', "Excluir"),
                    TD('Cauê Calebe Juan Nascimento', '202.764.665-51', "Excluir"),
                    TD('Alícia e Rita Financeira Ltda', '48.782.145/0001-18', "Excluir"),
                 ];

    void save(){

       this.Data.insert(0, TD('Melqui', '21.291.366/0001-37', "Excluir"));
  
        this.Context.state.setState(()=>{});
    
        if(this.require()){
            print(this.CNPJ_CPF.text);
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