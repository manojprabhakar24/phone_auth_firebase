import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
bool _isButtonPressed = false;
class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 200,
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Change the background color her
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                        Image.asset(
                          'assets/Scissors-image-remove.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 9)),
                              Text("Scissor's",style: TextStyle(
                                  fontSize: 20
                              ),),
                            ]),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Enter your Details",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.brown[900],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child:Container(

                            constraints: BoxConstraints(maxWidth: 430,maxHeight: 284), // Adjust the maximum width as needed
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _nameController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            labelText: "Enter your name",
                                            labelStyle: TextStyle(color: Colors.brown),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.brown, width: 1.0),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.brown, width: 1.0),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            // Adjust horizontal padding
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter your name";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 8),
                                        TextFormField(
                                          controller: _phoneController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            prefixText: "+91 ",
                                            labelText: "Enter your mobile  number",
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.brown, width: 1.0),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.brown, width: 1.0),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            // Change the cursor color here
                                            // Cursor color when the text field is focused
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.brown, width: 1.0),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            // Change the cursor color
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter your number";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 15),
                                        SizedBox(
                                          height: 50,
                                          width: double.infinity,
                                          child:ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _isButtonPressed = !_isButtonPressed;
                                              });
                                              if (_formKey.currentState!.validate()) {
                                                AuthService.sentOtp(
                                                  phone: _phoneController.text,
                                                  errorStep: () {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          "Error in sending OTP",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                        backgroundColor: Colors.red,
                                                      ),
                                                    );
                                                  },
                                                  nextStep: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => AlertDialog(
                                                        title: Text("OTP Verification"),
                                                        content: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Enter 6 digit OTP"),
                                                            SizedBox(height: 12),
                                                            Form(
                                                              key: _formKey1,
                                                              child: TextFormField(
                                                                keyboardType: TextInputType.number,
                                                                controller: _otpController,
                                                                style: TextStyle(color: Colors.brown),
                                                                decoration: InputDecoration(
                                                                  labelText: "Enter OTP",
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(8),
                                                                  ),
                                                                  enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(color: Colors.brown, width: 1.0),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(color: Colors.brown, width: 1.0),
                                                                    borderRadius: BorderRadius.circular(8),
                                                                  ),
                                                                ),
                                                                validator: (value) {
                                                                  if (value!.length != 6) {
                                                                    return "Invalid OTP";
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(height: 10),
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                if (_formKey1.currentState!.validate()) {
                                                                  AuthService.loginWithOtp(
                                                                    otp: _otpController.text,
                                                                  ).then((value) {
                                                                    if (value == "Success") {
                                                                      Navigator.pop(context); // Close the OTP verification dialog
                                                                      Navigator.pushReplacement(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>  HomePage (name: _nameController.text,
                                                                            phoneNumber: _phoneController.text,), // Navigate to the next page on success
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                        SnackBar(
                                                                          content: Text(
                                                                            value,
                                                                            style: TextStyle(color: Colors.white),
                                                                          ),
                                                                          backgroundColor: Colors.red,
                                                                        ),
                                                                      );
                                                                    }
                                                                  });
                                                                }
                                                              },
                                                              child: Text(
                                                                "Submit",
                                                                style: TextStyle(color: Colors.white),
                                                              ),
                                                              style: ElevatedButton.styleFrom(
                                                                primary: Colors.brown,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            child: Text(
                                              "Send OTP",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: _isButtonPressed ? Colors.brown[400] : Colors.brown[900],
                                              onPrimary: Colors.black,
                                              minimumSize: Size(100, 40),
                                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),

                                        )]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ]));
  }
}
