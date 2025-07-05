import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shouryapandey/animationctrls.dart';
import 'package:shouryapandey/views/parts/hoverablelogocontainer.dart';
import 'package:url_launcher/url_launcher.dart';

Widget contactPage(BuildContext context, BoxConstraints constraints) {
  final _animationController = Get.find<Animationctrls>();
  final double maxWidth = constraints.maxWidth;
  final formKey = GlobalKey<FormState>();
  
  // Form field controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  

  
  return Column(
    key: _animationController.contactKey,
    children: [
      SizedBox(height: Get.height * 0.05),

      // Header
      FadeIn(
        duration: Duration(milliseconds: 800),
        child: RichText(
          text: TextSpan(
            text: "Get In ",
            style: TextStyle(
              color: const Color.fromARGB(255, 59, 59, 59),
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "Touch",
                style: TextStyle(color: Colors.deepOrange),
              ),
            ],
          ),
        ),
      ),

      SizedBox(height: 20),
      
      // Subtitle
      Text(
        "Have a project in mind or want to say hello? Drop me a message!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
        ),
      ),

      SizedBox(height: 50),
      
      // Contact Form and Info in a responsive layout
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 40,
        runSpacing: 40,
        children: [
          // Contact Form
          _buildContactForm(maxWidth, formKey, nameController, emailController, 
              messageController,_animationController),
          
          // Contact Information
          _buildContactInfo(maxWidth),
        ],
      ),
      
      SizedBox(height: 80),
      
      // Footer
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Text(
              "© ${DateTime.now().year} Shourya Pandey. All rights reserved. Made with Flutter ❤️",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hoverableLogoContainer(
                  logo: "assets/githublogo.svg",
                  hoverState: _animationController.idHoveringonLogoGithub,
                  height: 24,
                  width: 24,
                  url: "https://github.com/Sho-urya25",
                ),
                SizedBox(width: 20),
                hoverableLogoContainer(
                  logo: "assets/ytlogo.svg",
                  hoverState: _animationController.idHoveringonLogoYoutube,
                  height: 24,
                  width: 24,
                  url: "https://www.youtube.com/@ShouryaPandey-j1y",
                ),
                SizedBox(width: 20),
                hoverableLogoContainer(
                  logo: "assets/linkdinlogo.svg",
                  hoverState: _animationController.idHoveringonLogoLinkdin,
                  height: 24,
                  width: 24,
                  url: "https://www.linkedin.com/in/spandey25",
                ),
                SizedBox(width: 20),
                hoverableLogoContainer(
                  logo: "assets/dsfgfsdg.svg",
                  hoverState: _animationController.idHoveringonLogoInstagraml,
                  height: 24,
                  width: 24,
                  url: "https://www.instagram.com/shouryap25",
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildContactForm(
  double maxWidth, 
  GlobalKey<FormState> formKey,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController messageController,
  Animationctrls animationController,
) {
  return Container(
    width: maxWidth < 900 ? maxWidth * 0.9 : maxWidth * 0.45,
    child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send a Message",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 25),
          
          // Name Field
          _buildNeomorphicTextField(
            controller: nameController,
            hintText: "Your Name",
            prefixIcon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          
          // Email Field
          _buildNeomorphicTextField(
            controller: emailController,
            hintText: "Your Email",
            prefixIcon: Icons.email_outlined,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          
          // Message Field
          _buildNeomorphicTextField(
            controller: messageController,
            hintText: "Your Message",
            prefixIcon: Icons.message_outlined,
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          
          // Submit Button
          Center(
            child: Obx(() {
              if (animationController.isSubmitted.value) {
                return _buildSuccessMessage();
              }
              
              return MouseRegion(
                onEnter: (_) => animationController.isHoveringSubmit.value = true,
                onExit: (_) => animationController.isHoveringSubmit.value = false,
                child: GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      submitForm(
                        name: nameController.text,
                        email: emailController.text,
                        message: messageController.text,
                        nameController: nameController,
                        emailController: emailController,
                        messageController: messageController,
                        animationController: animationController,
                      );
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: animationController.isHoveringSubmit.value ? Offset(2.0, 2.0) : Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: animationController.isHoveringSubmit.value ? Offset(-2.0, -2.0) : Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: animationController.isSubmitting.value
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.deepOrange,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          "Send Message",
                          style: TextStyle(
                            color: animationController.isHoveringSubmit.value ? Colors.deepOrange : Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSuccessMessage() {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[500]!,
          offset: Offset(4.0, 4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-4.0, -4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        SizedBox(width: 10),
        Text(
          "Message sent successfully!",
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
// In your contactsection.dart file
Future<void> submitForm({
  required String name,
  required String email,
  required String message,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController messageController,
  required Animationctrls animationController,
}) async {
  final url = Uri.parse('https://formsubmit.co/shouryapandeymain25@gmail.com'); // Replace with your email
  
  try {
   animationController.isSubmitting.value = true;
    
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'name': name,
        'email': email,
        'message': message,
        '_subject': 'New message from Portfolio Website!',
        '_captcha': 'false', // Set to true for production for spam protection
      },
    );
    
    if (response.statusCode == 200) {
       Get.snackbar(
      'Success',
      'Thank you for your message! I will get back to you soon.',
      snackPosition: SnackPosition.BOTTOM,
    );
      animationController.isSubmitting.value = false;
      animationController.isSubmitted.value = true;
      
      // Clear form
      nameController.clear();
      emailController.clear();
      messageController.clear();
      
      // Reset after delay
      Future.delayed(Duration(seconds: 5), () {
        animationController.isSubmitted.value = false;
      });
    } else {
      throw Exception('Failed to submit form');
    }
  } catch (e) {
    animationController.isSubmitting.value = false;
    Get.snackbar(
      'Error',
      'Failed to send message. Please try again.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
Widget _buildNeomorphicTextField({
  required TextEditingController controller,
  required String hintText,
  required IconData prefixIcon,
  int maxLines = 1,
  String? Function(String?)? validator,
}) {
  final RxBool isFocused = false.obs;
  
  return Focus(
    onFocusChange: (hasFocus) {
      isFocused.value = hasFocus;
    },
    child: Obx(() => AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: isFocused.value ? Colors.deepOrange.withOpacity(0.3) : Colors.grey[500]!,
            offset: isFocused.value ? Offset(2.0, 2.0) : Offset(4.0, 4.0),
            blurRadius: isFocused.value ? 5.0 : 15.0,
            spreadRadius: isFocused.value ? 0.5 : 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: isFocused.value ? Offset(-2.0, -2.0) : Offset(-4.0, -4.0),
            blurRadius: isFocused.value ? 5.0 : 15.0,
            spreadRadius: isFocused.value ? 0.5 : 1.0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(prefixIcon, color: isFocused.value ? Colors.deepOrange : Colors.grey[700]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        style: TextStyle(color: Colors.grey[800]),
        cursorColor: Colors.deepOrange,
        maxLines: maxLines,
        validator: validator,
      ),
    )),
  );
}

Widget _buildContactInfo(double maxWidth) {
  return Container(
    width: maxWidth < 900 ? maxWidth * 0.9 : maxWidth * 0.35,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 25),
        
        // Contact details with neomorphic design
        _buildContactInfoItem(
          icon: Icons.email_outlined,
          title: "Email",
          content: "shouryapandeymain25@gmail.com",
            onTap: () async {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'shouryapandeymain25@gmail.com',
            );
            if (await canLaunchUrl(emailLaunchUri)) {
              await launchUrl(emailLaunchUri);
            }
            }),
        SizedBox(height: 20),
        _buildContactInfoItem(
          icon: Icons.location_on_outlined,
          title: "Location",
          content: "Bangalore, India",
        ),
        SizedBox(height: 20),
        _buildContactInfoItem(
          icon: Icons.phone_outlined,
          title: "Phone",
          content: "+91 9977094171",
          onTap: () async {
             final Uri emailLaunchUri = Uri(
              scheme: 'tel',
              path: '+919977094171',
            );
            if (await canLaunchUrl(emailLaunchUri)) {
              await launchUrl(emailLaunchUri);
            }
          }
        ),
        SizedBox(height: 20),
        _buildContactInfoItem(
          icon: Icons.schedule_outlined,
          title: "Working Hours",
          content: "Mon - Fri: 9am - 6pm",
        onTap: (){
            Get.snackbar(
              'Working Hours',
              'I am available for work from Monday to Friday, 9 AM to 6 PM.',
              snackPosition: SnackPosition.BOTTOM,
            );
        }

        ),
        
        SizedBox(height: 40),
        
        // Map or image
        // Container(
        //   height: 200,
        //   decoration: BoxDecoration(
        //     color: Colors.grey[300],
        //     borderRadius: BorderRadius.circular(15),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey[500]!,
        //         offset: Offset(4.0, 4.0),
        //         blurRadius: 15.0,
        //         spreadRadius: 1.0,
        //       ),
        //       BoxShadow(
        //         color: Colors.white,
        //         offset: Offset(-4.0, -4.0),
        //         blurRadius: 15.0,
        //         spreadRadius: 1.0,
        //       ),
        //     ],
        //     image: DecorationImage(
        //       image: AssetImage("assets/map.png"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}

Widget _buildContactInfoItem({
  required IconData icon,
  required String title,
  required String content,
  VoidCallback? onTap,

}) {
  final RxBool isHovering = false.obs;
  
  return MouseRegion(
    onEnter: (_) => isHovering.value = true,
    onExit: (_) => isHovering.value = false,
    child: Obx(() => GestureDetector(onTap: onTap ,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(15),
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
              offset: isHovering.value ? Offset(-2.0, -2.0) : Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isHovering.value ? Colors.deepOrange : Colors.grey[700],
              size: 22,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  content,
                  style: TextStyle(
                    color: isHovering.value ? Colors.deepOrange : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )),
  );

  
}