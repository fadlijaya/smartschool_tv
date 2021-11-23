import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartschool_tv/lib/zoom_view.dart';
import 'package:smartschool_tv/lib/zoom_options.dart';

// ignore: must_be_immutable
class MeetingWidget extends StatelessWidget {

  late ZoomOptions zoomOptions;
  late ZoomMeetingOptions meetingOptions;

  late Timer timer;

  MeetingWidget({Key? key, userId, meetingId, meetingPassword}) : super(key: key) {
    zoomOptions = ZoomOptions(
      domain: "zoom.us",
      appKey: "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I",
      appSecret: "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb",
    );
    meetingOptions = ZoomMeetingOptions(
        userId: userId, //pass username for join meeting only
        meetingId: meetingId, //pass meeting id for join meeting only
        meetingPassword: meetingPassword,
        //jwtAPIKey: ,
        //jwtSignature: , //pass meeting password for join meeting only
        disableDialIn: "true",
        disableDrive: "true",
        disableInvite: "true",
        disableShare: "true",
        disableTitlebar: "false",
        viewOptions: "true",
        noAudio: "false",
        noDisconnectAudio: "false"
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

              controller.joinMeeting(meetingOptions)
                  .then((joinMeetingResult) {

                timer = Timer.periodic(const Duration(seconds: 2), (timer) {
                  controller.meetingStatus(meetingOptions.meetingId!)
                      .then((status) {
                    // ignore: avoid_print
                    print("Meeting Status Polling: " + status[0] + " - " + status[1]);
                  });
                });

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
