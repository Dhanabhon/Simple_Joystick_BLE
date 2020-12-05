import 'package:flutter/material.dart';

class PopupShaped extends StatelessWidget {
  PopupShaped({this.onlyTop = false});

  final double padding = 4.0;
  final bool onlyTop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: PopupShapedBorder(padding: padding, borderRadius: BorderRadius.all(Radius.circular(padding))),
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(padding).copyWith(bottom: padding * 2),
          child: onlyTop ? SizedBox(
            width: 150.0,
            height: 20.0,
          ) : SizedBox(
            width: 150.0,
            height: 250.0,
            child: Center(
              child: Text(
                'ShapedWidget'
              ),
            ),
          )
        ),
      ),
    );
  }
}

class PopupShapedBorder extends RoundedRectangleBorder {
  final double padding;

  PopupShapedBorder({
    @required this.padding,
    side = BorderSide.none,
    borderRadius = BorderRadius.zero,
  }) : super(side: side, borderRadius: borderRadius);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.width - 8.0 , rect.top)
      ..lineTo(rect.width - 20.0, rect.top - 16.0)
      ..lineTo(rect.width - 32.0, rect.top)
      ..addRRect(borderRadius
          .resolve(textDirection)
          .toRRect(Rect.fromLTWH(rect.left, rect.top, rect.width, rect.height - padding)));
  }
}
