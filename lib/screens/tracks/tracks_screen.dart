import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/screens/tracks/model/tracks_model.dart';

class TracksScreen extends StatefulWidget {
  const TracksScreen({super.key});

  @override
  State<TracksScreen> createState() => _TracksScreenState();
}

class _TracksScreenState extends State<TracksScreen> {

  late var getTracks;

  @override
  void initState() {
    super.initState();
    getTracks = getAllTracks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TracksModel?>(
        future: getTracks,
        builder: (context, snapshot) {
          var futureData = snapshot.data;
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var tractData = snapshot.data!.tracks![index].album!.artists![index];
              var trackImg = snapshot.data!.tracks![index].album!.images![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${trackImg.url}"),
                ),
                title: Text("${tractData.name}"),
                subtitle: Text("${tractData.uri}"),
              );
            }, itemCount: snapshot.data!.tracks!.length,
          );
        },
      ),
    );
  }

  Future<TracksModel?>getAllTracks() async {
    String trackApi = "https://spotify23.p.rapidapi.com/tracks/?ids=4WNcduiCmDNfmTEz7JvmLv";
    final response= await http.get(Uri.parse(trackApi),
        headers: {
          'X-RapidAPI-Key': '4ac39c02d7mshf4f8ef0dd3352e0p116201jsn1f086f75181a',
          'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
        }
    );
    if(response.statusCode == 200){
      Map<String, dynamic> resData = jsonDecode(response.body);
      log(resData.toString());
      TracksModel tracks = TracksModel.fromJson(resData);
      log(tracks.toString());
      return tracks;
    } else {
      log("error occured");
    }
  }

}
