import 'dart:convert' show utf8;

import 'package:crypto/crypto.dart';

class Helper {
  static String publicApiKey = "f76369adc38f3b1a42b4b91ef4b3f880";
  static String privateApiKey = "15137e9c2846d6779c34743ce2130c901d15e633";
}

var url = "http://gateway.marvel.com/v1/public/";
var timeStamp = DateTime.now();
var hash;

String gerarUrl(String assunto, {String adicional = ""}) {
  gerarHash();
  String urlFinal =
      "$url$assunto?apikey=${Helper.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$adicional";
  print(urlFinal);
  return urlFinal;
}

gerarHash() {
  hash = generateMd5(
      timeStamp.toIso8601String() + Helper.privateApiKey + Helper.publicApiKey);
  print(hash);
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
