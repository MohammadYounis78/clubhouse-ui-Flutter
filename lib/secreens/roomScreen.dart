import 'dart:math';
import 'dart:typed_data';
import 'package:culbhouse/data.dart';
import 'package:culbhouse/widgets/room_user_profile.dart';
import 'package:culbhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/room.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text('Hallowy'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.doc,
              size: 29,
            ),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: UserProfileImage(
                size: 35.0,
                imageUrl: currentUser.imageURL,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                          '${room.club}🏠'.toUpperCase(), // Assuming room.name is a non-constant value
                      style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0
                      ),
                      ),
                      const Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    room.name, // Assuming room.name is a non-constant value
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0
                    ),
                  ),
                ],
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver:
                  SliverGrid.count(crossAxisCount: 3,
                                mainAxisSpacing: 15,
                  children:  room.speakers.map((e) => RoomUserProfile(
                      imgUrl: e.imageURL,
                      name: e.firstName,
                    size: 66,
                    isNew: Random().nextBool(),
                    isMuted: Random().nextBool(),
                  )).toList()
                  ),

            ),

            SliverToBoxAdapter(
              child: Text(
                'Folwed By Speaker',  // Assuming room.name is a non-constant value
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                   fontSize: 14.0,
                   color: Colors.grey[500],
                   fontWeight: FontWeight.bold,

               ),
                    ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver:
              SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 15,
                   children:  room.followedBySpeakers.map((e) => RoomUserProfile(
                    imgUrl: e.imageURL,
                    name: e.firstName,
                    size: 66,
                    isNew: Random().nextBool(),
                   // isMuted: Random().nextBool(),
                  )).toList()
              ),

            ),   // Add more Sliver widgets as needed


            SliverToBoxAdapter(
              child: Text(
                'Folwed By Others',  // Assuming room.name is a non-constant value
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14.0,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver:
              SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 15,
                  children:  room.others.map((e) => RoomUserProfile(
                    imgUrl: e.imageURL,
                    name: e.firstName,
                    size: 66,
                    isNew: Random().nextBool(),
                    // isMuted: Random().nextBool(),
                  )).toList()
              ),
               ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 50)),
          ],
        ),
      ),

      bottomSheet:  Container(
       padding: EdgeInsets.symmetric(horizontal:20 ,vertical:12 ) ,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
                child: Text(
                  '✌️ Leave quietly',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(12),
              backgroundColor: Colors.grey[300],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
            ),
            ),

            Row(
             children: [
               GestureDetector(
                 onTap: () {},
                 child: Container(
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.grey[300],
                   ),
                   padding: const EdgeInsets.all(6),
                   child: const Icon(
                     CupertinoIcons.add,
                     size:30 ,
                   ),
                    ),
               ),
const SizedBox(width: 12, ),
               GestureDetector(
                 onTap: () {},
                 child: Container(
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.grey[300],
                   ),
                   padding: const EdgeInsets.all(6),
                   child: const Icon(
                     CupertinoIcons.hand_raised,
                     size:30 ,
                   ),
                 ),
               ),
             ],

            )
          ],
        ),

      ),

    );
  }
}
