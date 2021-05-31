import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/widgets.dart';
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
  TrackingScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    _trackingScrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _MobileHomeScreen(scrollController : _trackingScrollController),
          desktop: _DesktopHomeScreen(scrollController : _trackingScrollController),
        ),

      ),
    );
  }
}
class _MobileHomeScreen extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _MobileHomeScreen({Key key, @required this.scrollController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Facebook',
            style: const TextStyle(
              color : Palette.facebookBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              iconSize: 30,
              onPressed: ()=>{print('search')},
              icon: Icons.search,),
            CircleButton(
              iconSize: 30,
              onPressed: ()=>{print('Messenger')},
              icon: MdiIcons.facebookMessenger,
            ),

          ],
        ),
        SliverToBoxAdapter(
          child:CreatePostContainer(
              currentUser: currentUser
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser : currentUser,stories: stories),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index){
          final Post post = posts[index];
          return PostContainer(post: post);

        },
        ),
        ),
      ],
    );

  }
}

class _DesktopHomeScreen extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _DesktopHomeScreen({Key key, @required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child:Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: MoreOptionsList(currentUser: currentUser),
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600,
         child: Container(
           child: CustomScrollView(
             controller: scrollController,
             slivers: [
               SliverPadding(
                 padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                 sliver: SliverToBoxAdapter(
                   child: Stories(currentUser : currentUser,stories: stories),
                 ),
               ),

               SliverToBoxAdapter(
                 child:CreatePostContainer(
                     currentUser: currentUser
                 ),
               ),
               SliverPadding(
                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                 sliver: SliverToBoxAdapter(
                   child: Rooms(onlineUsers: onlineUsers),
                 ),
               ),
               SliverList(delegate: SliverChildBuilderDelegate((context, index){
                 final Post post = posts[index];
                 return PostContainer(post: post);

               },
               ),
               ),
             ],
           ),
         ),

        ),
        const Spacer(),

        Flexible(
          flex: 2,
          child:Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ContactsList(users: onlineUsers),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
