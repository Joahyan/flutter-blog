import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/config/theme.dart';

class CommonButton extends StatelessWidget {
  final double? width;
  final double height;
  final List<BoxShadow>? boxShadow;
  final double radius;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? style;
  final Color? color;
  final bool isBorder;
  final Color borderColor;
  final Gradient gradient;
  final bool enable;

  CommonButton({this.width,
    this.height = 44.0,
    this.boxShadow,
    this.radius = 5.0,
    this.text = 'button',
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
    this.margin,
    this.style,
    this.color,
    this.isBorder = false,
    this.borderColor = primaryColor,
    this.gradient = const LinearGradient(
  // linear-gradient(270deg, #FF9022 0%, #FF5F6B 100%);
      colors: [
        Color.fromRGBO(8, 191, 98, 1.0),
        // Color(0xffff9022),
        // Color(0xffff5f6b)
        Color.fromRGBO(8, 191, 98, 1.0),
      ],
    ),
    this.enable = true});

  @override
  Widget build(BuildContext context) {
    Color _color = Color.fromRGBO(225, 225, 225, enable ? 1 : 0.3);

    return new Container(
        margin: margin,
        child: new InkWell(
            child: new Container(
                alignment: Alignment.center,
                padding: padding,
                width: width,
                height: height,
                decoration: BoxDecoration(
                    gradient: gradient,
                    color: color,
                    boxShadow: boxShadow,
                    border: isBorder
                        ? Border.all(width: 0.5, color: borderColor)
                        : null,
                    borderRadius: BorderRadius.all(Radius.circular(radius))),
                child: new Text(
                  '$text',
                  style: style ?? TextStyle(fontSize: 15.0,color: _color),
                ),
            ),
            onTap: enable? onTap: () {},
          // color == null
          //     ? BoxDecoration(
          //         gradient: gradient,
          //         boxShadow: boxShadow,
          //         border: isBorder
          //             ? Border.all(width: 0.5, color: borderColor)
          //             : null,
          //         borderRadius: BorderRadius.all(Radius.circular(radius)))
          //     : BoxDecoration(
          //         color: color,
          //         boxShadow: boxShadow,
          //         border: isBorder
          //             ? Border.all(width: 0.5, color: borderColor)
          //             : null,
          //         borderRadius:
          //             BorderRadius.all(Radius.circular(radius)))
        ));
  }
}
