import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.size = 16});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Med",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: Colors.black),
          ),
          Text(
            "i",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: Color(0xffff6347)),
          ),
          Text(
            "Sync",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: Colors.black),
          ),
          Text(
            " Admin",
            style: TextStyle(fontSize: size * 0.625, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key, required this.onchangedfunction, this.hintTextString="Search"});

  Function onchangedfunction;
  String hintTextString;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text){onchangedfunction(text);},
      decoration: InputDecoration(
        hintText: hintTextString,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}



class Appointment {

  String patientName;
  DateTime? startDateTIme;
  String contact;
  String? PID;

  Appointment({required this.PID, required this.patientName, required this.startDateTIme, this.contact=""});

}



class Doctor {

  String doctorName;
  String DRID;
  String contact;

  Doctor({required this.DRID, required this.doctorName, this.contact=""});


}



class Department {

  final String departmentName;
  final String DID;

  List<Doctor>? doctors;

  Department({required this.DID, required this.departmentName, this.doctors});

}
