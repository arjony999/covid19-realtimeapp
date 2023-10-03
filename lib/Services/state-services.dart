import 'dart:convert';
import 'package:covid19_app_using_api/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import '../Model/WorldStateModel.dart';

class StateServices {

  Future<WorldStateModel> fetchWorldStateRecords ()async{

    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetchCountryList ()async{

    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
      return data;
    }else{
      throw Exception('Error');
    }
  }
}