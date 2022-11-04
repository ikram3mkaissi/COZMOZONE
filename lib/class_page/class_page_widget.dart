import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassPageWidget extends StatefulWidget {
  const ClassPageWidget({Key? key}) : super(key: key);

  @override
  _ClassPageWidgetState createState() => _ClassPageWidgetState();
}

class _ClassPageWidgetState extends State<ClassPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Classes',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 20),
                  child: Container(
                    width: double.infinity,
                    height: 184,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.network(
                          'https://images.unsplash.com/photo-1616803689943-5601631c7fec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fHdvcmtvdXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x65090F13),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Class Name',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '30m | High Intensity | Indoor/Outdoor',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF39D2C0),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button-Reserve pressed ...');
                                      },
                                      text: 'Add to Cart',
                                      options: FFButtonOptions(
                                        width: 120,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: GoogleFonts.getFont(
                                          'Inter',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: Text(
                                              '10:00am',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Thursday June 22',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xB4FFFFFF),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    height: 184,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/john-arano-h4i9G-de7Po-unsplash.jpg',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x65090F13),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Class Name',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    '30m | High Intensity | Indoor/Outdoor',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF39D2C0),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button-Reserve pressed ...');
                                    },
                                    text: 'Reserve',
                                    icon: Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 120,
                                      height: 40,
                                      color: Color(0xFF39D2C0),
                                      textStyle: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Text(
                                            '10:00am',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          'Thursday June 22',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xB4FFFFFF),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    height: 184,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.network(
                          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d29ya291dHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x65090F13),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Class Name',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    '30m | High Intensity | Indoor/Outdoor',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF39D2C0),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button-Reserve pressed ...');
                                    },
                                    text: 'Reserve',
                                    icon: Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 120,
                                      height: 40,
                                      color: Color(0xFF39D2C0),
                                      textStyle: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Text(
                                            '10:00am',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          'Thursday June 22',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xB4FFFFFF),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    height: 184,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.network(
                          'https://images.unsplash.com/photo-1581009137042-c552e485697a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHdvcmtvdXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x65090F13),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Class Name',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    '30m | High Intensity | Indoor/Outdoor',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF39D2C0),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button-Reserve pressed ...');
                                    },
                                    text: 'Reserve',
                                    icon: Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 120,
                                      height: 40,
                                      color: Color(0xFF39D2C0),
                                      textStyle: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Text(
                                            '10:00am',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          'Thursday June 22',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xB4FFFFFF),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
