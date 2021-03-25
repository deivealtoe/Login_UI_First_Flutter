import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeApp(),
  ));
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  void buttonSendIt() {
    print('Pressed Send It button.');

    print('First name: ${firstNameController.text}.');
    print('Last name: ${lastNameController.text}.');
    print('E-mail: ${emailController.text}.');

    print('Sending data to somewhere...');
  }

  void buttonResetIt() {
    print('Pressed Reset It button.');
    print('Reseting fields.');

    firstNameController.text = '';
    lastNameController.text = '';
    emailController.text = '';

    print('Fields now blank.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My First Login UI',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: <Widget>[
              buildTextFormField('First name', firstNameController),
              buildTextFormField('Last name', lastNameController),
              buildTextFormField('E-mail', emailController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildElevatedButton('Send It', buttonSendIt),
                  buildElevatedButton('Reset It', buttonResetIt),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextFormField(String labelText, TextEditingController controller) {
  return Container(
    padding: EdgeInsets.all(10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 15,
          color: Colors.teal[800],
          fontStyle: FontStyle.italic,
        ),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(
        fontSize: 20,
        color: Colors.teal[800],
      ),
    ),
  );
}

Widget buildElevatedButton(String buttonText, Function buttonOnPressed) {
  return ElevatedButton(
    child: Text(
      buttonText,
    ),
    style: ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Colors.teal[800],
    ),
    onPressed: buttonOnPressed,
  );
}
