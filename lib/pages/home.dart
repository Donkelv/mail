import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mail/pages/inboxTabPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final String check = "assets/check.svg";
  final String profile = "assets/profile.png";

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 25.0, top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(check),
                    Padding(
                      padding: EdgeInsets.only(left: 10.5),
                      child: Text(
                        "MailCheck",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 22.0),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            profile,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 46.0, left: 20.0, right: 25.0),
            child: Material(
                color: Colors.transparent,
                child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    unselectedLabelColor: Color(0xFFCBCBCB),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                    indicatorColor: Colors.transparent,
                    tabs: <Widget>[
                      Text(
                        "Inbox",
                      ),
                      Text(
                        "Draft",
                      ),
                      Text(
                        "Sent",
                      ),
                      Text(
                        "Flag",
                      ),
                      Text(
                        "Spam",
                      ),
                    ])),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 25.0,
              ),
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: _tabController,
                children: <Widget>[
                  InboxTab(height: height, width: width),
                  Text("Home"),
                  Text("Home"),
                  Text("Home"),
                  Text("Home"),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Icon(Icons.create, color: Colors.white,),
        backgroundColor: Colors.black,
      ),
    );
  }
}
