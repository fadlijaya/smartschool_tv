import 'dart:async';
import 'dart:io';

import 'package:smartschool_tv/lib/zoom_options.dart';

import 'package:flutter/material.dart';
import 'package:smartschool_tv/lib/zoom_view.dart';

// ignore: must_be_immutable
class StartMeetingWidget extends StatefulWidget {

  late ZoomOptions zoomOptions;
  late ZoomMeetingOptions loginOptions;


  StartMeetingWidget({Key? key, meetingId}) : super(key: key) {
    zoomOptions = ZoomOptions(
      domain: "zoom.us",
      appKey: "apiKey",
      appSecret: "appSecret",
    );
    loginOptions = ZoomMeetingOptions(
        userId: 'username', //pass host email for zoom
        meetingPassword: 'pass', //pass host password for zoom
        disableDialIn: "false",
        disableDrive: "false",
        disableInvite: "false",
        disableShare: "false",
        disableTitlebar: "false",
        viewOptions: "false",
        noAudio: "false",
        noDisconnectAudio: "false"
    );
  }

  @override
  _StartMeetingWidgetState createState() => _StartMeetingWidgetState();
}

class _StartMeetingWidgetState extends State<StartMeetingWidget> {
  late Timer timer;

  bool _isMeetingEnded(String status) {
    var result = false;

    if (Platform.isAndroid) {
      result = status == "MEETING_STATUS_DISCONNECTING" || status == "MEETING_STATUS_FAILED";
    } else {
      result = status == "MEETING_STATUS_IDLE";
    }

    return result;
  }

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
          title: const Text('Loading meeting '),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            _isLoading ? const CircularProgressIndicator() : Container(),
            Expanded(
              child: ZoomView(onViewCreated: (controller) {

                // ignore: avoid_print
                print("Created the view");

                controller.initZoom(widget.zoomOptions)
                    .then((results) {
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

                    controller.login(widget.loginOptions).then((loginResult) {
                      // ignore: avoid_print
                      print("LoginResultBool :- " + loginResult.toString());
                      if(loginResult){
                        // ignore: avoid_print
                        print("LoginResult :- Logged In");
                        setState(() {
                          _isLoading = false;
                        });
                      }else{
                        // ignore: avoid_print
                        print("LoginResult :- Logged In Failed");
                      }
                    });
                  }

                }).catchError((error) {
                  // ignore: avoid_print
                  print(error);
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}