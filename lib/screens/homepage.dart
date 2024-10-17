import 'package:app1/screens/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Color(0xff013243)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              checkSignout(context);
            },
            icon: Icon(Icons.login_outlined),
            color: Color(0xff013243),
          )
        ],
        backgroundColor: Color(0xff03E079),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        color: Color(0xff013243),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: index % 2 == 0
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/portrait-man-cartoon-style_23-2151133925.jpg'),
                      radius: 30,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/portrait-man-cartoon-style_23-2151133925.jpg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
              title: Text(
                'Person ${index + 1}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'This is Test',
                style: TextStyle(color: Color(0xffdedbd5)),
              ),
              trailing: Text(
                '${index + 10} min ago',
                style: TextStyle(color: Color(0xffdff0e9)),
              ),
            );
          },
          // separatorBuilder: (ctx, index) {
          //   return Divider();
          //},
          itemCount: 20,
        ),
      )),
    );
  }

  void checkSignout(BuildContext ctx1) {
    showDialog(
        context: ctx1,
        builder: (ctx2) {
          // Alert Dailog
          return AlertDialog(
            backgroundColor: Color(0xff204C59),
            title: Text(
              'Signout',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Do you really wish to Sign Out',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx2).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xff03E079)),
                  )),
              ElevatedButton(
                onPressed: () {
                  signOut(ctx1);
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff03E079)),
              )
            ],
          );
        });
  }
  // To Signout and go to other page

  void signOut(BuildContext ctx3) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx3).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx3) => Loginpage()), (route) => false);
  }
}
