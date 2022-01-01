import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanlyhocba/models/students.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State <StudentAdd>{

  var formKey = GlobalKey<FormState>();

  Student student = Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quản lý học bạ học sinh cấp 3"),
        ),
        body: Container(
          //form olusturuyoruz
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        )
      //Center(child: Text("Yeni Ogrenci"),),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Họ và tên", hintText: "Họ và tên"),
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }
  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Xếp loại học tập", hintText: "Xếp loại"),
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Điểm trung bình", hintText: "50"),
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Thêm"),
      onPressed: (){
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }

}