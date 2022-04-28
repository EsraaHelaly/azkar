import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  String _count = 'الحمدلله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Azkari',
          style: TextStyle(
            fontSize: 24,
            // color: Colors.black,
            fontFamily: 'Courgette',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/about_screen'),
            icon: Icon(Icons.info),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (_count != value) {
                setState(() {
                  _count = value;
                  _counter = 0;
                });
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('الحمدلله'),
                  value: 'الحمدلله',
                ),
                PopupMenuItem(
                  child: Text('سبحان الله'),
                  value: 'سبحان الله',
                ),
                PopupMenuItem(
                  child: Text('أستغفر الله'),
                  value: 'أستغفر الله',
                ),
                PopupMenuItem(
                  child: Text('لا إله إلا الله'),
                  value: 'لا إله إلا الله',
                ),
                PopupMenuItem(
                  child: Text('الله أكبر'),
                  value: 'الله أكبر',
                ),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.brown.shade800,
                  Colors.blue.shade100,
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   clipBehavior: Clip.antiAlias,
                //   height: 120,
                //   width: 120,
                //   decoration: BoxDecoration(shape: BoxShape.circle),
                //   child: Image.asset(
                //     'images/hfKD5vcezIu0hrcq8qsx1liMlXktQZ4dpL2k14nj.jpeg',
                //     fit: BoxFit.cover,
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 60,
                        color: Colors.teal.shade200,
                        child: Text(
                          _counter.toString(),
                          style: TextStyle(fontFamily: 'Amiri', fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          _count,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _counter = 0;
                          });
                        },
                        child: Text(
                          'إعادة',
                          style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange.shade500,
                          fixedSize: Size(80, 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ++_counter;
                          });
                        },
                        child: const Text(
                          'تسبيح',
                          style: TextStyle(
                              fontFamily: 'Amiri',
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(80, 80),
                          primary: Colors.teal.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
