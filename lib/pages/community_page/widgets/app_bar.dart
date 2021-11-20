import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:git_mentalhealth/common/style/text.dart';
import 'package:git_mentalhealth/common/widgets/spaces.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class CommunityAppBar extends StatefulWidget {
  const CommunityAppBar({Key? key}) : super(key: key);

  @override
  _CommunityAppBarState createState() => _CommunityAppBarState();
}

class _CommunityAppBarState extends State<CommunityAppBar> {
  bool _isFolded = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      expandedHeight: 50,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.secondary,
      floating: true,
      elevation: 80.0,
      actions: [
        Padding(
          padding: _isFolded
              ? const EdgeInsets.symmetric(horizontal: 16.0)
              : const EdgeInsets.all(0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 55,
                  width: _isFolded ? Get.width - 56 - 16 - 16 : 0,
                  child: _isFolded
                      ? Text("Your Chats",
                          maxLines: 1,
                          style: appTextStyle(
                            weight: FONTWEIGHT.bold,
                            type: "h3",
                            color: Colors.white,
                          ))
                      : Container()),
              // AnimatedContainer(
              //   duration: const Duration(milliseconds: 400),
              //   height: 55,
              //   width: _isFolded ? 55 : 0,
              //   child: _isFolded
              //       ? Container(
              //           decoration: BoxDecoration(
              //               color: Theme.of(context).colorScheme.primary,
              //               shape: BoxShape.circle),
              //           child: IconButton(
              //             icon: const Icon(Icons.add),
              //             color: Colors.white,
              //             iconSize: 40,
              //             onPressed: () {},
              //           ))
              //       : Container(),
              // ),
              // if (_isFolded) kHorizontalSpace(width: 8.0),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: _isFolded ? 56 : Get.width,
                height: _isFolded ? 50 : 55,
                decoration: BoxDecoration(
                  boxShadow: _isFolded ? null : kElevationToShadow[6],
                  color: _isFolded
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                  borderRadius: _isFolded
                      ? const BorderRadius.all(Radius.circular(50.0))
                      : BorderRadius.circular(0.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, bottom: 5),
                        child: _isFolded
                            ? null
                            : TextField(
                                cursorColor: Colors.white,
                                style: appTextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        'Search for people and communities...',
                                    hintStyle: appTextStyle(
                                        color: Colors.white,
                                        type: "B1",
                                        weight: FONTWEIGHT.medium)),
                              ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      child: IconButton(
                        icon: Icon(_isFolded ? Icons.search : Icons.close),
                        color: _isFolded
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            _isFolded = !_isFolded;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
