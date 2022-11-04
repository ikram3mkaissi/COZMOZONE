import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassDetailPageWidget extends StatefulWidget {
  const ClassDetailPageWidget({Key? key}) : super(key: key);

  @override
  _ClassDetailPageWidgetState createState() => _ClassDetailPageWidgetState();
}

class _ClassDetailPageWidgetState extends State<ClassDetailPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1618220179428-22790b461013?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGhvbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Text(
                      'Mounir Master Class',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: Text(
                      'City, State',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          width: double.infinity,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          child: ExpandableNotifier(
                            initialExpanded: false,
                            child: ExpandablePanel(
                              header: Text(
                                'Description',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              collapsed: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing...',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 12),
                    child: Text(
                      'Specifications',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).grayIcon,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 24),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          constraints: BoxConstraints(
                            maxWidth: 110,
                          ),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.single_bed_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 36,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '5',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    '# Rooms',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 120,
                          constraints: BoxConstraints(
                            maxWidth: 110,
                          ),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bathtub_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 36,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '3.5',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    '# bathrooms',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 120,
                          constraints: BoxConstraints(
                            maxWidth: 110,
                          ),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.legend_toggle_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 36,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '4,302',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    'Square Feet',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 4),
                    child: Text(
                      'Venue',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).grayIcon,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Color(0x32000000),
                  offset: Offset(0, -2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '\$156',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'joane',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Per Session',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Add to Cart',
                    options: FFButtonOptions(
                      width: 160,
                      height: 50,
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
