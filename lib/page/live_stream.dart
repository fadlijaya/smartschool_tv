import 'dart:async';
import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartschool_tv/page/live_stream_widget/meeting_widget.dart';

class LiveStream extends StatefulWidget {
  const LiveStream({
    Key? key,
  }) : super(key: key);

  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  final StreamController<List> _streamController = StreamController<List>();
  var apiKey = 'XnBuR0XxS0G5sNuydUl35g';
  String? idGuru;
  String? namaGuru;

  Future getDataLiveStream() async {
    var baseURL = Uri.parse('https://sekolahandalan.id/db_live_stream.php');
    final response = await http.get(baseURL);
    var data = json.decode(response.body);
    _streamController.add(data);
  }

  getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idGuru = preferences.getString('id_guru');
      namaGuru = preferences.getString('nama_guru');
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLiveStream();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder(
          stream: _streamController.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error!'),
              );
            } else if (snapshot.hasData && snapshot.data.isNotEmpty) {
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 240),
                child: ListView(
                  children: [
                    for (Map document in snapshot.data)
                      idGuru == document['id_guru']
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Jadwal pelajaran : ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Flexible(
                                  child: Text(document['namamatapelajaran'])),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Text('Kelas : ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(document['nama_kelas']),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              var meetingId = document['meeting_id'];
                              var meetingPassword = document['passcode'];
                              joinMeeting(context, meetingId, meetingPassword);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  'Sedang Berlangsung',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Container()
                  ],
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/ilustrasi_no_live_stream.svg',
                    width: 140,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Center(
                    child: Text('Belum Ada Jadwal Pelajaran Live Tersedia'),
                  ),
                ],
              );
            }
          }),
    );
  }

  joinMeeting(BuildContext context, meetingId, meetingPassword) {
    if (meetingId.isNotEmpty && meetingPassword.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MeetingWidget(
                userId: namaGuru,
                meetingId: meetingId,
                meetingPassword: meetingPassword);
          },
        ),
      );
    } else {
      if (meetingId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter a valid meeting id to continue."),
        ));
      } else if (meetingPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter a meeting password to start."),
        ));
      }
    }
  }
}
