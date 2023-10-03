import 'package:flutter/material.dart';
import 'package:supa_flutter/login_page.dart';
import 'package:supa_flutter/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  User? user;
  HomePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Homepage"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Image.network(user!.),
                  Column(
                    children: [
                      Text("Hello"),
                      Text(user!.email.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(user!.userMetadata.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(user!.appMetadata.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    supabase.auth.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign Out')),
            ],
          ),
        ),
      ),
    );
  }
}
