import 'package:break_bread/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: ListTile(
              title: Text('Sign Out'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () async {
                await _auth.signOut();
              }
    )
    );
  }
}