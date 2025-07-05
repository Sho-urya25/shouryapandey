 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Widget hoverableLogoContainer({
    required String logo,
    double? height,
    double? width,
    required RxBool hoverState,
    String? url,
  }) {
    return MouseRegion(
      onEnter: (_) => hoverState.value = true,
      onExit: (_) => hoverState.value = false,
      child: GestureDetector(
        onTap: () {
          if (url != null) {
            launchUrl(Uri.parse(url));
          }
        },
        child: Obx(
          () => GestureDetector(onTap: () {
            if (url != null) {
              launchUrl(Uri.parse(url));
            }
          },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: hoverState.value
                        ? Offset(2.0, 2.0)
                        : Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: hoverState.value
                        ? Offset(-2.0, -2.0)
                        : Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedSwitcher(
                  duration: Duration(
                    milliseconds: 400,
                  ), // Smooth color transition
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: SvgPicture.asset(
                    logo,
                    key: ValueKey<bool>(
                      hoverState.value,
                    ), // Key needed for AnimatedSwitcher
                    height: height,
                    width: width,
                    colorFilter: hoverState.value
                        ? ColorFilter.mode(Colors.deepOrange, BlendMode.srcIn)
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
