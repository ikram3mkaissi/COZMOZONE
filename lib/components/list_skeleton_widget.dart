import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListSkeletonWidget extends StatefulWidget {
  const ListSkeletonWidget({Key? key}) : super(key: key);

  @override
  _ListSkeletonWidgetState createState() => _ListSkeletonWidgetState();
}

class _ListSkeletonWidgetState extends State<ListSkeletonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: custom_widgets.ListSkeleton(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
      ),
    );
  }
}
