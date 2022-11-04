import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyWidgetCopyWidget extends StatefulWidget {
  const EmptyWidgetCopyWidget({Key? key}) : super(key: key);

  @override
  _EmptyWidgetCopyWidgetState createState() => _EmptyWidgetCopyWidgetState();
}

class _EmptyWidgetCopyWidgetState extends State<EmptyWidgetCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite_border,
          color: FlutterFlowTheme.of(context).alternate,
          size: 90,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nothing in your wishlist',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title3,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                  child: Text(
                    'Browse our collections to find items you like.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: FFButtonWidget(
            onPressed: () async {
              context.pushNamed('HomePage');

              await Future.delayed(const Duration(milliseconds: 2000));
            },
            text: 'Browse Products',
            options: FFButtonOptions(
              width: 170,
              height: 50,
              color: FlutterFlowTheme.of(context).primaryColor,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
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
    );
  }
}
