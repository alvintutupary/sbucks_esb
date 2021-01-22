import 'package:flutter/material.dart';
import 'package:sbucks/src/models/program_tracker_model.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_spacer.dart';

class InboxTrackerDetail extends StatefulWidget {
  final ProgramTrackerModel data;
  InboxTrackerDetail(this.data);
  @override
  _InboxTrackerDetailState createState() => _InboxTrackerDetailState();
}

class _InboxTrackerDetailState extends State<InboxTrackerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Tracker'),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(widget.data.image))),
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(widget.data.currentScore == widget.data.maxScore
                    ? "Congrats! You've got a free item! Check your Rewards now!"
                    : "${widget.data.maxScore - widget.data.currentScore} more to go"),
                AppSpacer.vSpacing(10),
                _buildCustomWidget(Color(0xFFD0A765), widget.data.currentScore,
                    widget.data.maxScore),
                AppSpacer.vSpacing(10),
                Row(
                  children: [
                    Text(
                      'Hi Fendy,',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.scs),
                    )
                  ],
                ),
                AppSpacer.vSpacing(5),
                Text(
                    'Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here Description Here '),
                AppSpacer.vSpacing(10),
                FlatButton(
                  onPressed: () {
                    // widget.tabController.animateTo(2);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'View More',
                      style: TextStyle(color: Colors.white, fontSize: 15.scs),
                    ),
                  ),
                  color: Colors.greenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    // side: BorderSide(color: Colors.red),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildCustomWidget(Color color, double currentScore, double maxScore) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: color, spreadRadius: 3),
          ],
        ),
        // height: 100.sch,
        // width: 400.scw,
        // width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.star,
                      size: 20.scs,
                      color: color,
                    ),
                    Icon(
                      Icons.star,
                      size: 30.scs,
                      color: color,
                    ),
                    Icon(
                      Icons.star,
                      size: 20.scs,
                      color: color,
                    ),
                  ],
                ),
                _buildCustomDivider(3.sch, 100.scw, color),
                Container(
                  width: 100.scw,
                  child: Text('${currentScore.toInt()}/${maxScore.toInt()}',
                      style: TextStyle(
                          fontSize: 40.scs,
                          fontWeight: FontWeight.bold,
                          color: color),
                      textAlign: TextAlign.center),
                )
              ],
            ),
            _buildCustomDivider(100.sch, 3.scw, color),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buy 1X',
                    style: TextStyle(color: color),
                  ),
                  Text('Get 1 Beverage Reward', style: TextStyle(color: color)),
                  AppSpacer.vSpacing(10),
                  Center(
                    child: _linierIndicator(
                        color,
                        widget.data.currentScore / widget.data.maxScore,
                        20.sch,
                        200.scw),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  _buildCustomDivider(double height, double width, Color color) => SizedBox(
        height: height,
        width: width,
        child: new Center(
          child: new Container(
            color: color,
          ),
        ),
      );
  _linierIndicator(Color color, double value, double height, double width) =>
      Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: LinearProgressIndicator(
                value: value,
                valueColor: new AlwaysStoppedAnimation<Color>(color),
                backgroundColor: color.withOpacity(.5),
                minHeight: height,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.data.currentScore.toInt()} of ${widget.data.maxScore.toInt()}',
                  style: TextStyle(fontSize: height * 0.8, color: Colors.white),
                ),
                Icon(
                  Icons.star,
                  size: height * 0.8,
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      );
}
