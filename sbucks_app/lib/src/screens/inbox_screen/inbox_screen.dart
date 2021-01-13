import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/inbox_screen/inbox_screen_widget/inbox_tracker.dart';

class InboxScreen extends StatefulWidget {
  static const kRouteName = '/inbox';
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('Message'),
              ),
              Tab(
                child: Text('Program Tracker'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Stay tune for exiting offers!'),
            ),
            InboxTracker()
            // Center(
            //   child: Text('Stay tune for exiting offers!'),
            // ),
          ],
        ),
      ),
    );
  }
}
