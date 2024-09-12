
import 'package:flutter/material.dart';
import 'package:news_app/pages/second_page.dart';
import 'package:news_app/pages/serch_page.dart';
import 'package:news_app/pages/upper_section.dart';
import 'package:news_app/utilities/top_serch.dart';

import '../components/app_drower.dart';
import '../components/custom_serch_delegate.dart';
import '../components/news_box.dart';
import '../functions/calling_api.dart';
import '../themes/froster_glass.dart';
import '../utilities/images.dart';
import 'lower_section.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    String Serch_query="";

    return Scaffold(
      drawer: My_drower(),
      // backgroundColor: Colors.black87,

      appBar: AppBar(title: Text("News"),actions: [IconButton(onPressed: (){
        showSearch(context: context, delegate: custom_serch() ,query: Serch_query );
      }, icon: Icon(Icons.search))],),

      // appBar: AppBar(title: Autocomplete(),),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        
          // shrinkWrap: true,
          children: [
        
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                  Upper_section(),
                
        
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                Text("Trending News",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            lower_dection()
        
        
        
        
        
          ],
        ),
      ),
    );
  }
}




