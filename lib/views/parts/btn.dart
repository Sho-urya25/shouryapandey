import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shouryapandey/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NeomorphicButton extends StatelessWidget {
  final String? text;
  final String? svgPath;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final String? url;
  final Color? hoverColor;
  final double iconSize;
  final double fontSize;
  final EdgeInsets padding;
  final bool isOutlined;
  final bool isCircular;

  NeomorphicButton({
    Key? key,
    this.text,
    this.svgPath,
    this.height,
    this.width,
    this.onTap,
    this.url,
    this.hoverColor = Colors.deepOrange,
    this.iconSize = 24.0,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.isOutlined = false,
    this.isCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool isHovering = false.obs;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: GestureDetector(
        onTap: () {
          if (url != null) {
            launchUrl(Uri.parse(url!));
          } else if (onTap != null) {
            onTap!();
          }
        },
        child: Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: neumorphicColor,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircular ? null : BorderRadius.circular(12),
            border: isOutlined 
                ? Border.all(
                    color: isHovering.value ? hoverColor! : Colors.grey[500]!,
                    width: 2.0,
                  ) 
                : null,
            boxShadow: isHovering.value?neumorphicBoxShadowHover : neumorphicBoxShadow,
          ),
          child: Center(
            child: svgPath != null 
              ? SvgPicture.asset(
                  svgPath!,
                  height: iconSize,
                  width: iconSize,
                  colorFilter: isHovering.value
                    ? ColorFilter.mode(hoverColor!, BlendMode.srcIn)
                    : null,
                )
              : Text(
                  text ?? "Button",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: isHovering.value ? hoverColor : Colors.grey[800],
                  ),
                ),
          ),
        )),
      ),
    );
  }
}