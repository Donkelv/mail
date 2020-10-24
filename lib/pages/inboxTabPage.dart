import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InboxTab extends StatefulWidget {
  final double height, width;
  InboxTab({this.height, this.width});
  @override
  _InboxTabState createState() => _InboxTabState();
}

class _InboxTabState extends State<InboxTab> {
  var _listItems = <Map<String, dynamic>>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void fetchList() {
    List<Map<String, dynamic>> _list = [
      {
        "icon": "assets/mask",
        "format": ".svg",
        "company": "Rootsdigital",
        "message": "End Of Year Party",
        "underMessage":
            "Invitation and ticket to mid year party at Kempiski Hotel",
        "companyWordMark": null,
        "companyWordMarkLogo": null,
        "date": "09.07.2020",
        "attachment": "2",
        "type": "Update",
      },
      {
        "icon": "assets/videoCamWhite",
        "format": ".svg",
        "company": "Zoom",
        "message": "Morning Stand Up",
        "underMessage": "Mornining Stand-up 9:00am",
        "companyWordMark": "Zoom Call",
        "companyWordMarkLogo": "assets/videoCam.svg",
        "date": "09.07.2020",
        "attachment": null,
        "type": "Meeting",
      },
      {
        "icon": "assets/vodaFone",
        "format": ".png",
        "company": "Vodafone GH",
        "message": "Broadband Service",
        "underMessage": "Your fibre broadband bundle due, please renew your ...",
        "companyWordMark": null,
        "companyWordMarkLogo": null,
        "date": "09.07.2020", 
        "attachment": "2",
        "type": "Update",
      },
      {
        "icon": "assets/adobe",
        "format": ".png",
        "company": "Adobe",
        "message": "Invite",
        "underMessage": "Invitation to joining co-editing",
        "companyWordMark": null,
        "companyWordMarkLogo": null,
        "date": "09.07.2020", 
        "attachment": null,
        "type": "Update",
      },
      {
        "icon": "assets/profile2",
        "format": ".png",
        "company": "Dan",
        "message": "Design Files",
        "underMessage": "Here are the latest update of the designs",
        "companyWordMark": null,
        "companyWordMarkLogo": null,
        "date": "09.07.2020", 
        "attachment": "4",
        "type": "Update",
      }
    ];

    var future = Future(() {});
    for (var i = 0; i < _list.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 200), () {
          _listItems.add(_list[i]);
          _listKey.currentState.insertItem(_listItems.length - 1);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      padding: EdgeInsets.only(bottom: 100.0),
      key: _listKey,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      initialItemCount: _listItems.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position:
              CurvedAnimation(curve: Curves.easeIn, parent: animation).drive(
            (Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            )),
          ),
          child: ListWidget(list: _listItems[index]),
        );
      },
    );
  }
}

class ListWidget extends StatelessWidget {
  final Map list;
  ListWidget({this.list});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 32.0,
                    width: 32.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: list['company'] == "Zoom"
                          ? Color(0xFF006CFF)
                          : Colors.transparent,
                      //image: DecorationImage(image: list['format'] == ".png" ? AssetImage("${list['icon']}.png") : SvgPicture.asset("${list['icon']}.svg"),),
                    ),
                    child: list['format'] == ".png"
                        ? Image.asset("${list['icon']}.png", fit: BoxFit.scaleDown)
                        : SvgPicture.asset(
                            "${list['icon']}.svg",
                            height: 1.0,
                            width: 2.0,
                            color: list['company'] == "Zoom"
                                ? Colors.white
                                : Color(0xff2196f3),
                            fit: BoxFit.scaleDown,
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 7.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "From ",
                          style: TextStyle(
                            color: Color(0xFFA3A3A3),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${list['company']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  //right: 22.0,
                ),
                child: Container(
                  width: 77.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFFECED0),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Center(
                    child: Text(
                      "${list['date']}",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0xFFE51F26),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "${list['message']}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "${list['underMessage']}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: list['companyWordMark'] == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      list['attachment'] == null
                          ? Row(
                            children: <Widget>[
                              Text("${list['type']} ", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 12.0,),),
                              Container(
                                  height: 17.37,
                                  width: 22.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFEFEF),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 10.0,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          )
                          : Row(
                            children: <Widget>[
                              Text("${list['type']} ", style: TextStyle(color: Color(0xFFA3A3A3), fontSize: 12.0,),),
                              Container(
                                height: 20.0,
                                width: 50.41,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFEFEF),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${list['attachment']} ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Icon(Icons.attach_file,
                                        color: Colors.black, size: 12.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Icon(Icons.star, color: Colors.black, size: 12.0),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                    ],
                  )
                : list['attachment'] == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                list['companyWordMarkLogo'],
                                color: Color(0xff006CFF),
                                fit: BoxFit.scaleDown,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "${list['companyWordMark']}",
                                  style: TextStyle(
                                    color: Color(0xff006CFF),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 17.37,
                            width: 22.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Center(
                              child: Icon(Icons.star, color: Colors.black, size: 12.0)
                            ),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                list['companyWordMarkLogo'],
                                color: Color(0xff006CFF),
                                fit: BoxFit.scaleDown,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "${list['companyWordMark']}",
                                  style: TextStyle(
                                    color: Color(0xff006CFF),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20.0,
                            width: 43.41,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${list['attachment']} ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Icon(Icons.attach_file,
                                    color: Colors.black, size: 4.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.0),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 10.0,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          ),
          
        ],
      ),
    );
  }
}
