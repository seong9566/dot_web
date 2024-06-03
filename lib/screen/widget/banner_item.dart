import 'package:do_in_web/screen/widget/like_and_view_counter.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  final double bannerWidget = 1240.0;
  final double bannerHeight = 540.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bannerWidget,
      child: Column(
        children: [
          Container(
            width: bannerWidget,
            height: bannerHeight,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
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
          ),
          const SizedBox(height: 20),
          nameAndContent(),
        ],
      ),
    );
  }

  Widget nameAndContent() {
    return const Row(
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
    );
  }
}
