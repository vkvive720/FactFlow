import 'package:flutter/material.dart';

import '../pages/second_page.dart';
import '../utilities/top_serch.dart';

class custom_serch extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(onPressed: (){query='';}, icon: Icon(Icons.clear))


    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){ close(context,null);}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery=[];
    if(!query.isEmpty){
      matchQuery.add(query);
    }

    for(var items in newsKeywords){
      if(query.isEmpty){
        break;
      }

      if(items.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(items);
      }


    }
    return ListView.builder(itemCount: matchQuery.length,
        itemBuilder: (context,index){
          return ListTile(title: Text(matchQuery[index]),);
        });

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery=[];

    if(!query.isEmpty){
      matchQuery.add(query);
    }

    for(var items in newsKeywords){
      if(query.isEmpty){
        break;
      }

      if(items.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(items);
      }


    }
    return InkWell(
      onTap: (){
        close(context,null);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage(query) ));
      },
      child: ListView.builder(itemCount: matchQuery.length,
          itemBuilder: (context,index){
            return ListTile(title: Text(matchQuery[index]),);
          }),
    );


  }


}
