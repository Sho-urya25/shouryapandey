 import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shouryapandey/animationctrls.dart';

Widget skillsPage(BuildContext context, BoxConstraints constraints) {
  final _animationController = Get.find<Animationctrls>();
    final double maxWidth = constraints.maxWidth;

    return Column(
      children: [
        SizedBox(height: Get.height * 0.05),

        // Header
        FadeIn(
          duration: Duration(milliseconds: 800),
          child: RichText(
            text: TextSpan(
              text: "My ",
              style: TextStyle(
                color: const Color.fromARGB(255, 59, 59, 59),
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "Skills",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: Get.height * 0.04),

        // Skills Categories
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _buildSkillCategory(
              "Frontend",
              [
                _buildSkillItem("Flutter", "assets/fluter.svg", 0.9),
                _buildSkillItem("Dart", "assets/dart.svg", 0.85),
                _buildSkillItem(
                  "Responsive Design",
                  "assets/design.svg",
                  0.9,
                ),
               
              ],
              _animationController.idHoveringOnFrontend,
              maxWidth,
            ),

            _buildSkillCategory(
              "Backend",
              [
                _buildSkillItem("Firebase", "assets/firebase.svg", 0.8),
                _buildSkillItem("REST APIs", "assets/api.svg", 0.75),
                _buildSkillItem("Node.js", "assets/nodejs.svg", 0.7),
                _buildSkillItem("SQL", "assets/sql.svg", 0.65),
              ],
              _animationController.idHoveringOnBackend,
              maxWidth,
            ),

            _buildSkillCategory(
              "Tools & Others",
              [
                _buildSkillItem("Git/GitHub", "assets/githublogo.svg", 0.85),
                _buildSkillItem("VS Code", "assets/vscode.svg", 0.9),
                _buildSkillItem("Figma", "assets/figma.svg", 0.7),
                
              ],
              _animationController.idHoveringOnTools,
              maxWidth,
            ),
          ],
        ),

        SizedBox(height: Get.height * 0.08),

        // Experience Section
        FadeIn(
          delay: Duration(milliseconds: 300),
          child: Column(
            key:  _animationController.projectsKey,
            children: [
              RichText(
                text: TextSpan(
                  text: "Work ",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 59, 59, 59),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Experience / Projects",
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _buildExperienceTimeline(maxWidth,_animationController),
            ],
          ),
        ),

        SizedBox(height: Get.height * 0.1),
      ],
    );
  }

  Widget _buildSkillCategory(
    String title,
    List<Widget> skills,
    RxBool hoverState,
    double maxWidth,
  ) {
    return MouseRegion(
      onEnter: (_) => hoverState.value = true,
      onExit: (_) => hoverState.value = false,
      child: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: maxWidth < 600
              ? maxWidth * 0.9
              : maxWidth < 900
              ? maxWidth * 0.45
              : maxWidth * 0.3,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                offset: hoverState.value ? Offset(2.0, 2.0) : Offset(4.0, 4.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: hoverState.value
                      ? Colors.deepOrange
                      : Colors.grey[800],
                ),
              ),
              Divider(color: Colors.grey[400], thickness: 1.5),
              SizedBox(height: 15),
              ...skills,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillItem(String name, String iconPath, double proficiency) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(
                    Colors.grey[700]!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        spreadRadius: 0.5,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-1.0, -1.0),
                        blurRadius: 2.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: proficiency * 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.7),
                              Colors.deepOrange,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                '${(proficiency * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceTimeline(double maxWidth,Animationctrls animationController) {
    return Container(
      key: animationController.projectsKey ,
      width: maxWidth < 800 ? maxWidth * 0.9 : maxWidth * 0.7,
      child: Column(
        children: [
          _buildExperienceItem(
            "Flutter SDE Intern",
            "Alpha Bi.Co",
            "Dec 2024 - Present",
            "Worked as a Flutter developer intern at Alpha BI, building cross-platform apps with clean architecture and performance optimization. Integrated real-time chat and IoT features like Bluetooth-based sensor monitoring.",
          ),
          _buildTimelineConnector(),
          _buildExperienceItem(
            "Image To Pdf Converter",
            "Personal Project ",
            "Jan 2024 - May 2024",
            "Developed a comprehensive mobile application using Flutter and Dart that enables users to efficiently convert scanned images into PDF documents.",
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineConnector() {
    return Container(height: 40, width: 2, color: Colors.grey[400]);
  }

  Widget _buildExperienceItem(
    String role,
    String company,
    String period,
    String description,
  ) {
    final RxBool isHovering = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                offset: isHovering.value ? Offset(2.0, 2.0) : Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: isHovering.value
                    ? Offset(-2.0, -2.0)
                    : Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isHovering.value
                          ? Colors.deepOrange
                          : Colors.grey[800],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.5,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-2.0, -2.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Text(
                      period,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                company,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }