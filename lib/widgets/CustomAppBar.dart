import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/CircleButton.dart';
import 'package:flutter_facebook_responsive_ui/widgets/CustomTabBar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class CustomAppBar extends StatelessWidget {
final User currentUser;
final List<IconData> icons;
final int selectedIndex;
final Function(int) onTap;

  const CustomAppBar({Key key, this.currentUser, this.icons, this.selectedIndex, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const[
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Facebook',
              style: const TextStyle(
                color : Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            height:double.infinity,
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap ,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCard(user: currentUser),
                  const SizedBox(width: 12),
                  CircleButton(
                      icon: Icons.search,
                      iconSize: 32,
                      onPressed: ()=>{print('search')}
                      ),
                  CircleButton(
                      icon: MdiIcons.facebookMessenger,
                      iconSize: 32,
                      onPressed: ()=>{print('message')}
                  ),

                ],
              ),
          )
        ],
      ),
    );
  }
}
