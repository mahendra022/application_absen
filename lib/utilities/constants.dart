import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final categoryBox1 = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: Colors.red[400],
);

final categoryBox2 = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: Colors.amber,
);

final categoryBox3 = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: Colors.greenAccent,
);

final categoryBox4 = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: Colors.blueGrey,
);
