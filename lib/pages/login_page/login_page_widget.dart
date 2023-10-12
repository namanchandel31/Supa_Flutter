import 'dart:developer';

import 'package:supabase_auth/backend/supabase/database/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // clientId:
    //      500446238576
    //     "436867458337-3luae9pmfdmui6n2bl42l4ake044o7ia.apps.googleusercontent.com",
    signInOption: SignInOption.standard,
    // serverClientId:
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNtZ2FlcGJ4amFmdm5kcmJibWpsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5NTc5ODM2MSwiZXhwIjoyMDExMzc0MzYxfQ.Iu0I8Hg1uvivhDf8lM5vx1THxkJ62X4evjalRZWTHzQ'
    // scopes: [
    //   // 'email',
    //   // 'https://www.googleapis.com/auth/userinfo.profile'
    //   // 'https://www.googleapis.com/auth/contacts.readonly',
    // ],
  );

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.supabaseSignInAuthListener(
        context,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: Color(0xFFF1F4F8),
                borderRadius: BorderRadius.circular(16.0),
              ),
              alignment: AlignmentDirectional(0.00, 0.00),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1558244661-d248897f7bc4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxsZWdvfGVufDB8fHx8MTY5NTgwNzIxM3ww&ixlib=rb-4.0.3&q=80&w=1080',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Container(
                  width: double.infinity,
                  height: 400.0,
                  constraints: BoxConstraints(
                    maxWidth: 570.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFFF1F4F8),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 60.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Container(
                            width: 230.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/favicon.png',
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Get Started',
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 24.0),
                                    child: Text(
                                      'Let\'s get started with your favourite quick login option',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Wrap(
                              spacing: 12.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.center,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      print('trying');
                                      try {
                                        // Obtain the auth details from the request
                                        // final GoogleSignInAuthentication?
                                        //     googleAuth =
                                        //     await googleUser?.authentication;
                                        await _googleSignIn.signOut();
                                        await _googleSignIn.signIn();

                                        print("Display Name: " +
                                            _googleSignIn
                                                .currentUser!.displayName
                                                .toString());
                                        print("Email: " +
                                            _googleSignIn.currentUser!.email
                                                .toString());
                                        print("Photo URL: " +
                                            _googleSignIn.currentUser!.photoUrl
                                                .toString());
                                        print("ID: " +
                                            _googleSignIn.currentUser!.id
                                                .toString());
                                        print("Server Auth Code: " +
                                            _googleSignIn
                                                .currentUser!.serverAuthCode
                                                .toString());

                                        debugPrint(
                                          '_______________________',
                                        );

                                        // Generate a JSON Web Token
// You can provide the payload as a key-value map or a string
                                        final jwt = JWT(
                                            // Payload
                                            {
                                              "azp":
                                                  "517948199527-7vgu8ne6ivbihihto9f36lien6lt808a.apps.googleusercontent.com",
                                              "aud":
                                                  "517948199527-tk6hkjducbor85kcm9adsp9ck8q0pg0c.apps.googleusercontent.com",
                                              "sub": "116573411944313041818",
                                              "email":
                                                  "merlinwilson31@gmail.com",
                                              "email_verified": true,
                                              "name": "Ani Lyrics TV",
                                              "picture":
                                                  "https://lh3.googleusercontent.com/a/ACg8ocK2j8ayBMQ4RzXR1i-5bxBLgYgik6aUBUZUR6L2BP4Lng=s96-c",
                                              "given_name": "Ani",
                                              "family_name": "Lyrics TV",
                                              "locale": "en",
                                              "iat": 1697020936,
                                              "exp": 1697024536
                                            },
                                            issuer:
                                                'https://accounts.google.com',
                                            header: {
                                              "alg": "RS256",
                                              "kid":
                                                  "c6263d09745b5032e57fa6e1d041b77a54066dbd",
                                              "typ": "JWT"
                                            });

// Sign it (default with HS256 algorithm)
                                        final token = jwt.sign(SecretKey(
                                            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNtZ2FlcGJ4amFmdm5kcmJibWpsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU3OTgzNjEsImV4cCI6MjAxMTM3NDM2MX0.niAmLkNtPTR5kYp3xjqD_B27WZsh_5ty6hrC5JdIcYA'));

                                        print('Signed token: $token\n');

                                        print("Server Auth Code: " +
                                            _googleSignIn
                                                .currentUser!.serverAuthCode
                                                .toString());
                                        _googleSignIn
                                            .currentUser!.authentication
                                            .then((value) {
                                          print("idToken: " +
                                              value.idToken.toString());
                                          print("accessToken: " +
                                              value.accessToken.toString());
                                        });

                                        await Supabase.instance.client.auth
                                            .signInWithIdToken(
                                                idToken: '', // idToken from _googleSignIn.currentUser!.authentication
                                                provider: Provider.google);
                                      } catch (error) {
                                        print(error);
                                      }
                                    },
                                    text: 'Continue with Google',
                                    icon: FaIcon(
                                      FontAwesomeIcons.google,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF101213),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E3E7),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                      hoverColor: Color(0xFFF1F4F8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        'HomePage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.scale,
                                            alignment: Alignment.bottomCenter,
                                          ),
                                        },
                                      );
                                    },
                                    text: 'Continue with Apple',
                                    icon: FaIcon(
                                      FontAwesomeIcons.apple,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF101213),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E3E7),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                      hoverColor: Color(0xFFF1F4F8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await actions.facebookAuthwithSupabase();
                                    },
                                    text: 'Continue with Facebook',
                                    icon: FaIcon(
                                      FontAwesomeIcons.facebookF,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 44.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF101213),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E3E7),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                      hoverColor: Color(0xFFF1F4F8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
