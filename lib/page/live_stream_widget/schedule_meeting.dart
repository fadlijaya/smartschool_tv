import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartschool_tv/lib/zoom_view.dart';
import 'package:smartschool_tv/lib/zoom_options.dart';

// ignore: must_be_immutable
class ScheduleMeeting extends StatelessWidget {

  late ZoomOptions zoomOptions;
  late ZoomScheduleOptions meetingOptions;

  late Timer timer;

  ScheduleMeeting({Key? key, meetingId, meetingPassword}) : super(key: key) {
    zoomOptions = ZoomOptions(
      domain: "zoom.us",
      appKey: "apiKey",
      appSecret: "appSecret",
    );
    meetingOptions = ZoomScheduleOptions(
      setMeetingTopic: "New Meeting",
      canJoinBeforeHost: "true",
      setPassword: "insanity6767",
      setHostVideoOff: "false",
      setAttendeeVideoOff: "false",
      setEnableMeetingToPublic: "false",
      setEnableLanguageInterpretation: "true",
      setEnableWaitingRoom: "true",
      enableAutoRecord: "false",
      autoLocalRecord: "false",
      autoCloudRecord: "false",
    );
  }

  bool _isMeetingEnded(String status) {
    var result = false;

    if (Platform.isAndroid) {
      result = status == "MEETING_STATUS_DISCONNECTING" || status == "MEETING_STATUS_FAILED";
    } else {
      result = status == "MEETING_STATUS_IDLE";
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading meeting '),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ZoomView(onViewCreated: (controller) {

            // ignore: avoid_print
            print("Created the view");

            controller.initZoom(zoomOptions)
                .then((results) {

              // ignore: avoid_print
              print("initialised");
              // ignore: avoid_print
              print(results);

              if(results[0] == 0) {

                controller.zoomStatusEvents.listen((status) {
                  // ignore: avoid_print
                  print("Meeting Status Stream: " + status[0] + " - " + status[1]);
                  if (_isMeetingEnded(status[0])) {
                    Navigator.pop(context);
                    timer.cancel();
                  }
                });

                // ignore: avoid_print
                print("listen on event channel");

                controller.scheduleMeeting(meetingOptions)
                    .then((scheduleMeetingResult) {
                      // if(scheduleMeetingResult){
                      //   Navigator.pop(context);
                      //   print("Success Scheduled");
                      // }else{
                      //   Navigator.pop(context);
                      //   print("User not logged in");
                      // }

                });
              }

            }).catchError((error) {

              // ignore: avoid_print
              print("Error");
              // ignore: avoid_print
              print(error);
            });
          })
      ),
    );
  }

}