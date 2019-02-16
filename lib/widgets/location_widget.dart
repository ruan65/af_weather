import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String location;

  const LocationWidget({Key key, @required this.location})
      : assert(null != location),
        super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        location,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      );
}
