import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/components/app_drower.dart';
import 'package:news_app/themes/froster_glass.dart';
import 'package:news_app/utilities/images.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custom_serch_delegate.dart';
import '../functions/theme_provider.dart';
import '../utilities/top_serch.dart';

class Description_page extends StatefulWidget {
  // const Description_page({super.key});
  List? items=[];
  int index=0;

  Description_page( this.items,this.index);


  @override
  State<Description_page> createState() => _Description_pageState(items!,index);
}

class _Description_pageState extends State<Description_page> {
  List<dynamic> items=[];
  int index=0;
  _Description_pageState(this.items,this.index);
  @override
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // Scroll to the default index after the build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToDefaultIndex();
    });
  }
  void _scrollToDefaultIndex() {
    // Calculate the offset for the default index, e.g., index 5
    final double defaultOffset = index * 540; // Replace with your item height
    _controller.animateTo(
      defaultOffset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget build(BuildContext context) {

    Future web_view(String url)async{

      if(!await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView)){
        throw Exception("page not found");
    }

    }
    return
      Scaffold(
        // backgroundColor: Colors.deepPurple,
      drawer: My_drower(),
      appBar: AppBar(title: Text("News"),actions: [IconButton(onPressed: (){
        showSearch(context: context, delegate: custom_serch() ,query: serch_query );
      }, icon: Icon(Icons.search))],),
          body:
          ListView.builder(
              controller: _controller,
            itemCount: items.length,
              itemBuilder: (context,ind){

            return Discription_card(items: items, index: ind);
          })

    );
  }
}

// Discription_card(items: items, index: index),

class Discription_card extends StatelessWidget {
  const Discription_card({
    super.key,
    required this.items,
    required this.index,
  });

  final List items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onHorizontalDragCancel: (){
      //   setState(() {
      //     index++;
      //   });
      // },

      child: Container(
        // height: MediaQuery.of(context).size.height,
        height: 530,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),

            image: DecorationImage(image: NetworkImage(items[index]['urlToImage']??grey_back,),fit: BoxFit.cover)),
        child: FrostedGlassBox(theHeight: 100.0,theWidth: 100.0,
          theChild: Container(
            padding: EdgeInsets.all(8),

            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),

                        Text(items[index]['title']??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        // Text(items[index]['source']['name']??''),

                        Container(height: 200,width: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(image:NetworkImage(items[index]['urlToImage']??'') )),
                            // child: Image.network(items[index]['urlToImage']??image_skel)
                        ),
                        Text(items[index]['source']['name']??'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 4,),

                        Text( "Discription : " + (items[index]['description']??""),style: TextStyle(fontSize: 15),),
                        SizedBox(height: 8,),
                        Text(items[index]['author']??""),
                        SizedBox(height: 8,),
                        Text(items[index]['publishedAt']??""),
                        Text(items[index]['content']??""),
                        // ElevatedButton(onPressed: (){
                        //   web_view(items[index]['url']??"");
                        //
                        // },
                        //     child: Text("Read full article"))




                      ],

                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      web_view(items[index]['url']??"");

                    }, child: Text("Read full article")),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){
                          Provider.of<ThemeProvider>(context,listen: false).make_favourite(items[index]);
                        }, icon: Provider.of<ThemeProvider>(context).is_favourate(items[index]['url'])?Icon(Icons.favorite_outlined):Icon(Icons.favorite_outline)),


                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                        SizedBox(width: 5,)
                      ],
                    ),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future web_view(String url)async{

  if(!await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView)){
    throw Exception("page not found");
  }

}


