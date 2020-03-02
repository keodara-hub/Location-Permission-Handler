import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionHandlerWidget extends StatefulWidget {
  final Widget child;

  const PermissionHandlerWidget({Key key, this.child}) : super(key: key);

  @override
  _PermissionHandlerWidgetState createState() =>
      _PermissionHandlerWidgetState();
}

class _PermissionHandlerWidgetState extends State<PermissionHandlerWidget> {
  Timer _timer;
  bool isEnablePermission = false;

  Geolocator geolocator = Geolocator();

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      checkPermission();
    });
    super.initState();

    checkPermission();
  }

  checkPermission() async {
    final result = await geolocator.checkGeolocationPermissionStatus();
    final value = result == GeolocationStatus.granted ||
        result == GeolocationStatus.restricted;

    setState(() {
      isEnablePermission = value;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEnablePermission
        ? PermissionWidget(
            title: 'PERMISSION DENY!',
            subtitle: "",
            btnLabel: 'Got it',
          )
        : widget.child;
  }
}

class PermissionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String btnLabel;

  const PermissionWidget({
    @required this.title,
    @required this.subtitle,
    @required this.btnLabel,
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
            subtitle,
            style: TextStyle(
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () async {},
            child: Text(
              btnLabel,
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
