import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class PermissionWidget extends StatelessWidget {
  final String title;
  const PermissionWidget({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 25.0, color: Theme.of(context).primaryColor),
          ),
          Text(
            'Please turn on Location Services. For the best experience, please set it to Hight Accuracy',
            style: TextStyle(
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () => AppSettings.openLocationSettings(),
            child: Text(
              'GOT IT',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
