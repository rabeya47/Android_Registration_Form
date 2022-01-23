
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:registration_form/StudentModel.dart';
import 'package:registration_form/custom_dialog.dart';
import 'package:registration_form/http_helper.dart';
import 'package:http/http.dart' as http;



class StudentController{
  var url = Uri.parse('http://192.168.1.72:9001/userSave');
  Future<dynamic> save(BuildContext context, StudentModel student) async{
    try{
      var jsonData = jsonEncode(student.toJson());
      var res = await postData(url, jsonData);
      if(res.statusCode == 200){
        showSuccessMessage(context);
      }else{
        showErrorMessage(context, message: 'Student submitted failed');
      }
    }catch(e){
      log(e.toString());
    }
  }
}