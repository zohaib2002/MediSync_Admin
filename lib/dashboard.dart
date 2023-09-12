import 'package:flutter/material.dart';
import 'package:medisync/global.dart'; 

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  double containerHeight = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xfff5f5f5),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Logo(size: 24),
        ),
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 95),
          child: Column(
            children: [
              const SizedBox(height: 40.0,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      height: containerHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                    "Departments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 500,
                                        child: SearchBox(onchangedfunction: (text){}, hintTextString: "Search Departments",)
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Divider(
                              height: 40.0,
                              //color: Colors.black,
                              thickness: 1.0,
                            ),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: 
                                  ["Emergency Department", "Cardiology Department", "Orthopedic Department", "Neurology Department"]
                                  .map((category) => Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white, // Background color
                                        foregroundColor: Colors.black, // Text color
                                        side: BorderSide(color: Colors.black, width: 1.0), // Border
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(50.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                          
                                            Icon(Icons.local_hospital, color: Color(0xffff6347), size: 40,),

                                            SizedBox(width: 20,),

                                            Text(
                                              category,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold
                                              ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )).toList()
                                
                              ),
                            ),

                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                onPressed: (){
                                  //Navigator.popAndPushNamed(context, '/dashboard');
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
                                    "Add Department",
                                    style:  TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                              ],

                            ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 40.0,),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      height: containerHeight,
                       child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Statistics",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(width: 40,),


                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      height: containerHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                    "Ongoing Appointments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: SearchBox(onchangedfunction: (text){}, hintTextString: "Search Patients",)
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 40.0,),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      height: containerHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                    "Upcoming Appointments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: SearchBox(onchangedfunction: (text){}, hintTextString: "Search Patients",)
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(width: 40,),


                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      height: containerHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                    "Completed Appointments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: SearchBox(onchangedfunction: (text){}, hintTextString: "Search Patients",)
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 40.0,),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      height: containerHeight,
                       child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Add Appointments",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(width: 40,),


                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      height: containerHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Doctor Attendance",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 40.0,),

            ],
          ),
        ),
      ),

    );
  }
}


