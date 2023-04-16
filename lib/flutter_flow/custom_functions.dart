import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

dynamic setDecodeToken(String? dados) {
  int? pos = dados?.lastIndexOf('.');
  String? base641 = (pos != -1) ? dados?.substring(0, pos) : dados;
  //print(base641);
  pos = base641?.lastIndexOf('.');
  //String base642 = (pos != -1)? base641.substring(0, pos): base641; //String result = (pos != -1)? s.substring(0, pos): s;
  String? base642 = base641?.substring(pos! + 1, base641.length);

  base642 = base64.normalize(base642!);

  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String decoded = stringToBase64.decode(base642);

  Map<String, dynamic> usuario = jsonDecode(decoded);
  //print(usuario);
  int userid = int.tryParse(usuario['userid']) ?? -1; //(usuario['userid']);
  String username = (usuario['username']);

  if (userid > 0) {
    return usuario;
  } else {
    return '0';
  }
}

String? separarNomeCondominio(dynamic js) {
  // Converter a string JSON em um objeto Dart
  Map<String, dynamic> objetoJSON = (js!);

  // Acessar as propriedades do objeto Dart
  String nomeMorador = objetoJSON['nome'];

  // Acessar as informações do condomínio
  List<dynamic> condominios = objetoJSON['condominios'];
  for (var condominio in condominios) {
    String codigo = condominio['codigo'];
    String nome = condominio['nome'];
    String cnpj = condominio['cnpj'];

    return nome;

    // Acessar as unidades do morador
    //List<dynamic> unidadesMorador = condominio['unidades_morador'];
    //for (var unidade in unidadesMorador) {
    //  String codigo = unidade['codigo'];
    //  String nome = unidade['nome'];
    // String bloco_id = unidade['bloco_id'];
    //String bloco_nome = unidade['bloco_nome'];

    // Fazer algo com as informações da unidade do morador
    //print('Código da unidade: $codigoUnidade');
    // print('Nome da unidade: $nomeUnidade');
    //print('ID do bloco: $idBloco');
    //print('Nome do bloco: $nomeBloco');
    //return unidadesMorador;
    //}
  }
  // Retorna o objeto separado
  //return condominios;
}

String? separarCondUnidades(dynamic js) {
  // Converter a string JSON em um objeto Dart
  Map<String, dynamic> objetoJSON = (js!);

  // Acessar as propriedades do objeto Dart
  String nomeMorador = objetoJSON['nome'];

  // Acessar as informações do condomínio
  List<dynamic> condominios = objetoJSON['condominios'];
  for (var condominio in condominios) {
    String codigo = condominio['codigo'];
    String nome = condominio['nome'];
    String cnpj = condominio['cnpj'];

    //return nome;

    // Acessar as unidades do morador
    List<dynamic> unidadesMorador = condominio['unidades_morador'];
    for (var unidade in unidadesMorador) {
      String codigo = unidade['codigo'];
      String nome = unidade['nome'];
      String bloco_id = unidade['bloco_id'];
      String bloco_nome = unidade['bloco_nome'];

      // Fazer algo com as informações da unidade do morador
      //print('Código da unidade: $codigoUnidade');
      // print('Nome da unidade: $nomeUnidade');
      //print('ID do bloco: $idBloco');
      //print('Nome do bloco: $nomeBloco');
      return bloco_nome + " - " + nome;
    }
  }
  // Retorna o objeto separado
  //return condominios;
}

String? removeMascaraString(String? stringComMascara) {
  String? stringSemMascara =
      stringComMascara?.replaceAll(RegExp(r'[^0-9]'), '');
  return stringSemMascara;
}

String? base64ToImage(String? base64String) {
  return "image";
}
