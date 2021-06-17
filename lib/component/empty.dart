import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:todolist/appBars.dart';
import 'package:todolist/ProfileModel.dart';
import 'package:todolist/bottomNavigation.dart';
import 'package:todolist/fab.dart';
import '../util.dart';

class Empty extends StatefulWidget {
  Empty({Key key}) : super(key: key);

  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  Future<ProfileModel> listprofile;

  Future<ProfileModel> getProfile() async {
    //fetch data from api

    var dio = Dio();
    Response response =
    await dio.get('https://randomuser.me/api/');
    print(response.data);
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    listprofile = getProfile();
  }
  var bottomNavigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppbar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: <Widget>[

              Expanded(
                flex: 8,
                child: Hero(
                  tag: 'Clipboard',
                  child: Image.asset('assets/images/Clipboard-empty.png'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Text(
                      'No tasks',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.TextHeader),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'You have no tasks to do.',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.TextBody,
                          fontFamily: 'opensans'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFab(context),
      bottomNavigationBar: BottomNavigationBarApp(context, bottomNavigationBarIndex),
    );
  }
}
