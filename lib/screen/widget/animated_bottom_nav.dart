import 'package:do_in_web/model/chat_model.dart';
import 'package:do_in_web/util/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AnimatedBottomNavBar extends StatefulWidget {
  @override
  _AnimatedBottomNavBarState createState() => _AnimatedBottomNavBarState();
}

class _AnimatedBottomNavBarState extends State<AnimatedBottomNavBar> {
  double _height = 80.0; // 초기 높이
  double _width = 656;
  // double _height = 526.0;
  // double _width = 924.0;
  bool onHover = false;

  double _bottomPadding = 6.0;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      // margin: EdgeInsets.only(bottom: 20, left: _width, right: _width),
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) => setState(() {
          _height = 526.0;
          _width = 924.0;
          onHover = true;
        }), // 마우스를 올렸을 때 높이 변경
        onExit: (PointerExitEvent event) => setState(() {
          _height = 80.0;
          _width = 656.0;
          onHover = false;
        }), // 마우스를 내렸을 때 높이 변경
        child: AnimatedContainer(
          margin: const EdgeInsets.only(bottom: 20),
          height: _height,
          width: _width,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: ColorAssets.bottomNavColor.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                top: 6,
                left: 6,
                duration: const Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  width: onHover ? 908 : 0,
                  height: onHover ? 422 : 0,
                  // width: 908,
                  // height: 422,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      tabButtons(),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      body(),
                    ],
                  ),
                ),
              ),
              communityButton(),
              bottomNavItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: cardItem(index),
          );
        },
      ),
    );
  }

  Widget cardItem(int index) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: const AssetImage("assets/avator.jpg"),
      ),
      title: Text(chatList[index].name),
      subtitle: Text(chatList[index].lastMessage),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(chatList[index].time),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                chatList[index].unReadCount,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItems() {
    return Positioned(
      bottom: _bottomPadding,
      right: 8,
      child: Row(
        children: [
          ...bottomNavDot(),
          bottomNavItem(
            const Icon(
              CupertinoIcons.bell,
              size: 40,
            ),
            () {},
          ),
          ...bottomNavDot(),
          bottomNavItem(
            const Icon(
              CupertinoIcons.mail,
              size: 40,
            ),
            () {},
          ),
          ...bottomNavDot(),
          bottomNavItem(
            const Icon(
              CupertinoIcons.bookmark,
              size: 40,
            ),
            () {},
          ),
          ...bottomNavDot(),
          bottomNavItem(
            const Icon(
              CupertinoIcons.person_alt_circle,
              size: 40,
            ),
            () {
              context.goNamed('profile');
            },
          )
        ],
      ),
    );
  }

  List<Widget> bottomNavDot() {
    return [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 4,
        height: 4,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 4,
        height: 4,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    ];
  }

  // 하단 네비게이션 아이템
  Widget bottomNavItem(Icon icon, VoidCallback call) {
    return GestureDetector(
      onTap: call,
      child: Container(
        width: 68,
        height: 68,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }

  Widget communityButton() {
    return Positioned(
      bottom: _bottomPadding,
      left: 8,
      child: GestureDetector(
        onTap: () {
          print("communityButton Clicked");
        },
        child: Container(
          width: 288,
          height: 68,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Center(
            child: Text(
              "Community",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: ColorAssets.bottomNavEditBtnColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /**
   * Bottom Nav 내부 탭 버튼 요소들
   */
  Widget tabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        tabButton(() {
          print("ALL 클릭");
        }, "ALL"),
        tabButton(() {}, "SMS"),
        tabButton(() {}, "ACTIVITY"),
        tabButton(() {}, "SYSTEM"),
      ],
    );
  }

  Widget tabButton(VoidCallback call, String text) {
    TextStyle btnStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorAssets.bottomNavEditBtnColor,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border(
        right: BorderSide(
          color: ColorAssets.bottomNavEditBtnColor,
          width: 2,
        ),
      )),
      child: TextButton(
        onPressed: call,
        child: Text(
          text,
          style: btnStyle,
        ),
      ),
    );
  }
}
