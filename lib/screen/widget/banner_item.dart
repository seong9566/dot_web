import 'package:do_in_web/screen/home/home_view_model.dart';
import 'package:do_in_web/screen/widget/like_and_view_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/color_assets.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  final double bannerWidget = 1240.0;
  final double bannerHeight = 540.0;
  final double buttonWidth = 40.0;
  int currentIndex = 0;
  final HomeViewModel homeVm = HomeViewModel();
  Function()? listener;

  final PageController bannerController = PageController(initialPage: 0);

  @override
  void initState() {
    if (mounted) {
      listener = () {
        setState(() {});
      };
    }
    homeVm.addListener(listener!);
    super.initState();
  }

  @override
  void dispose() {
    homeVm.removeListener(listener!);
    listener = null;
    super.dispose();
  }

  void _scrollNext() {
    if (currentIndex < homeVm.homeBannerList.length - 1) {
      currentIndex = (currentIndex + 1) % homeVm.homeBannerList.length;
      bannerController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      bannerController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollPrevious() {
    if (currentIndex > 0) {
      currentIndex = (currentIndex - 1 + homeVm.homeBannerList.length) %
          homeVm.homeBannerList.length;
      bannerController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      bannerController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bannerWidget + 20 + (buttonWidth * 2),
      child: Column(
        children: [
          Row(
            children: [
              moveButton(isNext: false),
              const SizedBox(width: 10),
              banner(),
              const SizedBox(width: 10),
              moveButton(isNext: true),
            ],
          ),
          const SizedBox(height: 20),
          nameAndContent(),
        ],
      ),
    );
  }

  Widget moveButton({required bool isNext}) {
    VoidCallback onTap;
    Icon icon;

    if (isNext) {
      icon = const Icon(CupertinoIcons.right_chevron);
      onTap = () {
        _scrollNext();
      };
    } else {
      icon = const Icon(CupertinoIcons.left_chevron);
      onTap = () {
        _scrollPrevious();
      };
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ColorAssets.bannerButtonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // 그림자가 아래로 약간 이동하도록 설정
            ),
          ],
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }

  Widget banner() {
    return Container(
      width: bannerWidget,
      height: bannerHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(270),
          bottomRight: Radius.circular(270),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // 그림자의 색상과 불투명도 조절
            spreadRadius: 5, // 그림자의 확산 정도
            blurRadius: 9, // 그림자의 흐림 정도
            offset: const Offset(0, 1), // 그림자의 위치 조정 (x, y)
          ),
        ],
      ),
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: bannerController,
        itemCount: homeVm.homeBannerList.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(child: Text("${homeVm.homeBannerList[index].title}"));
        },
      ),
    );
  }

  Widget nameAndContent() {
    return SizedBox(
      width: bannerWidget,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name
              Text(
                "Behance",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),

              /// Content
              SizedBox(
                width: 924,
                child: Text(
                  "큐레이팅 팀이 매일 약 70~80개 가량의 프로젝트를 선별해서 배지를 달아주는 시스템,",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              LikeAndViewCounter(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 40,
                ),
                counter: "88",
              ),
              SizedBox(width: 12),
              LikeAndViewCounter(
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                counter: "88",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
