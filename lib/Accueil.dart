import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:home/LoginPage.dart';
import 'package:home/notification_service.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Accueil> {
  bool status = false;
  bool statwaterhome = false;
  bool statlight = false;
  bool stateater = false;
  bool statlightanimal = false;
  bool wateranimal = false;
  bool watergarden = false;

  String temphome = '0';
  String humhome = '0';
  String gazhome = '0';

  String tempgr = '0';
  String humgr = '0';
  String gazgr = '0';

  String tempfr = '0';
  String humfr = '0';

  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference _getdata =
        FirebaseDatabase.instance.ref().child('module1/Temperature');
    _getdata.onValue.listen(
      (event) {
        setState(() {
          temphome = event.snapshot.value.toString();
        });
        double currentTemperature = double.parse(temphome);
        if (currentTemperature > 45) {
          NotificationService.showSimpleNotification(
            title: "High Temperature Alert",
            body: "The temperature is too high: $currentTemperature°C",
            payload: "$currentTemperature°C",
          );
        }
      },
    );

    DatabaseReference _getdataH =
        FirebaseDatabase.instance.ref().child('module1/humidity');
    _getdataH.onValue.listen(
      (event) {
        setState(() {
          humhome = event.snapshot.value.toString();
        });
      },
    );
    DatabaseReference _getdataG =
        FirebaseDatabase.instance.ref().child('module1/Gaz');
    _getdataG.onValue.listen(
      (event) {
        setState(() {
          gazhome = event.snapshot.value.toString();
        });
      },
    );

    DatabaseReference _getdatagr =
        FirebaseDatabase.instance.ref().child('module2/temperature');
    _getdatagr.onValue.listen(
      (event) {
        setState(() {
          tempgr = event.snapshot.value.toString();
        });
      },
    );

    DatabaseReference _getdatagr1 =
        FirebaseDatabase.instance.ref().child('module2/humidity');
    _getdatagr1.onValue.listen(
      (event) {
        setState(() {
          humgr = event.snapshot.value.toString();
        });
      },
    );
    DatabaseReference _getdatagr2 =
        FirebaseDatabase.instance.ref().child('module2/soil');
    _getdatagr2.onValue.listen(
      (event) {
        setState(() {
          gazgr = event.snapshot.value.toString();
        });
      },
    );
    DatabaseReference _getdatafr =
        FirebaseDatabase.instance.ref().child('module3/Tempurature');
    _getdatafr.onValue.listen(
      (event) {
        setState(() {
          tempfr = event.snapshot.value.toString();
        });
      },
    );
    DatabaseReference _getdatafr1 =
        FirebaseDatabase.instance.ref().child('module3/humidity');
    _getdatafr1.onValue.listen(
      (event) {
        setState(() {
          humfr = event.snapshot.value.toString();
        });
      },
    );

    return DefaultTabController(
      // appel de l'appbaar cotroller
      length: 3, //declaration combient de pages contient l'acceuil
      child: Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "My Home",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: Icon(Icons.output_outlined),
              ),
            ],
          ),
          backgroundColor: Colors.blueAccent,
          bottom: const TabBar(tabs: [
            //bottom c'est widget qu contient le fonctions necessaire pour faire le appbar
            Tab(
              //first page
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              text: "Home",
            ),
            Tab(
              //second page
              icon: Icon(Icons.nature_outlined, color: Colors.white),
              text: "Garden",
            ),
            Tab(
              //last page
              icon: Icon(Icons.pets, color: Colors.white),
              text: "Farm",
            ),
          ]),
        ),
        //ici le contenue de chaque page
        body: TabBarView(
          children: [
            SizedBox(
              //this is first page
              child: ListView(
                children: [
                  Container(
                    height: 70,
                  ),
                  Row(
                    //pour sassire le contnue horizontale
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        //le deux widget verticale
                        children: [
                          const Text(
                            "Humidity ",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 90,
                            color: const Color.fromARGB(255, 190, 190, 190),
                            child: Text(
                              "$humhome % ",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        //2eme valeur
                        children: [
                          const Text(
                            "Temperature",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 90,
                            color: const Color.fromARGB(255, 190, 190, 190),
                            child: Text(
                              '  $temphome °C',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 70,
                  ),
                  // hethe affichage te3 l gaz
                  Column(
                    children: [
                      const Text(
                        "Gaz Level  ",
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 90,
                        color: const Color.fromARGB(255, 190, 190, 190),
                        child: Text(
                          "  $gazhome % ",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                  ),
                  //row fehe light button and water button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.lightbulb_circle,
                            size: 80,
                            color: Colors.yellow,
                          ),
                          Switch(
                            activeColor: Colors.green,
                            value: statlight,
                            onChanged: (val) {
                              setState(() {
                                statlight = val;
                                _databaseReference
                                    .child('module1/statlight')
                                    .set(val); // Update value in Firebase
                              });
                            },
                          ),
                        ],
                      ),
                      // wateer button
                      Column(
                        children: [
                          const Icon(
                            Icons.water_drop_outlined,
                            size: 80,
                            color: Colors.blueAccent,
                          ),
                          Switch(
                            activeColor: Colors.green,
                            value: statwaterhome,
                            onChanged: (val) {
                              setState(() {
                                statwaterhome = val;
                                _databaseReference
                                    .child('module1/statwaterhome')
                                    .set(val); // Update value in Firebase
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            //box of garden ---> le contenue de la 2eme page
            SizedBox(
              child: ListView(
                children: [
                  Container(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Humidity ",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 90,
                            color: const Color.fromARGB(255, 190, 190, 190),
                            child: Text(
                              "$humgr % ",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Temperature",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 90,
                            color: const Color.fromARGB(255, 190, 190, 190),
                            child: Text(
                              " $tempgr °C ",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 70,
                  ),
                  // hethe affichage te3 lhumidite de sol
                  Column(
                    children: [
                      const Text(
                        "Soil Moisture",
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 90,
                        color: const Color.fromARGB(255, 190, 190, 190),
                        child: Text(
                          " $gazgr % ",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                  ),
                  // wateer button
                  Column(
                    children: [
                      const Icon(
                        Icons.water_drop_outlined,
                        size: 80,
                        color: Colors.blueAccent,
                      ),
                      Switch(
                        activeColor: Colors.green,
                        value: watergarden,
                        onChanged: (val) {
                          setState(() {
                            watergarden = val;
                            _databaseReference.child('module2/watergarden').set(
                                val); // Mettre à jour la valeur dans Firebase
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            //  box of fram --> le contunue de 3eme page
            SizedBox(
              child: ListView(
                children: [
                  Container(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Humidity ",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 90,
                            color: const Color.fromARGB(255, 190, 190, 190),
                            child: Text(
                              " $humfr % ",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Temperature",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 90,
                            color: const Color.fromARGB(255, 190, 190, 190),
                            child: Text(
                              " $tempfr °C ",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 70,
                  ),
                  // hethe affichage te3 meklaa
                  Column(
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.food_bank,
                            size: 80,
                            color: Colors.green,
                          ),
                          Switch(
                            activeColor: Colors.green,
                            value: stateater,
                            onChanged: (val) {
                              setState(() {
                                stateater = val;
                                _databaseReference.child('module3/stateater').set(
                                    val); // Mettre à jour la valeur dans Firebase
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                  ),
                  //row fehe light button and water button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.lightbulb_circle,
                            size: 80,
                            color: Colors.yellow,
                          ),
                          Switch(
                            activeColor: Colors.green,
                            value: statlightanimal,
                            onChanged: (val) {
                              setState(() {
                                statlightanimal = val;
                                _databaseReference
                                    .child('module3/statlightanimal')
                                    .set(
                                        val); // Mettre à jour la valeur dans Firebase
                              });
                            },
                          ),
                        ],
                      ),
                      // wateer button
                      Column(
                        children: [
                          const Icon(
                            Icons.water_drop_outlined,
                            size: 80,
                            color: Colors.blueAccent,
                          ),
                          Switch(
                            activeColor: Colors.green,
                            value: wateranimal,
                            onChanged: (val) {
                              setState(() {
                                wateranimal = val;
                                _databaseReference.child('module3/wateranimal').set(
                                    val); // Mettre à jour la valeur dans Firebase
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
