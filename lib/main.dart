import 'package:doctor_list/consts/images.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DoctorList(),
    );
  }
}

class Patient {
  String firstName;
  String lastName;
  String diagnosis;
  String? icon;
  String time;

  Patient(
      {required this.firstName,
      required this.lastName,
      required this.diagnosis,
      required this.time,
      this.icon});
}

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  DateTime today = DateTime.now();
  List dumyData = [
    Patient(
        firstName: 'Mark',
        lastName: 'O.',
        diagnosis: 'cold',
        time: 'today',
        icon: ProfileImage.man),
    Patient(
        firstName: 'Jack',
        lastName: 'H.',
        diagnosis: 'flu',
        time: 'tomorrow',
        icon: ProfileImage.suitMan),
    Patient(
        firstName: 'Elie',
        lastName: 'S.',
        diagnosis: 'hiv',
        time: 'today',
        icon: ProfileImage.woman),
    Patient(
        firstName: 'Samantha',
        lastName: 'O.',
        diagnosis: 'juka',
        time: 'tomorrow',
        icon: ProfileImage.womanLongHair),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(image: AssetImage(ProfileImage.logo)),
        title: Text(
          'ProductArena',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: ListTile(
                leading:
                    CircleAvatar(backgroundImage: AssetImage(ProfileImage.man)),
                //ovjde stavis sliku doktora
                // alignment: Alignment.centerRight,
                // icon: Icon(Icons.arrow_forward_ios),
                // iconSize: 20,

                title: Text("Doctor Joe")),
          ),
          Expanded(
            child: GroupedListView<dynamic, dynamic>(
                elements: dumyData,
                groupBy: (element) => element.time,

                // groupComparator: (value1, value2) =>
                //     value2.compareTo(value1),
                // itemComparator: (item1, item2) =>
                //     item1['term'].compareTo(item2['term']),
                // order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                groupSeparatorBuilder: (dynamic value) => Container(
                      height: 40,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              value,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),

                // ListView.builder(
                //     itemCount: _foundTerms.length,
                itemBuilder: (context, element) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                    child: Container(
                      height: 50,
                      decoration: new BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0, color: Colors.grey))),
                      child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(element.icon)),

                          // alignment: Alignment.centerRight,
                          // icon: Icon(Icons.arrow_forward_ios),
                          // iconSize: 20,

                          title: Text(element.firstName)),
                      // ListTile(
                      //     trailing: IconButton(
                      //       alignment: Alignment.centerRight,
                      //       icon: Icon(Icons.arrow_forward_ios),
                      //       iconSize: 20,
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => TermDetails(
                      //                     term: _foundTerms[index]
                      //                         ['term'],
                      //                     description: _foundTerms[index]
                      //                         ['definition'])));
                      //       },
                      //     ),
                      //     title: Text(_foundTerms[index]['term'] +
                      //         '  ' +
                      //         _foundTerms[index]['group'])),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
