import "dart:convert";

import "package:http/http.dart" as http;

import "../utilities/api_key.dart";

Future<List>top_headlines({String serch_query_value="",String categry_value="",String page_size_value="",String country_value=""})async
{
  String query="";
  String page="";
  String categry="";
  String country="";

  if(!serch_query_value.isEmpty)
    {
      query= "&"+"q"+"="+serch_query_value;
    }
  if(!categry_value.isEmpty)
    {
      categry="&"+"category"+"="+categry_value;
    }
  if(!country_value.isEmpty)
    {
      country="&"+"country"+"="+country_value;
    }
  if(!page_size_value.isEmpty){
    page= "&"+"pageSize"+ "="+ page_size_value;
  }


  print("request   ->>>>>" +"https://newsapi.org/v2/top-headlines?apiKey="
      +api_key+query+categry+country+page);


  final response =await http.get(Uri.parse(
    "https://newsapi.org/v2/top-headlines?apiKey="
      +api_key+query+categry+country+page


  ));

  Map result = jsonDecode(response.body);
  print(result);

  print('Fetched');

  return (result['articles']);

}

Future<List>serch_it({String serch_query_value="",String categry_value="",String page_size_value="",})async
{
  String query="";
  String page="";
  String categry="";
  String country="";

  if(!serch_query_value.isEmpty)
  {
    query= "&"+"q"+"="+serch_query_value;
  }
  if(!categry_value.isEmpty)
  {
    categry="&"+"category"+"="+categry_value;
  }

  if(!page_size_value.isEmpty){
    page= "&"+"pageSize"+ "="+ page_size_value;
  }


  final response =await http.get(Uri.parse(
      "https://newsapi.org/v2/everything?apiKey="
          +api_key+query+categry+page


  ));

  Map result = jsonDecode(response.body);
  print(result);
  print('Fetched');

  return (result['articles']);

}