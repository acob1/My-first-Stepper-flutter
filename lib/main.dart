import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_stepper/steppers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stepper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Stepper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _file;
  PlatformFile? _platformFile;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }

    // loadingController.forward();
  }

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  _MyFormState() {
    _selectedVal = _myvalueList[0];
  }

  final _myvalueList = ["YES", "NO"];
  String? _selectedVal = "YES";
  int currentStep = 0;

  final nameOfDeceased = TextEditingController();
  final _date = TextEditingController();
  final _dateBirth = TextEditingController();
  final relationship = TextEditingController();
  final contactPersonName = TextEditingController();
  final contactPersonNumber = TextEditingController();
  final address = TextEditingController();
  final townName = TextEditingController();
  final cardNumber = TextEditingController();
  final companyName = TextEditingController();
  final position = TextEditingController();
  final contactDetails2 = TextEditingController();
  final contactDetails1 = TextEditingController();
  final layInState = TextEditingController();
  final burialDetails = TextEditingController();
  final finalFuneralRight = TextEditingController();
  final funeralGathering = TextEditingController();
  final thankYouMessage = TextEditingController();
  final funeralAnnouncement = TextEditingController();

  DateTime selectedDate = DateTime.now();
  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Stepper(
          // type: StepperType.horizontal,
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              print('Complted');
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepTapped: (step) => setState(() => currentStep = step),
          onStepCancel:
              currentStep == 0 ? null : () => setState(() => currentStep -= 1),
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: details.onStepContinue,
                      child: const Text('NEXT'),
                    ),
                  ),
                  if (currentStep != 0)
                    Expanded(
                      child: TextButton(
                        onPressed: details.onStepCancel,
                        child: const Text('BACK'),
                      ),
                    ),
                ],
              ),
            );
          },
        ));
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text('About'),
            content: Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameOfDeceased,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of Deceased'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _date,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Date Died'),
                    onTap: () async {
                      final DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      );
                      if (pickeddate != null) {
                        setState(() {
                          selectedDate = pickeddate;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: relationship,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Relationship'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _dateBirth,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date of Birth'),
                    onTap: () async {
                      final DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      );
                      if (pickeddate != null) {
                        setState(() {
                          selectedDate = pickeddate;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: contactPersonName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contact Person Name'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: contactPersonNumber,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contact Person Number'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    value: _value,
                    items: const [
                      DropdownMenuItem(
                        value: "-1",
                        child: Text("-Country-"),
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: Text("United States"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("Japan"),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text("Yemen"),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text("Ghana"),
                      )
                    ],
                    onChanged: (v) {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // const DropdownButtonExample(),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    value: _value,
                    items: const [
                      DropdownMenuItem(
                        value: "-1",
                        child: Text("-Accetp Donation-"),
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: Text("YES"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("NO"),
                      )
                    ],
                    onChanged: (v) {},
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    value: _value,
                    items: const [
                      DropdownMenuItem(
                        value: "-1",
                        child: Text("-Accetp Gift-"),
                      ),
                      DropdownMenuItem(
                        value: "1",
                        child: Text("YES"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("NO"),
                      )
                    ],
                    onChanged: (v) {},
                  ),
                ],
              ),
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Images'),
            content: Column(
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Upload Intro Image',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Recpmmended file size 2- 4mb',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: selectFile,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        color: Colors.blue.shade400,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Iconsax.image5,
                                color: Colors.blue,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select your image',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                const Divider(
                  color: Color.fromARGB(255, 149, 206, 253),
                  height: 20,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Upload Banner Image',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Recpmmended file size 2- 4mb',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: selectFile,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        color: Colors.blue.shade400,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Iconsax.folder_open,
                                color: Colors.blue,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select your file',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            )),
        Step(
          isActive: currentStep >= 2,
          title: const Text('Details'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Text(
                //   'NOTICE : There will be no wake',
                //   style: TextStyle(
                //       fontSize: 25,
                //       color: Colors.grey.shade800,
                //       fontWeight: FontWeight.bold),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),

                TextFormField(
                  controller: layInState,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Lay In State'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: burialDetails,
                  decoration: const InputDecoration(
                      hintText: 'Include date and Venue',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 185, 185, 185),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Burial Details'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: finalFuneralRight,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Final Funeral Right'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: funeralGathering,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Funeral Gathering'),
                ),
                // TextFormField(
                //   controller: position,
                //   decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Funeral Gathering'),
                // ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  minLines: 3,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  controller: funeralAnnouncement,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Funeral Announcement'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: contactDetails1,
                  decoration: const InputDecoration(
                      hintText: 'e.g 2263839',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 185, 185, 185)),
                      border: OutlineInputBorder(),
                      labelText: 'Contact Details 1'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: contactDetails2,
                  decoration: const InputDecoration(
                      hintText: 'e.g 2263839',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 185, 185, 185)),
                      border: OutlineInputBorder(),
                      labelText: 'Contact Details 2'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  minLines: 3,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  controller: thankYouMessage,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Thank You Message'),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Template'),
          content: Column(
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              Text(
                'Select Template',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Recpmmended Template size 2- 4mb',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: selectFile,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      color: Colors.blue.shade400,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.image5,
                              color: Colors.blue,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Select your image',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              const Divider(
                color: Color.fromARGB(255, 149, 206, 253),
                height: 20,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Upload Banner Image',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Recpmmended file size 2- 4mb',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: selectFile,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    color: Colors.blue.shade400,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50.withOpacity(.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.folder_open,
                            color: Colors.blue,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Select your file',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ];
}
