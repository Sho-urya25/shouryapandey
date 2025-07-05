import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Animationctrls extends GetxController {
  RxDouble opacity = 0.0.obs;

  RxDouble offset = (-100.0).obs;

  void animateText() {
    opacity.value = 1.0;
    offset.value = 0.0;
  }

  RxBool idHoveringonhome = false.obs;
  RxBool idHoveringonResume = false.obs;
  RxBool idHoveringonSkills = false.obs;
  RxBool idHoveringonProjects = false.obs;
  RxBool idHoveringonContact = false.obs;
  RxBool idHoveringonLogoLinkdin = false.obs;
  RxBool idHoveringonLogoGithub = false.obs;
  RxBool idHoveringonLogoYoutube = false.obs;
  RxBool idHoveringonLogoInstagraml = false.obs;
  RxBool idHoveringonCenterLogo = false.obs;
  RxBool idHoveringOnFrontend = false.obs;
  RxBool idHoveringOnBackend = false.obs;
  RxBool idHoveringOnTools = false.obs;
  RxBool isSubmitting = false.obs;
  RxBool isSubmitted = false.obs;
  RxBool isHoveringSubmit = false.obs;
    final homeKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();
}
