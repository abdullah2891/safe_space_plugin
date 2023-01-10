import 'package:flutter/cupertino.dart';
import 'package:safe_space_plugin_example/constants/constant.dart';

class AppFooterWidget extends StatelessWidget {
  const AppFooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      Constants.versionNumber,
      style: TextStyle(
          color: Constants.whiteColor,
          fontFamily: Constants.fontFamily,
          fontSize: 12),
    );
  }
}
