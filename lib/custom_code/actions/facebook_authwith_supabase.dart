// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future facebookAuthwithSupabase() async {
  // Add your function code here!

  await Supabase.instance.client.auth.signInWithOAuth(
    Provider.facebook,
    authScreenLaunchMode: LaunchMode.externalApplication,
  );
}
