import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class list_view_loader_skeleton extends StatelessWidget {
  const list_view_loader_skeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),
        lloading_list_tile(),


      ],

    );
  }
}

class lloading_list_tile extends StatelessWidget {
  const lloading_list_tile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[800], // Darker background color
      ),
      title: Container(
        height: 16,
        width: 120,
        color: Colors.grey[800], // Darker background color
      ),
      subtitle: Column(
        children: [
          Container(
            height: 12,
            width: 80,
            color: Colors.grey[800], // Darker background color
          ),
          Container(
            height: 12,
            width: 60,
            color: Colors.grey[800], // Darker background color
          ),
        ],
      ),
    );
  }
}



