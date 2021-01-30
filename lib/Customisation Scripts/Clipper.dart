import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper <Path> {
  //CustomClipper est le clipper de ClipPath 
  @override 
  //création clipper 
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50); 
     path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }  
  @override 
  bool shouldReclip (CustomClipper <Path> oldClipper) => false;
}

//class ClipShadowPath qui prendra en clipper  CircularClipper
class ClipShadowPath extends StatelessWidget {
  //le constructeur
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;
//initialiser ces valeurs
ClipShadowPath({
  @required this.shadow, 
  @required this.clipper,
  @required this.child, 
});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //permet de passer un painter qui q on clipper (CustomClipper<Path>)
      painter:  _ClipShadowShadowPainter(
        clipper: this.clipper, 
        shadow: this.shadow,
      ), 
      //child ClipPath car  CircularClipper est un CustomClipper
      child: ClipPath(child: child, clipper: this.clipper),
      
    );
  }
}
//class privée CustomPainter

class _ClipShadowShadowPainter extends CustomPainter {
  //le constructeur 
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  //initialiser ces valeurs
  _ClipShadowShadowPainter ({
    @required this.shadow, 
    @required this.clipper,
  });

  @override 
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }
  @override 
  bool shouldRepaint (CustomPainter oldDelegate) {
    return true;
  }

}