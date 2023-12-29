
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiServices{
  static const baseUrl = "https://onemove.ae/api";

  // POST API SERVICE
  static postApi({required String endPoint, required Map<String, String> header, required Map<String, dynamic> body})async{
    final uri = Uri.parse("$baseUrl$endPoint");
    try{
      http.Response response = await http.post(uri, headers: header, body: body).timeout(const Duration(seconds: 60), onTimeout: (){
        throw TimeoutException("Connection Timed Out");
      });
      return response;
    }on SocketException catch(error){
      throw SocketException(error.toString());
    }on TimeoutException catch(error){
      throw TimeoutException(error.toString());
    }
  }

  // GET API SERVICE
  static getApi({required String endPoint, required Map<String, String> header,})async{
    final uri = Uri.parse("$baseUrl$endPoint");
    try{
      http.Response response = await http.get(uri, headers: header,).timeout(const Duration(seconds: 60), onTimeout: (){
        throw TimeoutException("Connection Timed Out");
      });
      return response;
    }on SocketException catch(error){
      throw SocketException(error.toString());
    }on TimeoutException catch(error){
      throw TimeoutException(error.toString());
    }
  }
}