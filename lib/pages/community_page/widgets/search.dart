import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:git_mentalhealth/common/style/text.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool _isFolded = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: _isFolded ? 56 : Get.width - 32,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[6],
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
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
                              hintText: 'Search',
                              hintStyle: appTextStyle(
                                  color: Colors.white,
                                  type: "B1",
                                  weight: FONTWEIGHT.medium)),
                        ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isFolded = !_isFolded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Icon(
                      _isFolded ? Icons.search : Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
