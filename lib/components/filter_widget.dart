import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(70, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  List<String>? choiceChipsValues1;
  List<String>? choiceChipsValues2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: FFAppState().showFilter,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    setState(() => FFAppState().showFilter = false);
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Filters',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 8),
                      child: Text(
                        'Brands',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: FlutterFlowChoiceChips(
                          initiallySelected: FFAppState().brands,
                          options: [ChipData('Mounir'), ChipData('Truss')],
                          onChanged: (val) async {
                            setState(() => choiceChipsValues1 = val);
                            setState(() => FFAppState().brands =
                                choiceChipsValues1!
                                    .where((e) => e != 'All')
                                    .toList());
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                            iconColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            iconSize: 18,
                            elevation: 0,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Color(0x1C4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                            iconColor: Color(0xFF323B45),
                            iconSize: 18,
                            elevation: 0,
                          ),
                          chipSpacing: 8,
                          multiselect: true,
                          initialized: choiceChipsValues1 != null,
                          alignment: WrapAlignment.start,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 8),
                        child: Text(
                          'Categories',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          child: FlutterFlowChoiceChips(
                            initiallySelected: FFAppState().types,
                            options: [
                              ChipData('Featured'),
                              ChipData('Professional'),
                              ChipData('Shampoo'),
                              ChipData('Conditioner'),
                              ChipData('Treatment'),
                              ChipData('Color'),
                              ChipData('Styling')
                            ],
                            onChanged: (val) async {
                              setState(() => choiceChipsValues2 = val);
                              setState(() => FFAppState().types =
                                  choiceChipsValues2!.toList());
                            },
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 0,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Color(0x1C4B39EF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                              iconColor: Color(0x164B39EF),
                              iconSize: 18,
                              elevation: 0,
                            ),
                            chipSpacing: 8,
                            multiselect: true,
                            initialized: choiceChipsValues2 != null,
                            alignment: WrapAlignment.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
      ),
    );
  }
}
