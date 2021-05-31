import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'widgets.dart';
class CreatePostContainer extends StatelessWidget {
 final User currentUser;

 const CreatePostContainer({
    Key key,
    this.currentUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop? 5: 0),
      elevation: isDesktop? 1: 0,
      shape: isDesktop? RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10))
           : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
               ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind'),
                  ),
                ),
              ],
            ),
            const Divider(height: 10,thickness: 0.5,),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(onPressed: ()=> print("Live"), icon: Icon(
                      Icons.videocam,
                  color: Colors.red,
                  ),
                      label: Text("Live")
                  ),
                  FlatButton.icon(onPressed: ()=> print("Photo"), icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                      label: Text("Photo")
                  ),
                  FlatButton.icon(onPressed: ()=> print("Room"), icon: Icon(
                    Icons.video_call,
                    color: Colors.red,
                  ),
                      label: Text("Room")
                  ),

                  const VerticalDivider(width: 8.0,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
