import '../components/address_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeAddressWidget extends StatefulWidget {
  const ChangeAddressWidget({Key? key}) : super(key: key);

  @override
  _ChangeAddressWidgetState createState() => _ChangeAddressWidgetState();
}

class _ChangeAddressWidgetState extends State<ChangeAddressWidget> {
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
            Icons.arrow_back_ios,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
          child: Text(
            'Shipping Address',
            style: FlutterFlowTheme.of(context).title2,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: AddressWidget(),
          ),
        ),
      ),
    );
  }
}
