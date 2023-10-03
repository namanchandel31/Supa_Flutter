import 'package:flutter/material.dart';
import 'package:supa_flutter/home_page.dart';
import 'package:supa_flutter/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'dart:convert';
import 'dart:math';
import 'dart:developer' as dev;

import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) async {
      final event = data.event;

      if (event == AuthChangeEvent.signedIn) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(user: data.session!.user),
            ));
      } else if (event == AuthChangeEvent.signedOut) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
      }
    });
  }

  void onTapFaceBookSignin() async {
    await supabase.auth.signInWithOAuth(
      Provider.facebook,
      // redirectTo: "io.supabase.supaflutterflow://login-callback/",
      authScreenLaunchMode: LaunchMode.inAppWebView,
    );
  }

  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () async {
                  // await supabase.auth.signOut();
                  const appAuth = FlutterAppAuth();

                  // Just a random string
                  final rawNonce = _generateRandomString();
                  final hashedNonce =
                      sha256.convert(utf8.encode(rawNonce)).toString();

                  /// Client ID that you registered with Google Cloud.
                  /// You will have two different values for iOS and Android.
                  final clientId = Platform.isIOS
                      ? 'IOS_CLIENT_ID'
                      : '436867458337-3luae9pmfdmui6n2bl42l4ake044o7ia.apps.googleusercontent.com';

                  /// Set as reversed DNS form of Google Client ID + `:/` for Google login
                  final redirectUrl =
                      '${clientId.split('.').reversed.join('.')}:/';

                  /// Fixed value for google login
                  const discoveryUrl =
                      'https://accounts.google.com/.well-known/openid-configuration';

                  dev.log("google authrizations");

                  // authorize the user by opening the concent page
                  final result = await appAuth.authorize(
                    AuthorizationRequest(
                      clientId,
                      redirectUrl,
                      discoveryUrl: discoveryUrl,
                      nonce: hashedNonce,
                      scopes: [
                        'openid',
                        'email',
                        'profile',
                      ],
                    ),
                  );

                  dev.log("google token 1");

                  if (result == null) {
                    throw 'No result';
                  }

                  dev.log("google token 2");

                  // Request the access and id token to google
                  final tokenResult = await appAuth.token(
                    TokenRequest(
                      clientId,
                      redirectUrl,
                      authorizationCode: result.authorizationCode,
                      discoveryUrl: discoveryUrl,
                      codeVerifier: result.codeVerifier,
                      nonce: result.nonce,
                      scopes: [
                        'openid',
                        'email',
                        'profile',
                      ],
                    ),
                  );

                  final idToken = tokenResult?.idToken;

                  if (idToken == null) {
                    throw 'No idToken';
                  }

                  AuthResponse resp = await supabase.auth.signInWithIdToken(
                    provider: Provider.google,
                    idToken: idToken,
                    nonce: rawNonce,
                  );
                  dev.log(resp.user!.email.toString());

                  // bool resp = await supabase.auth
                  //     .signInWithOAuth(Provider.google,
                  //         authScreenLaunchMode:
                  //             LaunchMode.inAppWebView);

                  dev.log("google login successful");
                },
                icon: const Icon(Icons.g_mobiledata_rounded),
                label: const Text('Sign in with Google')),
            ElevatedButton.icon(
                onPressed: onTapFaceBookSignin,
                icon: const Icon(Icons.facebook_rounded),
                label: const Text('Sign in with Facebook')),
          ],
        ),
      ),
    );
  }
}
