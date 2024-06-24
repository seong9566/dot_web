import 'package:flutter/material.dart';

class ProfileEditViewModel extends ChangeNotifier {
  ProfileEditViewModel._();

  static final ProfileEditViewModel _instance = ProfileEditViewModel._();

  factory ProfileEditViewModel() => _instance;
}
