import 'package:flutter/material.dart';
import 'package:news_app/functions/theme_provider.dart';
import 'package:news_app/pages/Favourate_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

import '../pages/categry_serch.dart';
import '../pages/second_page.dart';
import '../themes/froster_glass.dart';
import '../utilities/images.dart';

class My_drower extends StatelessWidget {
  const My_drower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: FrostedGlassBox(
            theWidth: 20.0,
            theHeight: 200.0,
            theChild: ListView(
              children: [
                DrawerHeader(child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        // backgroundImage: NetworkImage(user_Image),
                        child: IconButton(onPressed: (){},icon: Icon(Icons.person_outline_rounded,size: 49,),),
                        radius: 35,),
                      SizedBox(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Text("",style: TextStyle(
                            fontSize: 24,

                          ),),
                          Text("")
                        ],
                      ),

                      IconButton(onPressed: (){
                        Provider.of<ThemeProvider>(context,listen: false).toggle_theme();

                      },
                          icon: Provider.of<ThemeProvider>(context).theme_deta==lightTheme?Icon(Icons.light_mode_outlined,size: 34,):Icon(Icons.dark_mode_rounded,size: 34,) )

                    ],
                  ),

                )),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_page() ));
                    // Navigator.
                  },
                  child: ListTile(
                    leading: Icon(Icons.home,size: 32,),
                    title: Text('Home',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite_page("My Favourite") ));
                  },
                  child: ListTile(
                    leading: Icon(Icons.favorite,size: 28,),
                    title: Text('My Favourite',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.explore,size: 28,),
                  title: Text('Explore',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                Expanded(child: Container(
                  padding: EdgeInsets.only(left: 18),
                  child: Column(
                    children: [
                      category(Icons.science,0,context),
                      category(Icons.devices_other,1,context),
                      category(Icons.movie,2,context),
                      category(Icons.business,3,context),
                      category(Icons.sports_cricket_outlined,4,context),
                      category(Icons.local_hospital,5,context),

                    ],
                  ),

                )),





                // Expanded(child: Container(height: 300,),),
                Divider(),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ],
            )
        )


    );
  }

  InkWell category(IconData ic,int ind,context) {
    List<String> categories=["science","technology","entertainment","business","sports","health","general"];
    List<String> heading=["Science","Technology","Entertainment","Business","Sports","Health","General"];
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Categry_serch(categories[ind],heading[ind]) ));
      },
                  child: ListTile(
                    leading: Icon(ic,size: 15,),
                    title: Text(heading[ind],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                );
  }
}
