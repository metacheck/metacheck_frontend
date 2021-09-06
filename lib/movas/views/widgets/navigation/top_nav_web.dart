import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopNavBarWeb extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBarWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/MetaCheck-logo.svg",
            height: 22,
            width: 160,
          ),
          Spacer(),
          Text("niggsa")
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1200, 100);
}
