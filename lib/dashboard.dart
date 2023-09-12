import 'package:flutter/material.dart';
import 'package:medisync/global.dart'; 


// List of Dummy appoinemts
Appointment dummyAppoinment = Appointment(PID: 'P123', patientName: 'John Smith Johnson', startDateTIme: DateTime.now(), contact: "+91 98921 65452");
Doctor dummyDoctor = Doctor(DRID: 'DR123', doctorName: "Dr. James Brown");


List<Appointment> dummyAppointments = [];
List<Doctor> dummyDoctors = [];

List<Department> dummyDepartments = [];


TextStyle boldStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0
);

  TextStyle boldStyleOrange = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  color: Color(0xffff6347)
);


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  double containerHeight = 450;


  @override
  Widget build(BuildContext context) {

    // Initializing dummy appointments and doctors

    for (int i=0; i<6; i++) {
      dummyAppointments.add(dummyAppoinment);
      dummyDoctors.add(dummyDoctor);
    }


    dummyDepartments = [
       Department(DID: "D123", departmentName: "Emergency Department", doctors: dummyDoctors),
        Department(DID: "D123", departmentName: "Cardiology Department", doctors: dummyDoctors),
        Department(DID: "D123", departmentName: "Orthopedic Department", doctors: dummyDoctors),
        Department(DID: "D123", departmentName: "Neurology Department", doctors: dummyDoctors),
    ];



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
                      height: 400,
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
                                  dummyDepartments
                                  .map((department) => Padding(
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
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/department', arguments: department);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(50.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                          
                                            Icon(Icons.local_hospital, color: Color(0xffff6347), size: 40,),

                                            SizedBox(width: 20,),

                                            Text(
                                              department.departmentName,
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
                                  showDialog(
                                    context: context, 
                                    builder: (BuildContext context) {
                                      return AddDepartmentDailog();
                                    }
                                  );
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
                          children: [
                            const Text(
                              "Statistics",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),

                            const Divider(
                              height: 20.0,
                              //color: Colors.black,
                              thickness: 1.0,
                            ),


                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text('Number of Departments: ', style: boldStyle,),
                                      Text('11', style: boldStyleOrange,),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Text('Total Number of Doctors: ', style: boldStyle,),
                                      Text('25', style: boldStyleOrange,),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Text('Doctors Present Today: ', style: boldStyle,),
                                      Text('19', style: boldStyleOrange,),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Text('Avergage Doctor Occupancy (minutes): ', style: boldStyle,),
                                      Text('25', style: boldStyleOrange,),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Text('Total Appoiments Today: ', style: boldStyle,),
                                      Text('68', style: boldStyleOrange,),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Text('Total Appoinments Completed: ', style: boldStyle,),
                                      Text('32', style: boldStyleOrange,),
                                    ],
                                  ),
                                ],
                              ),
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
                          children: <Widget> [
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
                            ),

                            const Divider(
                              height: 20.0,
                              //color: Colors.black,
                              thickness: 1.0,
                            ),

                            Container(
                              height: containerHeight - 125,
                              child: ListView(
                                children: dummyAppointments.map((app) => AppointmentTile(appointment: app)).toList(),
                              ),
                            )
                          ]
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
                                ),
                              ],
                            ),

                            const Divider(
                              height: 20.0,
                              //color: Colors.black,
                              thickness: 1.0,
                            ),

                            Container(
                                  height: containerHeight - 125,
                                  child: ListView(
                                    children: dummyAppointments.map((app) => AppointmentTile(appointment: app)).toList(),
                                  ),
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
                                ),
                              ],
                            ),

                            const Divider(
                              height: 20.0,
                              //color: Colors.black,
                              thickness: 1.0,
                            ),

                            Container(
                                  height: containerHeight - 125,
                                  child: ListView(
                                    children: dummyAppointments.map((app) => AppointmentTile(appointment: app, cancelButton: false,)).toList(),
                                  ),
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
                          children: [
                            const Text(
                              "Add Appointments",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),

                            const Divider(
                              height: 20.0,
                              //color: Colors.black,
                              thickness: 1.0,
                            ),

                            SizedBox(height: 10,),

                            const TextField(
                              decoration: InputDecoration(
                                hintText: "Patient Name",
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10,),

                            const TextField(
                              decoration: InputDecoration(
                                hintText: "Contact Number",
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10,),

                            const TextField(
                              decoration: InputDecoration(
                                hintText: "Address",
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10,),

                            const TextField(
                              decoration: InputDecoration(
                                hintText: "Search Doctors",
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10,),

                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          "View Available Slots",
                                          style:  TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
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
                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Doctor Attendance - ${DateTime.now().toLocal().toString().split(' ')[0]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),

                            const SizedBox(height: 20.0,),

                            SearchBox(onchangedfunction: (){}, hintTextString: "Search Doctors",),

                            const Divider(
                              height: 20.0,
                              //color: Colors.black,
                              thickness: 1.0,
                            ),


                            Container(
                              height: 270,
                              child: ListView(
                                children: dummyDoctors.map((doc) => DoctorCard(doctor: doc,)).toList(),
                              ),
                            )
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



class AppointmentTile extends StatefulWidget {
  AppointmentTile({super.key, required this.appointment, this.cancelButton=true, this.onCancel});

  Appointment appointment;
  bool cancelButton;
  Function? onCancel;

  @override
  State<AppointmentTile> createState() => _AppointmentTileState();
}

class _AppointmentTileState extends State<AppointmentTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            //height: 80.0,
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
                title: Text(widget.appointment.patientName),
                leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.grey,
                    ),
                children: [
                 Padding(
                  padding: EdgeInsets.only(left: 70, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Patient ID: ${widget.appointment.PID}' 
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Appointment Date: ${widget.appointment.startDateTIme!.day} / ${widget.appointment.startDateTIme!.month} / ${widget.appointment.startDateTIme!.year}'
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Appointment Date: ${widget.appointment.startDateTIme!.hour} : ${widget.appointment.startDateTIme!.minute}'
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Contact: ${widget.appointment.contact}'
                          )
                        ],
                      ),

                      widget.cancelButton ?
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                                  "Cancel",
                                  style:  TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ) : SizedBox()
                    ],
                  ),
                 )
            
                ],
              ),
            )
          );
  }
}



class DoctorCard extends StatefulWidget {
  DoctorCard({super.key, required this.doctor});

  Doctor doctor;

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {

  bool _isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [

          SizedBox(width: 15.0,),

          CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.grey,
          ),

          SizedBox(width: 10.0,),

          Text(
            widget.doctor.doctorName,
            style: TextStyle(
              fontSize: 16.0
            ),
          ),

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

    );
  }
}



// Add Department Pop Up
class AddDepartmentDailog extends StatefulWidget {
  const AddDepartmentDailog({super.key});

  @override
  State<AddDepartmentDailog> createState() => _AddDepartmentDailogState();
}

class _AddDepartmentDailogState extends State<AddDepartmentDailog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Department ID: ", style: boldStyle,),
                Text("1231", style: boldStyleOrange,)
              ],
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Department Name",
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

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
                        "Add a New Department",
                        style:  TextStyle(
                          fontSize: 14.0,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                ],
              ),
            )

          ],
        ),
      ),
      );
  }
}