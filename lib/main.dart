import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[500],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/moi.jpg'),
                ),
              ),
              Text(
                'William Martin',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Mission Script'),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.deepPurple.shade50,
                ),
              ),
              Text(
                'Mobile Developer'.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Open Sans',
                  letterSpacing: 2.5,
                  color: Colors.purple.shade200,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: InkWell(
                  onTap: launchCall,
                  child: ListTile(
                    leading: Icon(
                      Icons.stay_current_portrait,
                      color: Colors.deepPurple[900],
                    ),
                    title: Text(
                      '+33 7 69 15 03 41',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: InkWell(
                  onTap: launchEmail,
                  child: ListTile(
                    leading: Icon(
                      Icons.send,
                      color: Colors.deepPurple[900],
                    ),
                    title: Text(
                      'maartz@protonmail.com',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

launchCall() async {
  const url = '+33 7 69 15 03 41';

  if (await canLaunch(url)) {
    await launch('tel://$url');
  } else {
    throw Error;
  }
}

launchEmail() async {
  const url = 'maartz@protonmail.com';

  if (await canLaunch(url)) {
    await launch('mailto:$url');
  } else {
    throw DiagnosticLevel.error;
  }
}
