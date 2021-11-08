import 'package:flutter/material.dart';
import 'package:git_mentalhealth/style/text.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Center(
        // child: SvgPicture.asset("assets/icons/peoplefirst_splash.svg"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'RIL',
                    style: appTextStyle(
                        type: "D1",
                        weight: FONTWEIGHT.light,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: 'HR',
                    style: appTextStyle(
                      type: "D1",
                      color: Colors.white,
                      weight: FONTWEIGHT.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "PERFORMANCE | AGILITY | ENGAGEMENT".toUpperCase(),
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
