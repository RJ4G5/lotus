library my_prj.globals;

import 'dart:typed_data';

import 'Models/model_form_cliente.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FORM_CLIENTE form_cliente = FORM_CLIENTE();

double razao_width = 100;
double fantazia_width = 302;
bool CNPJ_CPF_enabled = true;
int tableIndexSelected = 0;

FlutterSecureStorage secureStorage = const FlutterSecureStorage();

void containsEncryptionKey() async{
      var containsEncryptionKey = await secureStorage.containsKey(key: 'keyLotus'); // verifica se existe uma chave criada
      
      if (!containsEncryptionKey) {
        var key = Hive.generateSecureKey(); // chave a ser gerada
        await secureStorage.write(key: 'keyLotus', value: base64UrlEncode(key));
      }
      
  }

  Future<Uint8List> readKey() async{
    String a = "" ;
    await secureStorage.read(key: 'keyLotus').then((value) => a = value.toString());  
    return base64Url.decode( a) ;

  }
  

