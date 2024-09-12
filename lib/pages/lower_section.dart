
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/themes/Glass_container.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shimmer/shimmer.dart';

import '../components/list_iew_loader.dart';
import '../components/looding_skeleton.dart';
import '../functions/calling_api.dart';
import '../functions/theme_provider.dart';
import '../utilities/custom_text.dart';
import '../utilities/images.dart';
import 'Discription_page.dart';

class lower_dection extends StatelessWidget {
  const lower_dection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(news_back_image2),fit: BoxFit.cover),),
      child: FutureBuilder<List>(
        future: top_headlines(country_value: "in"),
        builder: (context,snapshot){
          if(snapshot.hasData) {
            print("if");
            print(snapshot.data);

            return ListView.builder(
                physics: ClampingScrollPhysics(),
                // I had used primary to make scroll of this wigid false
                // eith the heplp of primary and shrink well i able to achive scroll the whole screen
                primary: false,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){

                  return InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Description_page(snapshot.data,index)));},
                    child: Card(color: Color(0x00ffffff),
                      child: Glass_container(theHeight: 115.0,theWidth: double.infinity,
                        theChild: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data![index]['urlToImage'] != null
                                      ? snapshot.data![index]['urlToImage']
                                      : image_skel,
                                  imageBuilder: (context, imageProvider) => Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider, fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.yellow),
                                  ),
                                  placeholder: (context, url) =>
                                      ImageLoadingSkeleton(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              )
                              // ,SizedBox(width: 8,)
                              ,Expanded(child: Column(
                                children: [
                                  modifiedText(
                                      size: 16, text: snapshot.data![index]['title']),
                                  // SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      modifiedText(
                                          size: 14, text: snapshot.data![index]['source']['name']),
                                      Row(
                                        children: [
                                          IconButton(onPressed: (){
                                            Provider.of<ThemeProvider>(context,listen: false).make_favourite(snapshot.data![index]);
                                          }, icon: Provider.of<ThemeProvider>(context).is_favourate(snapshot.data![index]['url'])?Icon(Icons.favorite_outlined):Icon(Icons.favorite_outline)),

                                          IconButton(onPressed: (){Share.share(snapshot.data![index]['urlToImage']);}, icon:Icon(Icons.share,size: 18,))
                                        ],

                                      )
                                    ],
                                  ),
                                ],
                              ))

                            ],
                          ),


                        ),
                      ),
                    ),
                  );
                });
          }
          else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return MyDarkLoadingSkeleton();

        }
      ),
    );
  }
}

