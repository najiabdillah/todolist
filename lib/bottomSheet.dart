import 'package:flutter/material.dart';

import 'file:///E:/agung/todolist/lib/component/home.dart';
import 'util.dart';

class Modal {
  List<String> subTasks = <String>['Call the restaurant ', 'Ask for the date '];

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height - 80,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height / 25,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(175, 30),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 340,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/fab-delete.png'),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                CustomColors.PurpleLight,
                                CustomColors.PurpleDark,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.PurpleShadow,
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text(
                            'Create new task',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(
                              initialValue: 'What are you planning ?',
                              autofocus: true,
                              style: TextStyle(
                                  fontSize: 22, fontStyle: FontStyle.normal),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Text(
                              'Choose date',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Today, 19:00 - 21:00',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 5),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(Icons.chevron_right),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                              // Navigator.pop(context);
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    CustomColors.BlueLight,
                                    CustomColors.BlueDark,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomColors.BlueShadow,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ],
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Center(
                                child: const Text(
                                  'Create',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
