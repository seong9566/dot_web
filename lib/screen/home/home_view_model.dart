import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel._();
  static final HomeViewModel _instance = HomeViewModel._();
  factory HomeViewModel() => _instance;

  final List<HomeBannerModel> homeBannerList = [
    HomeBannerModel("banner1", Colors.red),
    HomeBannerModel("banner2", Colors.blue),
    HomeBannerModel("banner3", Colors.green),
    HomeBannerModel("banner4", Colors.yellow),
  ];
}

class HomeBannerModel {
  final String title;
  final Color bannerColor;

  HomeBannerModel(this.title, this.bannerColor);
}
