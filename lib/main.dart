import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'account.dart';
import 'login.dart';

// colori default theme
var background = const Color(0xffcf769c);
var button = const Color(0xffffb6c1);
var hover = const Color(0xffeed3ea);

/* variabili controller che resettano
le coordinate quando l'utente fa zoom*/
TransformationController controllerT = TransformationController();
var initialControllerValue = controllerT.value;

Timer? timer;

/* variabili controller che salvano username
e password per utilizzarle all'interno dell'app*/
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

// variabile che conterrà l'username, controllato all'avvio dell'app
String finalUsername = '';

/* variabili utilizzate
anche nelle altre classi*/
class Index {
  static int selectedIndex = 0;
  static bool passwordVisible = false;
}

void main() => runApp(const MaterialApp(
      title: 'Luma Camera',
      home: MyStart(),
      debugShowCheckedModeBanner: false,
    ));

class MyStart extends StatefulWidget {
  const MyStart({super.key});
  @override
  State<MyStart> createState() => _Start();
}

// pagina principale che contiene le telecamere
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var title = 'Luma Camera';
    return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            // topBar
            child: AppBar(
              toolbarHeight: 95,
              title: Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
                height: 100,
              ),
              backgroundColor: background,
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
          ),
          body: ForcePicRefresh(),
        ));
  }
}

/* pagina di caricamento
(visualizzata all'avvio dell'app)*/
class _Start extends State<MyStart> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), wait);
    super.initState();
  }

  /* la funzione controlla che l'utente sia loggato
  se l'utente è loggato chiama la pagina MyApp,
  se non è loggato chiama la pagina MyLogin (file: login.dart)*/
  void wait() {
    getValidationData().whenComplete(() async {
      if (finalUsername == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MyLogin(),
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MyApp(),
          ),
          (route) => false,
        );
      }
    });
  }

  /* prende le variabili dell'account
  salvate nella sessione dell'app
  per cambiare il tema*/
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedUsername = sharedPreferences.get('username');
    var theme = sharedPreferences.get('theme');
    if (theme == 'red') {
      setState(() {
        finalUsername = obtainedUsername;
        background = const Color(0xff171717);
        button = const Color(0xff9D0B28);
        hover = const Color(0xffC72C41);
      });
    } else if (theme == 'blue') {
      setState(() {
        finalUsername = obtainedUsername;
        background = const Color(0xff0b2f48);
        button = const Color(0xff186498);
        hover = const Color(0xff23abfb);
      });
    } else if (theme == 'defaultDark') {
      setState(() {
        finalUsername = obtainedUsername;
        background = const Color(0xff171717);
        button = const Color(0xff423F3E);
        hover = const Color(0xff7E7474);
      });
    } else if (theme == 'default') {
      setState(() {
        finalUsername = obtainedUsername;
        background = const Color(0xffcf769c);
        button = const Color(0xffffb6c1);
        hover = const Color(0xffeed3ea);
      });
    } else {
      setState(() {
        finalUsername = obtainedUsername;
      });
    }
  }

  var title = 'Luma Camera';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // imposta il titolo app nel multitasking
        title: title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: background,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}

// la classe forza l'aggiornamento dello stato delle immagini
class ForcePicRefresh extends StatefulWidget {
  @override
  _ForcePicRefreshState createState() => _ForcePicRefreshState();
}

// la classe contiene tutti gli url da dove fare il GET delle immagini
class _ForcePicRefreshState extends State<ForcePicRefresh> {
  String url = 'FIRST_CAMERA_LINK';
  String url2 = 'SECOND_CAMERA_LINK';
  String url3 = 'THIRD_CAMERA_LINK';
  String url4 = 'FOURTH_CAMERA_LINK';
  Widget _pic = Image.network('');
  Widget _pic2 = Image.network('');
  Widget _pic3 = Image.network('');
  Widget _pic4 = Image.network('');

  @override
  // ogni 5 secondi chiama la funzione che aggiorna le immagini
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateImgWidget());
    super.initState();
    _pic = Image.network(url);
    _pic2 = Image.network(url2);
    _pic3 = Image.network(url3);
    _pic4 = Image.network(url4);
    super.initState();
  }

  // funzione che aggiorna le immagini
  _updateImgWidget() async {
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    Uint8List bytes2 = (await NetworkAssetBundle(Uri.parse(url2)).load(url2))
        .buffer
        .asUint8List();
    Uint8List bytes3 = (await NetworkAssetBundle(Uri.parse(url3)).load(url3))
        .buffer
        .asUint8List();
    Uint8List bytes4 = (await NetworkAssetBundle(Uri.parse(url4)).load(url4))
        .buffer
        .asUint8List();
    setState(() {
      _pic = Image.memory(bytes);
      _pic2 = Image.memory(bytes2);
      _pic3 = Image.memory(bytes3);
      _pic4 = Image.memory(bytes4);
    });
  }

  /* la funzione controlla quale pagina chiamare
  in base alla variabile selectedIndex*/
  void _onItemTapped(int index) {
    setState(() {
      Index.selectedIndex = index;
      if (Index.selectedIndex == 0) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MyApp(),
          ),
          (route) => false,
        );
      } else if (Index.selectedIndex == 1) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MyAccount(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      // contenitore body
      body: Container(
        margin: const EdgeInsets.all(20),
        // contenitore con zoom
        child: InteractiveViewer(
          panEnabled: false,
          boundaryMargin: const EdgeInsets.all(80),
          minScale: 1,
          maxScale: 4,
          transformationController: controllerT,
          onInteractionStart: (details) {
            initialControllerValue = controllerT.value;
          },
          onInteractionEnd: (details) {
            controllerT.value = initialControllerValue;
          },
          // contenitore con scroll
          child: SingleChildScrollView(
            // contenitore principale
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: background,
              ),
              // colonna
              child: Column(children: [
                // contenitore Camera 1
                Container(
                  width: 300,
                  height: 230,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: button,
                  ),
                  child: TextButton(
                    onPressed: () {
                      null;
                    },
                    child: InkWell(
                      child: _pic,
                      onTap: () {
                        null;
                      },
                    ),
                  ),
                ),
                // contenitore Camera 2
                Container(
                  width: 300,
                  height: 230,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: button,
                  ),
                  child: TextButton(
                    onPressed: () {
                      null;
                    },
                    child: InkWell(
                      child: _pic2,
                      onTap: () {
                        null;
                      },
                    ),
                  ),
                ),
                // contenitore Camera 3
                Container(
                  width: 300,
                  height: 230,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: button,
                  ),
                  child: TextButton(
                    onPressed: () {
                      null;
                    },
                    child: InkWell(
                      child: _pic3,
                      onTap: () {
                        null;
                      },
                    ),
                  ),
                ),
                // contenitore Camera 4
                Container(
                  width: 300,
                  height: 230,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: button,
                  ),
                  child: TextButton(
                    onPressed: () {
                      null;
                    },
                    child: InkWell(
                      child: _pic4,
                      onTap: () {
                        null;
                      },
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
      // navBar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 25,
            ),
            label: 'Impostazioni',
          ),
        ],
        currentIndex: Index.selectedIndex,
        backgroundColor: background,
        selectedItemColor: hover,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
