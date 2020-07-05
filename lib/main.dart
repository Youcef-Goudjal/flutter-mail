import 'package:flutter/material.dart';
import 'package:imap_client/imap_client.dart';
import 'package:mail_app/app_helper.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mail APP",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  ImapClient client;

  initializeMail() async {
    // connect
    await client.connect("imap.gmail.com", 993, true);
    // authenticate
    await client
        .authenticate(new ImapPlainAuth("", ""))
        .then((value) => print("done !"));
    // get folder
    ImapFolder inbox = await client.getFolder("inbox");
  }

  void initState() {
    super.initState();
    client = ImapClient();
    initializeMail();
  }

  List emails;

  Future<List> getEmails() async {
    //printImapClientDebugLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getEmails();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
