import 'package:app1/main.dart';
import 'package:app1/screens/homepage.dart';
import 'package:app1/screens/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    checkUserLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     colors: [Colors.blue, Colors.pink],
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft)
            color: Color(0xff013243)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified_user,
                size: 100,
                color: Color(0xff03E079),
              ),
              Text(
                'LOGIN APP',
                style: GoogleFonts.qwitcherGrypen(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff03E079)),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> goToLoginPage() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Loginpage()));
  }

  Future<void> checkUserLogin() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userloggin = _sharedprefs.getBool(SAVE_KEY_NAME);
    if (_userloggin == null || _userloggin == false) {
      goToLoginPage();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Homepage()));
    }
  }
}
