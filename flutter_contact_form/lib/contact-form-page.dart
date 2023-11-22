import 'package:flutter/material.dart';
import 'package:flutter_contact_form/widgets/custom-text-form-field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({Key? key}) : super(key: key);

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  Future<int> sendEmail() async {
    const serviceId = "service_o0d925w";
    const templateId = "template_ldnd54f";
    const userId = "XtI9_WvVnDf44JoBQ";

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userId ',
      },
      //
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "name": nameController.text,
          "subject": subjectController.text,
          "message": messageController.text,
          "user_email": emailController.text,
        },
      }),
    );
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 73, 20, 137),
          Color.fromARGB(255, 106, 27, 154),
          Color.fromARGB(255, 171, 71, 188),
        ],
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "CONTACT ME",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 300,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Form(
                          child: Column(
                        children: [
                          CustomTextFormField(
                            controller: nameController,
                            icon: const Icon(Icons.person),
                            hintText: "Name",
                            labelText: "Name",
                          ),
                          const SizedBox(height: 25),
                          CustomTextFormField(
                            controller: subjectController,
                            icon: const Icon(Icons.subject),
                            hintText: "Subject",
                            labelText: "Subject",
                          ),
                          const SizedBox(height: 25),
                          CustomTextFormField(
                            controller: emailController,
                            icon: const Icon(Icons.email),
                            hintText: "Email",
                            labelText: "Email",
                          ),
                          const SizedBox(height: 25),
                          CustomTextFormField(
                            controller: messageController,
                            maxLines: 3,
                            icon: const Icon(Icons.message),
                            hintText: "Message",
                            labelText: "Message",
                          ),
                          const SizedBox(height: 35),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                await sendEmail();
                              },
                              label: const Text("Send"),
                              icon: const Icon(Icons.send),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
