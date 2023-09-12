import 'package:flutter/material.dart';
import 'package:medisync/global.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: Padding(
          padding: EdgeInsets.fromLTRB(100, 50, 100, 50),
          child: Column(
            children: [
              Logo(size: 28.0),
              Expanded(
                  child: Center(
                      child: Container(
                        padding: EdgeInsets.all(50),
                        width: 400,
                        height: 500,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                hintText: "Enter HID",
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40,),
                            TextField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                border: const UnderlineInputBorder(), 
                                focusedBorder: const  UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: togglePasswordVisibility,
                                ),
                              ),
                            ),

                            const SizedBox(height: 30,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('Text tapped!');
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30,),

                            Center(
                              child: TextButton(
                                onPressed: (){
                                  Navigator.popAndPushNamed(context, '/dashboard');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff0073e6),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)
                                  )
                                ),
                                child: const Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                                  child: Text(
                                    "Login",
                                    style:  TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                            ),

                            const SizedBox(height: 30,),

                            const Divider(
                              thickness: 2.0,
                              color: Colors.grey,
                            ),

                            const SizedBox(height: 30,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Register you hospital here    ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0
                                  ),
                                ),

                                TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xff19a7c9),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0)
                                    )
                                  ),
                                  child: const Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                                    child: Text(
                                      "Register",
                                      style:  TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                )


                              ],
                            )

                          ],
                        )
                      )
                  )
              )
            ],
          ),
        ));
  }
}
