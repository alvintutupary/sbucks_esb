import 'package:flutter/material.dart';
import 'package:sbucks/src/screens/premium_screen/premium_screen_widgets/premium_photo_id.dart';
import 'package:sbucks/src/screens/premium_screen/premium_screen_widgets/premium_review.dart';
import 'package:sbucks/src/screens/premium_screen/premium_screen_widgets/premium_selfie_id.dart';
import 'package:sbucks/src/utils/size_config.dart';

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Starbucks Premium',
              style: TextStyle(color: Colors.black, fontSize: 25.scs),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/img/menu-m-1.jpg'))),
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width,
            ),
            Text("WHAT IS STARBUCKS PREMIUM?",
                style: TextStyle(fontSize: 20.scs)),
            Text(
              '''
      Starbucks Premium allows you to have more
      flexibility. Maximum allowed balance will be
      miltiplied 5x to Rp 10 million.
       ''',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.scs),
            ),
            Text("PREPARE YOUR ID CARD", style: TextStyle(fontSize: 20.scs)),
            RaisedButton(
              child: Text('START'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PremiumTabsView()));
              },
            )
          ],
        ));
  }
}

class PremiumTabsView extends StatefulWidget {
  @override
  _PremiumTabsViewState createState() => _PremiumTabsViewState();
}

class _PremiumTabsViewState extends State<PremiumTabsView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String photoIdPath, selfieIdPath;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: _tabController,
            // isScrollable: true,
            labelColor: Color(0xff006442),
            indicatorColor: Color(0xff006442),
            tabs: [
              InkWell(
                child: Tab(text: 'ID Photo'),
                onTap: () {
                  return;
                },
              ),
              InkWell(
                child: Tab(text: 'Selfie With ID'),
                onTap: () {
                  return;
                },
              ),
              InkWell(
                child: Tab(text: 'Review'),
                onTap: () {
                  return;
                },
              ),
            ],
          ),
          title: Text(
            'Starbucks Card',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            PremiumPhotoId(
              tabController: _tabController,
            ),
            PremiumSelfieId(
              tabController: _tabController,
            ),
            PremiumReview(
              photoIdPath,
              selfieIdPath,
            ),
          ],
        ),
      ),
    );
  }
}
