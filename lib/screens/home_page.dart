import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:id_analyze/const.dart';
import 'package:id_analyze/id_information/national_id_info.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final idController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  NationalIdInfo? info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'National ID',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/Animation - 1.json',
                height: 250,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'National id',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: idController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required !';
                  }
                  if (value!.length < 14) {
                    return 'This field must not be less than 14 digit !';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    showInformationByUserId();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: const Text(
                    'Analyze',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  showInformationByUserId() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    String id = idController.text;
    NationalIdInfo parsedInfo = NationalIdInfo.parseInfo(id);
    setState(() {
      info = parsedInfo;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'ID Information',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
          ),
          content: SizedBox(
            height: 250,
          //  padding: const EdgeInsets.all(10),
         //   margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Year: ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      " ${info!.year}",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Month: ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${info!.month}",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Day: ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${info!.day}",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Gender: ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      info!.gender,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Birthplace: ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      info!.birthplace,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Card Number: ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      info!.cardNumber,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 25,
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
