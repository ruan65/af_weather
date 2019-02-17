import 'package:flutter/material.dart';

class LastUpdatedWidget extends StatelessWidget {
  final DateTime dateTime;

  const LastUpdatedWidget({Key key, @required this.dateTime})
      : assert(null != dateTime),
        super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        'Updated: ${TimeOfDay.fromDateTime(dateTime)}',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      );
}
