import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    //si en englais **HijriCalendar.setLocal('en');
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat("EEE , d/MM/yyyy");
    var formated = format.format(day);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: _size.height * .22,
              width: _size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.7,
                    image: AssetImage("assets/background_img.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _hijri.hDay.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _hijri.longMonthName.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _hijri.hYear.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      formated,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
