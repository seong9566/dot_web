import 'package:do_in_web/util/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SwiperCardWidget extends StatefulWidget {
  final dynamic cardItem;
  final bool isButtonVisible;
  const SwiperCardWidget(
      {super.key, this.cardItem, required this.isButtonVisible});

  @override
  State<SwiperCardWidget> createState() => _SwipCardWidgetState();
}

class _SwipCardWidgetState extends State<SwiperCardWidget> {
  /// 이미지 가로크기 + maring값
  final double cardItemWidth = 292.0;
  final double cardItemMargin = 13.0;
  late double totalWidth;

  // 더블탭 클릭 시 스크롤 중복 방지
  bool _isScrolling = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    totalWidth = cardItemWidth + (cardItemMargin * 2);
    super.initState();
  }

  Future<void> _scrollNext(double itemWidth) async {
    if (_scrollController.hasClients && !_isScrolling) {
      setState(() {
        print("버튼 클릭");
        _isScrolling = true;
      });
      await _scrollController.animateTo(
        _scrollController.offset + itemWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _isScrolling = false;
      });
    }
  }

  Future<void> _scrollPrevious(double itemWidth) async {
    if (_scrollController.hasClients && !_isScrolling) {
      setState(() {
        _isScrolling = true;
      });
      await _scrollController.animateTo(
        _scrollController.offset - itemWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _isScrolling = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.isButtonVisible) moveButton(isNext: false),
        const SizedBox(width: 10),
        itemListView(),
        const SizedBox(width: 10),
        if (widget.isButtonVisible) moveButton(isNext: true),
      ],
    );
  }

  Widget plusButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 2),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: ColorAssets.greyColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            "+ 52",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget itemListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        plusButton(() {}),
        const SizedBox(height: 8),
        SizedBox(
          width: totalWidth * 4,
          height: 476,
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.cardItem.length,
            itemBuilder: (BuildContext context, int index) {
              return buildImageCard(index);
            },
          ),
        ),
      ],
    );
  }

  Widget moveButton({required bool isNext}) {
    VoidCallback onTap;
    Icon icon;

    if (isNext) {
      icon = const Icon(CupertinoIcons.right_chevron);
      onTap = () {
        _scrollNext(totalWidth);
      };
    } else {
      icon = const Icon(CupertinoIcons.left_chevron);
      onTap = () {
        _scrollPrevious(totalWidth);
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

  Widget buildImageCard(int index) {
    return Container(
      width: cardItemWidth,
      margin:
          EdgeInsets.symmetric(horizontal: cardItemMargin), // 각 카드 사이의 간격을 줍니다.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.greenAccent,
            width: cardItemWidth,
            height: 420,
            child: Image.asset(widget.cardItem[index].image),
          ),
          const SizedBox(height: 8),
          Text(
            widget.cardItem[index].title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
