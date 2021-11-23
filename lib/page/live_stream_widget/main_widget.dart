import 'package:flutter/material.dart';
import 'package:smartschool_tv/page/live_stream_widget/join_widget.dart';
import 'package:smartschool_tv/page/live_stream_widget/meeting_widget.dart';
import 'package:smartschool_tv/page/live_stream_widget/schedule_meeting.dart';
import 'package:smartschool_tv/page/live_stream_widget/start_meeting.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({ Key? key }) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: const [],
      initialRoute: '/',
      routes: {
        '/': (context) => const JoinWidget(),
        '/meeting': (context) => MeetingWidget(),
        '/startmeeting': (context) => StartMeetingWidget(),
        '/schedule': (context) => ScheduleMeeting(),
      },
    );
  }
}