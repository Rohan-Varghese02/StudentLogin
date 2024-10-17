import 'package:app1/main.dart';
import 'package:app1/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _seepass = true;

  final _keySafe = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     colors: [Colors.pink, Colors.blue],
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft)
            color: Color(0xff013243)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _keySafe,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_2_rounded,
                  size: 200,
                  color: Color(0xff03E079),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xff204C59),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    // border: Border.all(
                    //   color: Colors.white,
                    // )
                  ),
                  child: TextFormField(
                    controller: _usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Color(0xff03E079)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff03E079)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),

                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'Username',
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      // hintText: 'Username',
                      // hintStyle:
                      //     GoogleFonts.montserrat(color: Color(0xff7733ff))
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide username';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xff204C59),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    // border: Border.all(
                    //   color: Colors.white,
                    // )
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _passwordController,
                    obscureText: _seepass,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _seepass = !_seepass;
                            });
                          },
                          icon: _seepass
                              ? Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: Color(0xff03E079),
                                )),
                      errorStyle: TextStyle(color: Color(0xff03E079)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff03E079)),
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 20),
                      // hintText: 'Password',
                      // hintStyle:
                      //     GoogleFonts.montserrat(color: Color(0xff7733ff))
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide Password';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _keySafe.currentState!.validate();
                    validityCheck(context);
                  },
                  label: Text(
                    'Login',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff03E079)),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void validityCheck(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username.isNotEmpty && _password.isNotEmpty) {
      if (_username == 'Brototype' && _password == 'pass123') {
        final _sharedPrefs = await SharedPreferences.getInstance();
        await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx1) => Homepage()));
      } else {
        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          content: Text('Username and Password does not match'),
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5),
        ));
      }
    }
  }
}
