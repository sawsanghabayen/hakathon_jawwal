import 'package:flutter/material.dart';
class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    Key? key,
    required this.isCurrentPage ,
      this.marginEnd = 0,
  }) : super(key: key);
  final bool isCurrentPage;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
       height: 6,
      width: isCurrentPage  ? 25 : 10,
      decoration: BoxDecoration(
          color: isCurrentPage ? Color(0xff03A7A9) : Colors.grey,
          borderRadius: BorderRadius.circular(4)
      ),
    );
  }
}