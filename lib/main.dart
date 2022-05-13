import 'package:booking_app/horizontal_time_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Helvetica Neue",
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Booking",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Helvetica Neue",
          ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pinkAccent, Colors.orangeAccent],
                    begin: FractionalOffset(0.0, 1.0),
                    end: FractionalOffset(1.0, 1.0),
                    stops: [0.2, 1.5],
                    tileMode: TileMode.clamp),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Geetanjali beauty salon",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Mumbai, Maharashtra, India",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Geetanjali Salon was co-founded by Mr. Prem Israni and Mrs.Neetu Israni in 1989 in Green Park, South Delhi, with the aim of providing world-class salon experiene to clients.The legay is...",
                    style: TextStyle(
                        fontSize: 12, color: Colors.white, height: 1.5),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                child: const Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Helvetica Neue",
                  ),
                )),
            HorizontalTimePicker(
              key: UniqueKey(),
              startTimeInHour: 9,
              endTimeInHour: 24,
              dateForTime: DateTime.now(),
              selectedTimeTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 13,
                height: 1.0,
              ),
              timeTextStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 13,
                height: 1.0,
              ),
              defaultDecoration: BoxDecoration(
                color: Colors.white,
                border: Border.fromBorderSide(BorderSide(
                  color: Colors.green[500]!,
                  width: 2,
                  style: BorderStyle.solid,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              selectedDecoration: const BoxDecoration(
                color: Colors.black,
                border: Border.fromBorderSide(BorderSide(
                  color: Color.fromARGB(255, 151, 151, 151),
                  width: 1,
                  style: BorderStyle.solid,
                )),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              disabledDecoration: BoxDecoration(
                color: Colors.grey.shade300,
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                )
                ],
                border: Border.fromBorderSide(BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                  style: BorderStyle.solid,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              showDisabled: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                child: const Text(
                  "Tomorrow",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            HorizontalTimePicker(
              key: UniqueKey(),
              startTimeInHour: 9,
              endTimeInHour: 24,
              dateForTime: DateTime.now().add(const Duration(days: 1)),
              selectedTimeTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 13,
                height: 1.0,
              ),
              timeTextStyle: const TextStyle(
                color: Colors.black,
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w300,
                fontSize: 13,
                height: 1.0,
              ),
              defaultDecoration: BoxDecoration(
                color: Colors.white,
                border: Border.fromBorderSide(BorderSide(
                  color: Colors.green[500]!,
                  width: 2,
                  style: BorderStyle.solid,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              selectedDecoration: const BoxDecoration(
                color: Colors.black,
                border: Border.fromBorderSide(BorderSide(
                  color: Color.fromARGB(255, 151, 151, 151),
                  width: 1,
                  style: BorderStyle.solid,
                )),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              disabledDecoration: BoxDecoration(
                color: Colors.red.shade200,
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
                ],
                border: Border.fromBorderSide(BorderSide(
                  color: Colors.grey.shade200,
                  width: 1,
                  style: BorderStyle.solid,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              showDisabled: true,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
