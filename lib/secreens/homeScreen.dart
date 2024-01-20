

import 'dart:typed_data';
import 'package:culbhouse/data.dart';
import 'package:culbhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/room_card.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, size: 29,),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.envelope_open, size: 28,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.calendar, size: 29,),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell, size: 29,),
            onPressed: () {},
          ),
    GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: UserProfileImage(size: 35.0,imageUrl: currentUser.imageURL,),
      ),
    ),

        ],
      ),
      body:Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
            children: [
                 ...roomList.map((e) => RoomCard(room : e)),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,

            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                ),
              ),
            ),
          ),
          Positioned(

            bottom: 50,
            child: ElevatedButton.icon(
                onPressed:(){},
              icon: const Icon(CupertinoIcons.add,
              size: 21,
              color: Colors.white,
               ),
              label: const Text('Start a room',
              style: TextStyle(
              color: Colors.white,
              fontSize: 20,
                fontWeight: FontWeight.w200
              ),

            ),

            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(12),
              primary: Theme.of(context).canvasColor,
              shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20) ),
              ),
            ),
            ),
          )

        ],
      )
    );


  }
}


