import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medisync/global.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                        padding: EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 10),
                        width: 400,
                        height: 700,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: ListView(
                            children: [
                        
                              Row(
                                children: const [
                                  Text(
                                    'HID: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '12345',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0xffff6347)
                                    ),
                                  ),
                                ],
                        
                              ),
                        
                              const SizedBox(height: 20,),
                        
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: "Hospital Name",
                                  border: UnderlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                                  ),
                                ),
                              ),
                        
                              const SizedBox(height: 40,),
                        
                              const TextField(
                                maxLines: 3,
                                minLines: 2,
                                decoration: InputDecoration(
                                  hintText: "Address",
                                  border: const UnderlineInputBorder(), 
                                  focusedBorder: const  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                                  ),
                                ),
                              ),
                        
                              const SizedBox(height: 30,),
                        
                              const Text(
                                "Locate hospital on map",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                        
                              const SizedBox(height: 20,),
                        
                              Container(color: Colors.grey, height: 180,),
                        
                              const SizedBox(height: 20,),
                        
                              const TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  border: const UnderlineInputBorder(), 
                                  focusedBorder: const  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                                  ),
                                ),
                              ),
                        
                              const SizedBox(height: 20,),
                        
                              const TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  border: const UnderlineInputBorder(), 
                                  focusedBorder: const  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                                  ),
                                ),
                              ),
                        
                              const SizedBox(height: 30,),
                        
                              const Text(
                                "Verification of hospitals can take upto 2 working days\nBy registering I agree to the Terms and Conditions of MediSync",
                                style: TextStyle(
                                  fontSize: 10.0
                                ),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 40,),
                        
                        
                              Center(
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
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
                                      "Register",
                                      style:  TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                )
                              ),


                              const SizedBox(height: 40,),
                        
                            ],
                          ),
                        )
                      )
                  )
              )
            ],
          ),
        ));
  }
}
