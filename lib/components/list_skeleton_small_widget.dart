import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListSkeletonSmallWidget extends StatefulWidget {
  const ListSkeletonSmallWidget({Key? key}) : super(key: key);

  @override
  _ListSkeletonSmallWidgetState createState() =>
      _ListSkeletonSmallWidgetState();
}

class _ListSkeletonSmallWidgetState extends State<ListSkeletonSmallWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: custom_widgets.ListSkeletonSmall(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
      ),
    );
  }
}
