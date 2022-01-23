import 'package:flutter/material.dart';
import 'package:registration_form/StudentModel.dart';
import 'package:registration_form/StudentController.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = "My App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController coursesController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  int gender = 0;
  var _gender ;
  var courseTypes = ["Gave","Jee","WPS"];

  var selectedCourseType ;

  // bool valuefirst = false;
  // bool valuesecond = false;
  // bool valuethird = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Round 47',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Registration Page',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Student Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(

                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                // obscureText: true,
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text("Gender :"),
            ),

            ListTile(
              title: const Text('Male'),
              leading: Radio(
                value: "male",
                groupValue: _gender,
                onChanged: ( value) {
                  setState(() {
                    _gender = value;
                  });
                },
                activeColor: Colors.red,
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio(
                value: "female",
                groupValue: _gender,
                onChanged: ( value) {
                  setState(() {
                    _gender = value;
                  });
                },
                activeColor: Colors.red,
              ),
            ),


            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text("Courses :"),
            ),


            DropdownButtonFormField(

              items: courseTypes.map((String coursetype){
                return DropdownMenuItem(
                  value: coursetype,
                  child: Text(coursetype),
                );
              }).toList(),
              onChanged: (newValue){
                setState(() => selectedCourseType = newValue);
              },
              value: selectedCourseType,
            ),




            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(

                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),


            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    print(nameController.text);
                    print(mobileController.text);
                    print(emailController.text);
                    print(selectedCourseType);

                    print(addressController.text);
                    print(_gender);


                    String name = nameController.value.toString();
                    String email = emailController.value.toString();
                    String mobile = mobileController.value.toString();
                    String address = addressController.value.toString();
                    String gen = gender == 0? 'Male': 'Female';
                    String course = this.selectedCourseType;
                    var stu = StudentModel(name, email, mobile, gen, course, address);
                  },
                )
            ),

          ],
        ));
  }
}