import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomPageWidget extends StatefulWidget {
  const WelcomPageWidget({Key? key}) : super(key: key);

  @override
  _WelcomPageWidgetState createState() => _WelcomPageWidgetState();
}

class _WelcomPageWidgetState extends State<WelcomPageWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Text(
            'cozmozone',
            style: FlutterFlowTheme.of(context).title1,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: PageView(
                          controller: pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/cozmozone-welcome-12.png',
                                  width: double.infinity,
                                  height: 300,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 20, 12, 0),
                                          child: Text(
                                            'The premium & professional hair products platform',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/cozmozone-welcome-13.png',
                                    width: double.infinity,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Text(
                                              'Place professional orders at your fingertips',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Text(
                                              'Call us at +1-800-868-8787 for professional salon account and pricing',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/cozmozone-welcome-15.png',
                                    width: double.infinity,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Text(
                                              'Exclusive distribution in the USA',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 0),
                                            child: Text(
                                              '\"I found myself on a quest to track down the perfect range of colours that would rebuild the hair, create shine and bring about the transformations I envisaged. \" - Mounir',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 4,
                              dotColor: FlutterFlowTheme.of(context).lineColor,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('LoginPage');
                  },
                  text: 'Login',
                  options: FFButtonOptions(
                    width: 300,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('CreateAccPage');
                  },
                  text: 'Create Account',
                  options: FFButtonOptions(
                    width: 300,
                    height: 50,
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
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
