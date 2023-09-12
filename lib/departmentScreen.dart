import 'package:flutter/material.dart';
import 'package:medisync/global.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {

  @override
  Widget build(BuildContext context) {

    final Department? department = ModalRoute.of(context)!.settings.arguments as Department?;

    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Column(
            children: [
              Logo(size: 28.0),
              Expanded(
                  child: Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(50,50,50,20),
                        width: 800,
                        height: 700,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                        child: Column(
                          children: [
                            
                            Row(
                              children: [
                                const Icon(
                                  Icons.local_hospital,
                                  color: Color(0xffff6347),
                                  size: 30,
                                ),

                                const SizedBox(width: 20.0,),

                                Text(
                                  department!.departmentName,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),

                                const SizedBox(width: 30.0,),

                                const Text(
                                  'DID ',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),

                                Text(
                                  department.DID,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffff6347)
                                  ),
                                ),

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: (){
                                          //Navigator.popAndPushNamed(context, '/dashboard');
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
                                            "Add Doctor",
                                            style:  TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),


                            const Divider(
                              height: 40.0,
                              color: Colors.black,
                              thickness: 1.0,
                            ),

                            Row(
                              children: [

                                Text(
                                  'Doctors - ${DateTime.now().toLocal().toString().split(' ')[0]}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0
                                  ),
                                ),

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 350,
                                        height: 40,
                                        child: SearchBox(onchangedfunction: (){}, hintTextString: "Search Doctors",),
                                      )
                                    ],
                                  ),
                                ),

                              ],

                            ),

                            SizedBox(height: 10,),

                            Container(
                              height: 370,
                              child: ListView(
                                children: department.doctors!.map((doc) => DoctorInfoCard(doctor: doc)).toList(),
                              ),
                            )
          
                          ],
                        )
                      )
                  )
              )
            ],
          ),
        )
      );
  }
}




class DoctorInfoCard extends StatefulWidget {
  DoctorInfoCard({super.key, required this.doctor});

  Doctor doctor;

  @override
  State<DoctorInfoCard> createState() => _DoctorInfoCardState();
}

class _DoctorInfoCardState extends State<DoctorInfoCard> {

  bool _isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),

      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.topLeft,
          childrenPadding: EdgeInsets.all(30),
          title: Row(
            children: [
              Text(widget.doctor.doctorName),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      activeColor: Color(0xff008000),
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          leading: const CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
              ),
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      "View Details",
                      style:  TextStyle(
                        fontSize: 14.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: (){
                    //Navigator.popAndPushNamed(context, '/dashboard');
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
                      "Change Schedule",
                      style:  TextStyle(
                        fontSize: 14.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: (){
                    //Navigator.popAndPushNamed(context, '/dashboard');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffff6347),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    )
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      "Remove",
                      style:  TextStyle(
                        fontSize: 14.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),


              ],
            )
          ]
        )
      ),

    );
  }
}
