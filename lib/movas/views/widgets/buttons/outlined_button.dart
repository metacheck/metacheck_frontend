import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';

class MetacheckOutlinedButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  MetacheckOutlinedButton(this.text, {required this.onTap});

  @override
  State<MetacheckOutlinedButton> createState() =>
      _MetacheckOutlinedButtonState();
}

class _MetacheckOutlinedButtonState extends State<MetacheckOutlinedButton>
    with SingleTickerProviderStateMixin {
  bool hovering = false;

  DecorationTween get decorationTween {
    return DecorationTween(
      begin: BoxDecoration(
          border:
              Border.all(width: 2, color: OATheme.of(context).primaryColor)),
      end: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
    );
  }

  late final AnimationController _controller;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final textstyle = OATheme.of(context).baseTextStyle;
    return InkWell(
      onTap: widget.onTap,
      onHover: (hover) {
        setState(() {
          hovering = hover;
        });
        if (hovering) {
          _controller.animateTo(1,
              duration: Duration(milliseconds: 600), curve: Curves.ease);
        } else {
          _controller.animateTo(0,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }
      },
      child: DecoratedBoxTransition(
        position: DecorationPosition.background,
        decoration: decorationTween.animate(_controller),
        child: Container(
          height: 44,
          decoration: BoxDecoration(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                  child: Text(
                widget.text,
                style: textstyle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ((decorationTween.lerp(_controller.value)
                                as BoxDecoration)
                            .border as Border)
                        .bottom
                        .color),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
