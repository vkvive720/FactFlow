import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../themes/Glass_container.dart';

class MyDarkLoadingSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c1=Colors.grey[900];
    final c2=Colors.grey[600];
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 12, // Number of skeleton items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade800, // Darker base color
          highlightColor: Colors.grey.shade600, // Slightly lighter highlight color
          child: Card(color: Color(0x00ffffff),
            child: Glass_container(theHeight: 115.0,theWidth: double.infinity,
              theChild: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 90,width: 90,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: c1,),

                    )
                    // ,SizedBox(width: 8,)
                    ,Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Container(width: 200,height: 16,color: c1,),
                       SizedBox(height: 8,),
                       Container(width: 150,height: 16,color: c1,),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10,),
                            Container(width: 60,height: 16,color: c1,),
                            Row(
                              children: [
                                // IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,size: 18,),),
                                // IconButton(onPressed: (){Share.share(snapshot.data![index]['urlToImage']);}, icon:Icon(Icons.share,size: 18,))
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
          )
          ,
        );
      },
    );
  }
}

class ImageLoadingSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800, // Darker base color
      highlightColor: Colors.grey.shade600, // Slightly lighter highlight color
      child: Container(
        width: 100, // Set the desired width
        height: 100, // Set the desired height
        decoration: BoxDecoration(
          color: Colors.grey[900], // Dark background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
    );
  }
}

class Card_looding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800, // Darker base color
      highlightColor: Colors.grey.shade600, // Slightly lighter highlight color
      child: Container(height: 300,width: 340,
        child: Glass_container(theWidth: 300,theHeight: 200,
          theChild: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
              // Set the desired height
                decoration: BoxDecoration(
                  color: Colors.grey[900], // Dark background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



