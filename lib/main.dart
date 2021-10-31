// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

_makingPhoneCall(String phoneNumber) async {
  String url = "tel:"+phoneNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_sendingEmail(String email) async {
  String url = "mailto:"+email;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                //Use your desired picture
                backgroundImage: AssetImage("images/profile_image.jpg"),
              ),
              Text(
                "[Your Name]",
                style: TextStyle(
                    fontFamily: "Pacifico",
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(
                width: 50.0,
                child: Divider(
                  height: 10.0,
                  color: Colors.teal.shade900,
                ),
              ),
              Card(

                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+123 456 7890",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                      fontFamily: "Source Sans Pro",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    _makingPhoneCall("+123 456 7890");
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "google@gmail.com",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Source Sans Pro"
                    ),
                  ),
                  onTap: (){
                    _sendingEmail("google@gmail.com");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
