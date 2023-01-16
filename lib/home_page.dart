import 'package:flutter/material.dart';
import 'package:myapp_fln/destination_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  showSimpleNotification() async {
    var androidDetails = const AndroidNotificationDetails('id', 'channel ',
        priority: Priority.high, importance: Importance.max);
    // const IOSNotificationDetails iOSDetails = IOSNotificationDetails();
    var platformDetails = NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'Flutter Local Notification', 'Flutter Simple Notification', platformDetails,
        payload: 'Destination Screen (Simple Notification)');
  }

  @override
  void initState() {
    super.initState();
    var androidSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initSetttings = InitializationSettings(android: androidSettings);
    flutterLocalNotificationsPlugin.initialize(initSetttings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DestinationScreen(payload: "payload"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showSimpleNotification,
        tooltip: 'Show',
        child: const Icon(Icons.add),
      ),
    );
  }
}
