import 'package:flutter/cupertino.dart';

import '../../model/profile_image_card.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel._();
  static final ProfileViewModel _instance = ProfileViewModel._();
  factory ProfileViewModel() => _instance;

  final List<ProfileImageCard> profileImageCardList = [
    ProfileImageCard('assets/testImage1.png', '이미지 제목1'),
    ProfileImageCard('assets/testImage2.png', '이미지 제목2'),
    ProfileImageCard('assets/testImage3.png', '이미지 제목3'),
    ProfileImageCard('assets/testImage4.png', '이미지 제목4'),
    ProfileImageCard('assets/testImage1.png', '이미지 제목5'),
    ProfileImageCard('assets/testImage2.png', '이미지 제목6'),
    ProfileImageCard('assets/testImage3.png', '이미지 제목7'),
    ProfileImageCard('assets/testImage3.png', '이미지 제목8'),
  ];
}
