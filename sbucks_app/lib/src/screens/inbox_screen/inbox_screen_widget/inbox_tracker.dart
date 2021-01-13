import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sbucks/src/models/menu_model.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sbucks/src/models/program_tracker_model.dart';
import 'package:sbucks/src/screens/inbox_screen/inbox_screen_widget/inbox_tracker_detail.dart';

class InboxTracker extends StatefulWidget {
  static final kRouteName = '/InboxTracker';
  @override
  _InboxTrackerState createState() => _InboxTrackerState();
}

class _InboxTrackerState extends State<InboxTracker> {
  final data = List<ProgramTrackerModel>()
    ..add(ProgramTrackerModel('assets/img/new-track-image-1.JPG', 1, 1, 1, 3,
        'String description', 'String link'))
    ..add(ProgramTrackerModel('assets/img/new-track-image-2.JPG', 2, 2, 5, 10,
        'String description', 'String link'))
    ..add(ProgramTrackerModel('assets/img/new-track-image-3.JPG', 3, 1, 3, 4,
        'String description', 'String link'));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => _buildTrackerList(
            data[index],
            () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => InboxTrackerDetail(data[index])))),
      ),
    );
  }

  _buildTrackerList(
    ProgramTrackerModel data,
    Function onPressed,
  ) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(data.image))),
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(
            color: Colors.white,
            child: Text('Find Out More'),
            onPressed: onPressed,
          ),
        ),
      );
}
