import 'package:flutter/material.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class JumpingDots extends StatefulWidget {
  final int noOfDots;
  const JumpingDots({Key? key, this.noOfDots = 3}) : super(key: key);

  @override
  _JumpingDotsState createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots>
    with TickerProviderStateMixin {
  List<AnimationController>? _animationControllers;
  List<Animation<double>> _animations = [];
  static List<Color> colors = [kGrey20, kGrey40, kGrey80];

  int animationDuration = 200;
  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    ///initialization of _animationCOntrollers
    ///each )animationCOntroller will have same animation duration
    _animationControllers = List.generate(
        widget.noOfDots,
        (index) => AnimationController(
            vsync: this, duration: Duration(milliseconds: animationDuration)));

    ///initialization of _animations
    ///here end value is -5
    ///end value is amount of jump
    ///and we want our dop to jump in upward direction
    for (int i = 0; i < widget.noOfDots; i++) {
      _animations.add(
          Tween<double>(begin: 0, end: -5).animate(_animationControllers![i]));
    }

    for (int i = 0; i < widget.noOfDots; i++) {
      _animationControllers![i].addStatusListener((status) {
        //On Complete
        if (status == AnimationStatus.completed) {
          //return to original position
          _animationControllers![i].reverse();

          //if it is not last dot then start the animation of next dot
          if (i != widget.noOfDots - 1) {
            _animationControllers![i + 1].forward();
          }

          //if last dot is back to its original position then start animation of first dot
          //now this animation will be repeated infinitely
          if (i == widget.noOfDots - 1 && status == AnimationStatus.completed) {
            Future.delayed(const Duration(milliseconds: 500),
                () => _animationControllers![0].forward());
          }
        }
      });
    }

    //trigger animation of first dot to start the whole animation
    _animationControllers?.first.forward();
  }

  @override
  void dispose() {
    if (_animationControllers != null) {
      for (var controller in _animationControllers!) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
          widget.noOfDots,
          (index) => //animated builder widget will rebuild itself when
              //animationController[index] value changes
              AnimatedBuilder(
                  animation: _animationControllers![index],
                  builder: (context, child) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      //Transform widget's traslate ontructor will help to move the dot in upward by changing the offset of dot
                      //X axis position of dot will not change
                      //only Y axis position will change
                      child: Transform.translate(
                        offset: Offset(0, _animations[index].value),
                        child: DotWidget(),
                      ),
                    );
                  })),
    );
  }
}

class DotWidget extends StatelessWidget {
  final Color dotColor;

  const DotWidget({Key? key, this.dotColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
      height: 3,
      width: 3,
    );
  }
}
