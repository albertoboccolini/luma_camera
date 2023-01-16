import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'login.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});
  @override
  State<MyAccount> createState() => _PageAccount();
}

class _PageAccount extends State<MyAccount> {
  @override
  void initState() {
    super.initState();
  }

  var title = 'Luma Camera';

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
      } else if (Index.selectedIndex == 2) {
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
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
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
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: background,
            ),
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      margin: const EdgeInsets.only(
                          left: 5, right: 0, top: 10, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: background,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(button),
                            textStyle:
                                MaterialStateProperty.all(const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: button)))),
                        child: const Text('Tema'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: background,
                                contentTextStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                content: Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: background,
                                  ),
                                  width: 450,
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 120,
                                          height: 40,
                                          margin: const EdgeInsets.only(
                                              left: 5,
                                              right: 0,
                                              top: 10,
                                              bottom: 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: background,
                                          ),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          button),
                                                  textStyle:
                                                      MaterialStateProperty.all(
                                                          const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  18.0),
                                                          side: BorderSide(
                                                              color: button)))),
                                              child: const Text('Luma Red'),
                                              onPressed: () async {
                                                final SharedPreferences
                                                    sharedPreferences =
                                                    await SharedPreferences
                                                        .getInstance();
                                                sharedPreferences
                                                    .remove('theme');
                                                sharedPreferences.setString(
                                                    'theme', 'red');
                                                setState(() {
                                                  background =
                                                      const Color(0xff171717);
                                                  button =
                                                      const Color(0xff9D0B28);
                                                  hover =
                                                      const Color(0xffC72C41);
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const MyAccount(),
                                                    ),
                                                    (route) => false,
                                                  );
                                                });
                                              })),
                                      Container(
                                        width: 120,
                                        height: 40,
                                        margin: const EdgeInsets.only(
                                            left: 5,
                                            right: 0,
                                            top: 10,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: background,
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      button),
                                              textStyle:
                                                  MaterialStateProperty.all(
                                                      const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              )),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color: button)))),
                                          child: const Text('Luma Blue'),
                                          onPressed: () async {
                                            final SharedPreferences
                                                sharedPreferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            sharedPreferences.remove('theme');
                                            sharedPreferences.setString(
                                                'theme', 'blue');
                                            setState(() {
                                              background =
                                                  const Color(0xff0b2f48);
                                              button = const Color(0xff186498);
                                              hover = const Color(0xff23abfb);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const MyAccount(),
                                                ),
                                                (route) => false,
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 40,
                                        margin: const EdgeInsets.only(
                                            left: 5,
                                            right: 0,
                                            top: 10,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: background,
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      button),
                                              textStyle:
                                                  MaterialStateProperty.all(
                                                      const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              )),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color: button)))),
                                          child: const Text('Luma Dark'),
                                          onPressed: () async {
                                            final SharedPreferences
                                                sharedPreferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            sharedPreferences.remove('theme');
                                            sharedPreferences.setString(
                                                'theme', 'defaultDark');
                                            setState(() {
                                              background =
                                                  const Color(0xff171717);
                                              button = const Color(0xff423F3E);
                                              hover = const Color(0xff7E7474);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const MyAccount(),
                                                ),
                                                (route) => false,
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 40,
                                        margin: const EdgeInsets.only(
                                            left: 5,
                                            right: 0,
                                            top: 10,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: background,
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      button),
                                              textStyle:
                                                  MaterialStateProperty.all(
                                                      const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              )),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color: button)))),
                                          child: const Text('Luma Default'),
                                          onPressed: () async {
                                            final SharedPreferences
                                                sharedPreferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            sharedPreferences.remove('theme');
                                            sharedPreferences.setString(
                                                'theme', 'default');
                                            setState(() {
                                              background =
                                                  const Color(0xffcf769c);
                                              button = const Color(0xffffb6c1);
                                              hover = const Color(0xffeed3ea);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const MyAccount(),
                                                ),
                                                (route) => false,
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      margin: const EdgeInsets.only(
                          left: 5, right: 0, top: 10, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: background,
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(button),
                              textStyle:
                                  MaterialStateProperty.all(const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: button)))),
                          child: const Text('Logout'),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: background,
                                  contentTextStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  content: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: background,
                                    ),
                                    width: 450,
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text('Vuoi uscire?')
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 40,
                                                margin: const EdgeInsets.only(
                                                    left: 0,
                                                    right: 0,
                                                    top: 10,
                                                    bottom: 0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: background,
                                                ),
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all(
                                                              button),
                                                      padding:
                                                          MaterialStateProperty.all(
                                                              const EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 10,
                                                                  bottom: 10)),
                                                      textStyle:
                                                          MaterialStateProperty.all(
                                                              const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      18.0),
                                                              side: BorderSide(color: button)))),
                                                  child: const Text('Esci'),
                                                  onPressed: () async {
                                                    usernameController.text =
                                                        '';
                                                    passwordController.text =
                                                        '';
                                                    Index.selectedIndex = 0;
                                                    final SharedPreferences
                                                        sharedPreferences =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    sharedPreferences
                                                        .remove('username');
                                                    sharedPreferences
                                                        .remove('theme');
                                                    setState(() {
                                                      background = const Color(
                                                          0xffcf769c);
                                                      button = const Color(
                                                          0xffffb6c1);
                                                      hover = const Color(
                                                          0xffeed3ea);
                                                    });
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const MyLogin(),
                                                      ),
                                                      (route) => false,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 40,
                                                margin: const EdgeInsets.only(
                                                    left: 5,
                                                    right: 0,
                                                    top: 10,
                                                    bottom: 0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: background,
                                                ),
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(button),
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(
                                                                  const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              side: BorderSide(
                                                                  color:
                                                                      button)))),
                                                  child: const Text('Annulla'),
                                                  onPressed: () async {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop('dialog');
                                                  },
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ]),
            ),
          ),
        ),
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
      ),
    );
  }
}
