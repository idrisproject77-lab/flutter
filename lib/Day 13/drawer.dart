import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2011/routing.dart';
import 'package:flutter_application_1/Day%2013/checkbox.dart';
import 'package:flutter_application_1/Day%2015/liat_of_map.dart';
import 'package:flutter_application_1/Day%2015/list.dart';
import 'package:flutter_application_1/Day%2015/list_model.dart';
import 'package:flutter_application_1/Day%2015/list_model_idris.dart';
import 'package:flutter_application_1/Day%2015/tugasListData.dart';
import 'package:flutter_application_1/Day%2015/tugas_list_map.dart';
import 'package:flutter_application_1/Day%2016/Tugas%2010/register_page.dart';
import 'package:flutter_application_1/Day%2016/text_form_field.dart';
import 'package:flutter_application_1/Day%2017/Tugas%2011/service/logOut.dart';
import 'package:flutter_application_1/Day%2018/views/data_user.dart';
import 'package:flutter_application_1/Day%208/gridview.dart';
import 'package:flutter_application_1/Day%208/singlechillscrollview.dart';

class DrawerDay13 extends StatefulWidget {
  const DrawerDay13({super.key});

  @override
  State<DrawerDay13> createState() => _DrawerDay13State();
}

class _DrawerDay13State extends State<DrawerDay13> {
  int _selectedBottom = 0;

  void changeBottom(int index) {
    _selectedBottom = index;
    print("Ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOptions = [
    GridviewDay8(),
    SinglechillscrollviewDay8(),
    InputWidgetDay13(),
    RoutingDay11(),
    ListDataDay15(),
    ListOfMapDay15(),
    ListOfModelDay15(),
    TugaslistdataIdris(),
    TugasListMapIdris(),
    TugasModelIdris(),
    TextFormFieldDay16(),
    RegisterPageIdris(),
    LogoutTugas11(),
    DataUserDay18(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(),

      appBar: AppBar(title: Text("Welcome Back")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text("business"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text("Input Data"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('School'),
              onTap: () {
                changeBottom(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('apa aja1'),
              onTap: () {
                changeBottom(4);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('ListOfMapDay15'),
              onTap: () {
                changeBottom(5);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('ListOfModelDay15'),
              onTap: () {
                changeBottom(6);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('TugaslistdataIdris'),
              onTap: () {
                changeBottom(7);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('TugasListMapIdris'),
              onTap: () {
                changeBottom(8);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('TugasModelIdris'),
              onTap: () {
                changeBottom(9);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('TextFormFieldDay16'),
              onTap: () {
                changeBottom(10);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text(' RegisterPageIdris'),
              onTap: () {
                changeBottom(11);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text(' LogOUt'),
              onTap: () {
                changeBottom(12);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('DataUserDay18'),
              onTap: () {
                changeBottom(13);
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedBottom),
    );
  }
}
