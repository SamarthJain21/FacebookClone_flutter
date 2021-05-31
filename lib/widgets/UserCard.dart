import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/ProfileAvatar.dart';
class UserCard extends StatelessWidget {
final User user;

  const UserCard({Key key,
    @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6),
          Flexible(
              child: Text(
                user.name ,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
          ),
        ],
      ),
    );
  }
}
