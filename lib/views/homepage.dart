import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:shouryapandey/animationctrls.dart';
import 'package:shouryapandey/views/parts/btn.dart';
import 'package:shouryapandey/views/parts/neumorphicontainer.dart';
import 'package:url_launcher/url_launcher.dart';

Column homePage(
  BoxConstraints constraints,
  double avatarwidth,
  double maxWidth,
  Animationctrls animationController,
) {
  return Column(
    key:animationController.homeKey,
    children: [
      SizedBox(height: Get.height * 0.1),
      SizedBox(
        width: constraints.maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 1.0,
            bottom: 8.0,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            // alignment:constraints.maxWidth<700 ? WrapAlignment.center : WrapAlignment.start,
            direction: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseRegion(
                    onEnter: (event) {
                      animationController.idHoveringonCenterLogo.value = true;
                    },
                    onExit: (event) {
                      animationController.idHoveringonCenterLogo.value = false;
                    },
                    child: Obx(() {
                      return neomorphiContainer(
                        animationController.idHoveringonCenterLogo.value
                            ? avatarwidth + 30
                            : avatarwidth,
                        animationController.idHoveringonCenterLogo.value
                            ? avatarwidth + 30
                            : avatarwidth,
                        SvgPicture.asset("assets/thinker.svg"),
                      );
                    }),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: animationController.opacity.value,
                      duration: Duration(seconds: 1),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(
                          begin: -100.0,
                          end: animationController.offset.value,
                        ),
                        duration: Duration(seconds: 1),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0.0, value),
                            child: child,
                          );
                        },
                        child: SizedBox(
                          width: maxWidth,
                          child: Column(
                            children: [
                              SizedBox(height: constraints.maxHeight * 0.05),
                              // Text("Heya! I'm Shourya Pandey,"),
                              RichText(
                                text: TextSpan(
                                  text: "Heya! I'm ",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      59,
                                      59,
                                      59,
                                    ),
                                    fontSize: 34,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Shourya Pandey",
                                      style: TextStyle(
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 50,
                                  right: 50,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:
                                        " A passionate and performance-driven Flutter developer with a deep love for clean architecture, beautiful UI, and scalable cross-platform apps.",
                                    children: [
                                      TextSpan(
                                        text:
                                            " My focus is on delivering elegant, responsive, and real-world-ready applications using Flutter, Firebase, and GetX.",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text:
                                            " With a solid understanding of both frontend finesse and backend integration, I specialize in building seamless mobile and web experiences that just work.",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text:
                                            " From building real-time IoT dashboards for hotel kitchens that integrate with sensors and Bluetooth, to launching live video chat applications with Firebase and VideoSDK, I thrive on solving meaningful problems through code.",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    spacing: 30,
                    children: [
                      NeomorphicButton(
                        text: "Download CV",
                        onTap: () async {
                          if (await canLaunchUrl(
                            Uri.parse(
                              "https://docs.google.com/document/d/1NA7V6XrfYL96ilLtJragblQvx7Tv-rBqRHVYHu6cwqs/edit?usp=drive_link",
                            ),
                          )) {
                            await launchUrl(
                              Uri.parse(
                                "https://docs.google.com/document/d/1NA7V6XrfYL96ilLtJragblQvx7Tv-rBqRHVYHu6cwqs/edit?usp=drive_link",
                              ),
                            );
                          } else {
                            Get.snackbar(
                              "Error",
                              "Could not launch the URL.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        hoverColor: Colors.deepOrange,
                      ),
                      NeomorphicButton(
                        text: "Contact Me",
                        onTap: () {
                          final context = animationController.contactKey.currentContext;
                          if (context != null) {
                            Scrollable.ensureVisible(
                              context,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        hoverColor: Colors.deepOrange,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox.fromSize(
                size: Size(constraints.minWidth, constraints.maxHeight * 0.1),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
