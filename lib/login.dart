import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});
  @override
  State<MyLogin> createState() => _Login();
}

class _Login extends State<MyLogin> {
  @override
  void initState() {
    super.initState();
    Index.passwordVisible = false;
  }

  var title = 'Luma Camera';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              Container(
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: background,
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: button,
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: background,
                ),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: !Index.passwordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: button,
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Index.passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          Index.passwordVisible = !Index.passwordVisible;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(button),
                    padding: MaterialStateProperty.all(const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: button)))),
                child: const Text('Accedi'),
                onPressed: () async {
                  if (usernameController.text == 'USERNAME' &&
                      passwordController.text == 'PASSWORD') {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove('username');
                    sharedPreferences.setString(
                        'username', usernameController.text);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const MyApp(),
                      ),
                      (route) => false,
                    );
                  } else if (usernameController.text == '' ||
                      passwordController.text == '') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: button,
                          contentTextStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: button)),
                          content: const Text('campi vuoti'),
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: button,
                          contentTextStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: button)),
                          content: const Text('credenziali errate'),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
