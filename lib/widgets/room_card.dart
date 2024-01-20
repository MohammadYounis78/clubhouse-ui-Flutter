
import 'package:culbhouse/models/room.dart';
import 'package:culbhouse/secreens/roomScreen.dart';
import 'package:culbhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

 class RoomCard extends StatelessWidget {
   final Room room;

  const RoomCard({
      Key? key, required this.room, }):super(key : key);

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: () => Navigator.of(context).push(
           MaterialPageRoute(
             fullscreenDialog:true,
             builder: (_) =>RoomScreen(room: room) ),),
       child: Padding(
         padding: const EdgeInsets.only(top: 6.0),
         child: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(25),
           ),
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   '${room.club} 🏠'.toUpperCase(),
                   style: Theme.of(context).textTheme.overline!.copyWith(
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                     letterSpacing: 1.0,
                   ),
                 ),
                 Text(
                   room.name ,
                   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                       fontSize: 15,
                       fontWeight: FontWeight.w800
                   ),
                 ),
                 const SizedBox(height: 8.0 ),
                 Row(
       
                   children: [
                     Expanded(
                       child: Container(
                         height: 100,
                         child: Stack(
                           children: [
                             UserProfileImage(imageUrl: room.speakers[1].imageURL, size: 40),
                             Positioned(
                                 left:28,
                                 top: 24,
                                 child: UserProfileImage(imageUrl: room.speakers[0].imageURL,
                                     size: 40)
                             ),
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       flex: 2,
                       child: Container(
                         //color: Colors.green,
       
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             ...room.speakers.map((e) => Text(
                               '${e.firstName} ${e.lastName} 💬'   ,
                               style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w200,
                               ),
       
         )) ,
                             SizedBox(height: 8,),
                             Text.rich(
                               TextSpan(
                                 children: [
                                   TextSpan(
                                       text: ('${room.speakers.length + room.followedBySpeakers.length + room.others.length  } ')
                                   ),
                                 WidgetSpan(child:Icon(
                                   CupertinoIcons.person_2_fill ,
                                   size: 18,
                                   color: Colors.grey,
                                 )),
                                   TextSpan(
                                       text: ('   / ${room.speakers.length    } ')
                                   ),
                                   WidgetSpan(child:Icon(
                                     CupertinoIcons.chat_bubble_fill,
                                     size: 18,
                                     color: Colors.grey,
                                   )),  ]
                               ),
                               style: TextStyle(color: Colors.grey),
                             ),
                           ],
       
                         ),
       
                       ),
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
 