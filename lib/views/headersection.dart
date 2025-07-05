import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shouryapandey/animationctrls.dart';

Row headerSection(BoxConstraints constraints, BuildContext context, RxDouble widt) {
  final _animationController = Get.find<Animationctrls>();
  // Define a breakpoint where you want to switch to hamburger menu
  bool isSmallScreen = constraints.maxWidth < 800;
  
  return Row(
    children: [
      // Show hamburger menu only on small screens
      if (isSmallScreen)
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Open the drawer
            Scaffold.of(context).openDrawer();
          },
          tooltip: 'Menu',
        ),
        
      // Always show logo/avatar
      CircleAvatar(
        radius: constraints.maxWidth < 500
            ? Get.width * 0.02
            : constraints.maxWidth < 700
            ? Get.width * 0.04
            : constraints.maxWidth < 1000
            ? Get.width * 0.035
            : Get.width * 0.02,
        backgroundColor: const Color(0xFFFF6E40),
        child: Text("SP"),
      ),
      SizedBox(width: 10.0),
      
      // Text animation - hide or make smaller on very small screens
      if (constraints.maxWidth > 400)
        SizedBox(
          width: constraints.maxWidth < 600 ? 150.0 : 250.0,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: constraints.maxWidth < 600 ? 16.0 : 20.0, 
              fontFamily: 'Agne'
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 200),
                  'Code. Design. Repeat.',
                ),
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 200),
                  'Less Talk, More Code',
                ),
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 200),
                  'Pixel-Perfect Every Time',
                ),
                TypewriterAnimatedText(
                  speed: Duration(milliseconds: 200),
                  'Fluttering Through Ideas',
                ),
              ],
            ),
          ),
        ),

      // // Always fill remaining space
      Spacer(flex: 5,),
      
      // // Show debugging width indicator (you can remove this in production)
      // if (constraints.maxWidth > 800)
      //   Obx(() => menuBarItems(title: "${widt.value}", isHovering: false)),
      
      // Only show navigation items on larger screens
      if (!isSmallScreen) ...[
        Spacer(),
        hoverableMenuItem(
          title: "Home",
          hoverState: _animationController.idHoveringonhome,
          onTap: () {
            final context = _animationController.homeKey.currentContext;
            if (context != null) {
              Scrollable.ensureVisible(
                context,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
        Spacer(),
        hoverableMenuItem(
          title: "Skills",
          hoverState: _animationController.idHoveringonSkills,
          onTap: () {
            final context = _animationController.skillsKey.currentContext;
            if (context != null) {
              Scrollable.ensureVisible(
                context,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
        Spacer(),
        hoverableMenuItem(
          title: "Projects",
          hoverState: _animationController.idHoveringonProjects,
          onTap: () {
            final context = _animationController.projectsKey.currentContext;
            if (context != null) {
              Scrollable.ensureVisible(
                context,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
        Spacer(),
        hoverableMenuItem(
          title: "Contact",
          hoverState: _animationController.idHoveringonContact,
          onTap: () {
             final context = _animationController.contactKey.currentContext;
                          if (context != null) {
                            Scrollable.ensureVisible(
                              context,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
          },
        ),
        Spacer(),
      ],
    ],
  );
}
 Widget hoverableMenuItem({
    required String title,
    required RxBool hoverState,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
onTap:onTap ,
      child: MouseRegion(
        onEnter: (_) => hoverState.value = true,
        onExit: (_) => hoverState.value = false,
        child: Obx(
          () => menuBarItems(title: title, isHovering: hoverState.value),
        ),
      ),
    );
  }
 AnimatedContainer menuBarItems({
    required String title,
    required bool isHovering,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            offset: isHovering ? Offset(2.0, 2.0) : Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ), // BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: isHovering ? Offset(-2.0, -2.0) : Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 300),
          style: TextStyle(
            color: isHovering ? Colors.deepOrange : Colors.grey[700]!,
          ),
          child: Text(title),
        ),
      ),
    );
  }