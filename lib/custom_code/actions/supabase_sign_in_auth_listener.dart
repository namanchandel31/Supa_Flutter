// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future supabaseSignInAuthListener(BuildContext context) async {
  // Add your function code here!
  Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
    final AuthChangeEvent event = data.event;
    // final Session? session = data.session;
    // final User user = session!.user;
    // TODO: You can use session and user object according to the requirements.
    // for user_name use : user.userMetadata!['full_name']
    // for user_name use : user.userMetadata!['email']
    // for user_name use : user.userMetadata!['avatar_url']

    if (event == AuthChangeEvent.signedIn) {
      // handle navigation accordingly
      context.goNamed('HomePage');
    }
  });
}
