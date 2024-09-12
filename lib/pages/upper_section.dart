import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/functions/calling_api.dart';
import 'package:news_app/themes/FrostedGlassBox_with.dart';
import 'package:news_app/themes/Glass_container.dart';
import 'package:news_app/themes/froster_glass.dart';
import 'package:news_app/utilities/custom_text.dart';
import "package:share/share.dart";
import 'package:shimmer/shimmer.dart';

import '../components/list_iew_loader.dart';
import '../components/looding_skeleton.dart';
import '../utilities/images.dart';
import 'Discription_page.dart';

class Upper_section extends StatelessWidget {
  Upper_section({
    super.key,
  });

  List<String> images=[science_image,tech_image,entertainment_image,buiseness_image,sports_image,health_image,image_skel];
  List<String> categories=["science","technology","entertainment","business","sports","health","general"];




  @override
  Widget build(BuildContext context,) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 8,),
          categy_wedgit(categories: categories,index: 0,images: images,),
          SizedBox(width: 8,),
          categy_wedgit(categories: categories,index: 1,images: images,),
          SizedBox(width: 8,),
          categy_wedgit(categories: categories,index: 2,images: images,),
          SizedBox(width: 8,),
          SizedBox(width: 8,),
          categy_wedgit(categories: categories,index: 3,images: images,),
          SizedBox(width: 8,),
          categy_wedgit(categories: categories,index: 4,images: images,),
          SizedBox(width: 8,),
          categy_wedgit(categories: categories,index: 5,images: images,),
          SizedBox(width: 8,),
          categy_wedgit(categories: categories,index: 6,images: images,),
          // categy_wedgit(categories: categories,index: 5,),

        ],

      ),
    );
  }
}

class categy_wedgit extends StatelessWidget {
  const categy_wedgit({
    super.key,
    required this.categories,
    required this.index,
    required this.images,

  });
  final int index;
  final List<String> categories;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    int ind=0;
    List<String> heading=["Science","Technology","Entertainment","Business","Sports","Health","General"];
    return FutureBuilder<List>(
        future: top_headlines(categry_value: categories[index],page_size_value: '90',country_value: "us"),
        builder:(context,category){

          if(category.hasData){
            return InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Description_page(category.data,ind)));},
              child: Container(
                // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(news_back_image))),
                child: Glass_container(
                  theHeight: 320.0,theWidth: 300.0,
                  theChild: Column(
                    mainAxisAlignment:MainAxisAlignment.start ,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 200,
                        child: Stack(
                          children: [

                            CachedNetworkImage(
                              imageUrl: category.data![ind]['urlToImage']
                                  ??
                                   images[index],
                              imageBuilder: (context, imageProvider) => Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.yellow),
                              ),
                              placeholder: (context, url) =>
                                  Container(height: 200,width: 300,
                                      child: ImageLoadingSkeleton()),
                              errorWidget: (context, url, error) => Container(height: 200,width: 300,
                                            child: ImageLoadingSkeleton()),
                            ),

                          ],
                        ),


                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          // margin: EdgeInsets.all(5),
                          // height: 90,
                          // width: 300,
                          child: Column(
                            children: [
                              modifiedText(text:category.data![ind]['title'] , size: 18),
                              // Text(category.data![2]['title'],maxLines: 2,overflow: TextOverflow.ellipsis,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(category.data![ind]['source']['name']),
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                                      IconButton(onPressed: (){ Share.share(category.data![ind]['url']);}, icon:Icon(Icons.share))
                                    ],

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );




          }



          return Card_looding() ;
          // return CircularProgressIndicator();




    } );
  }
}

