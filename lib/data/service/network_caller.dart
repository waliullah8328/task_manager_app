import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../model/network_response.dart';

class NetworkCaller{


static Future<NetworkResponse> getRequest(String url)async{
  Uri uri = Uri.parse(url);
  debugPrint(url);

  try{
    final Response response = await get(uri);
    printResponse(url,response);

    if( response.statusCode == 200){
      final decodedData = jsonDecode(response.body);
      return NetworkResponse(isSuccess: true, statusCode: response.statusCode,responseData: decodedData);


    }else{
      return NetworkResponse(isSuccess: false, statusCode: response.statusCode);

    }
  }
  catch(e){
    return NetworkResponse(isSuccess: false, statusCode: -1,errorMessage: e.toString());
    
  }


}

static Future<NetworkResponse> postRequest(
    {required String url, Map<String, dynamic>? body})async{
  Uri uri = Uri.parse(url);
  debugPrint(url);

  try{
    final Response response = await post(uri,body: jsonEncode(body),headers: {
      "Content-Type": "application/json"
    });
    printResponse(url,response);

    if( response.statusCode == 200){
      final decodedData = jsonDecode(response.body);
      return NetworkResponse(isSuccess: true, statusCode: response.statusCode,responseData: decodedData);


    }else{
      return NetworkResponse(isSuccess: false, statusCode: response.statusCode);

    }
  }
  catch(e){
    return NetworkResponse(isSuccess: false, statusCode: -1,errorMessage: e.toString());

  }


}



static void printResponse(String url,Response response){
  debugPrint("URL: $url\n RESPONSE CODE: ${response.statusCode}\n BODY: ${response.body}");

}


}