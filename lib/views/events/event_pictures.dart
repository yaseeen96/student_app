import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

import 'package:student_app/utils/configurations.dart';

class EventPictures extends StatelessWidget {
  EventPictures({super.key});

  @override
  Widget build(BuildContext context) {
    // defining event images list
    final List<Widget> eventImages = [
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
      ),
      EventImageView(
        image:
            'https://img.freepik.com/free-photo/beautiful-wide-shot-eiffel-tower-paris-surrounded-by-water-with-ships-colorful-sky_181624-5118.jpg?w=2000',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.pop(context, true),
          ),
          backgroundColor: Theme.of(context).highlightColor,
          title: Text(
            "Event Pictures",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        children: eventImages,
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}

class EventImageView extends StatelessWidget {
  const EventImageView({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      backgroundColor: Theme.of(context).highlightColor,
      child: Center(
        child: Container(
          width: getDeviceWidth(context),
          height: getDeviceHeight(context) * 0.5,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
