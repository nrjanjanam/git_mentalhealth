import 'package:flutter/material.dart';
import 'package:git_mentalhealth/common/style/text.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'YOUGRAM',
                    style: appTextStyle(
                        type: "D1",
                        weight: FONTWEIGHT.light,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              "INCLUSIVITY | SELF REFLECTION | COMMUNITY".toUpperCase(),
              style: appTextStyle(
                weight: FONTWEIGHT.light,
                type: "B1",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
