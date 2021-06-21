import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class LandingUtils with ChangeNotifier {
  final picker = ImagePicker();
  late File userAvatar;
  File get getUserAvatar => userAvatar;
  late String userAvatarUrl;
  String get getUserAvatarUrl => userAvatarUrl;

  Future pickUserAvatar(BuildContext context, ImageSource source) async {
    final pickedUserAvatar = await picker.getImage(source: source);
    pickedUserAvatar == null
        ? print('select image')
        : userAvatar = File(pickedUserAvatar.path);
    print(userAvatar.path);
    // userAvatar != null ? ;
  }
}
