import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:culbhouse/widgets/user_profile_image.dart';
import 'package:culbhouse/widgets/room_user_profile.dart';
import '../data.dart';
class RoomUserProfile extends StatelessWidget {
  final String  imgUrl;
  final String name;
  final double size ;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
     Key ? Key ,
     required this.imgUrl ,
     required this.name,
     this.size =42,
     this.isNew =false,
     this.isMuted=false,
  }) :super(key :Key );

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: UserProfileImage(imageUrl: imgUrl, size: size),
            ),

            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0,2),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Text ('🎉',
                      style:TextStyle(fontSize: 20)),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0,2),
                          blurRadius: 4,
                        ),
                      ]),
                  child:  Icon(CupertinoIcons.mic_slash_fill),
                ),
              ),
          ],
        )
      ],
    );
  }
}
