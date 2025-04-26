import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../util/Toast.dart';
import '../../../util/shared_pref_key.dart';
import '../../../util/user_securce_storage.dart';
import '../../../widget/dialog_builder.dart';
import '../../auth/consts/consts.dart';

class HomeController extends GetxController {
  RxList<List<dynamic>> items = <List<dynamic>>[].obs;
  RxList<List<dynamic>> allStudent = <List<dynamic>>[].obs;
  UserSecureStorageImpl preference = Get.find();
  var isCheck = false.obs;
  var isStudentListCheck = false.obs;
  List<dynamic> allSchedule = <List<dynamic>>[];

  Future<void> fetchAllTeachersNames(context) async {
    try {
      isCheck.value = false;
      DialogBuilder(context).showLoadingIndicator();
      items.clear();
      print('Error fetching teacher names: ');
      var data = await preference
          .getSecureData(SharedPrefKey.GET_LANGUAGE_TEACHER_NAME);
      // Get the reference to the 'teacher' collection
      CollectionReference teachers =
      FirebaseFirestore.instance.collection(data.toString());
      List<String> id = [];
      List<String> name = [];
      List<String> email = [];
      // Fetch all documents
      QuerySnapshot snapshot = await teachers.get();
      if (!snapshot.docs.isEmpty) {
        print("..vvvvvvv....");
        for (var doc in snapshot.docs) {
          id.add(doc['id'].toString());
          name.add(doc['name'].toString());
          email.add(doc['email'].toString());
          print(doc["name"]); // This will print the actual document data
        }

        items.value.add(id);
        items.value.add(name);
        items.value.add(email);
        isCheck.value = true;
      }
      DialogBuilder(context).hideOpenDialog();
    } catch (e) {
      DialogBuilder(context).hideOpenDialog();
      isCheck.value = false;

      print('Error fetching teacher hhhhhhnames: $e');
    }
  }

  Future<void> getTeacherProfile(context) async {
    try {
      DialogBuilder(context).showLoadingIndicator();
      var data = await preference
          .getSecureData(SharedPrefKey.GET_LANGUAGE_TEACHER_NAME);
      // Get the reference to the 'teacher' collection
      CollectionReference teachers =
      FirebaseFirestore.instance.collection(data.toString());
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Teachers Teaching schedule')
          .where('id', isEqualTo: "")
          .get();

      DialogBuilder(context).hideOpenDialog();
    } catch (e) {
      DialogBuilder(context).hideOpenDialog();
      isCheck.value = false;

      print('Error fetching teacher hhhhhhnames: $e');
    }
  }

  void setTeasingSchedule(startDate, endDate, context) async {
    DialogBuilder(context).showLoadingIndicator();
    try {
      User? currentUser1 = auth.currentUser;
      DocumentReference store =
      await firestore.collection("Teachers Teaching schedule").doc();

      store.set({
        'startDate': "${startDate}",
        'id': currentUser1!.uid,
        'endDate': "${endDate}",
        'scheduleID': store.id,
      }).then((value) =>
      {
        toastmessage("Successful Add Schedule", color: Colors.green),
        print(".....doc id.........${store.id}"),
        DialogBuilder(context).hideOpenDialog(),
        Get.back()
      });
    } on Exception catch (e) {
      isCheck.value = false;
      DialogBuilder(context).hideOpenDialog();
      toastmessage(
        "Exception : ${e.toString()}",
      );
    }
  }

  void getTeacherSchedule({id, getData, context}) async {
    allSchedule.clear();
    List<String> startTime = [];
    List<String> endTime = [];
    List<String> scheduleID = [];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Teachers Teaching schedule')
          .where('id', isEqualTo: id)
          .get();

      for (var doc in querySnapshot.docs) {
        startTime.add(doc['startDate'].toString());
        endTime.add(doc['endDate'].toString());
        scheduleID.add(doc['scheduleID'].toString());
      }

      if (startTime.isNotEmpty && endTime.isNotEmpty) {
        allSchedule.add(startTime);
        allSchedule.add(endTime);
        allSchedule.add(scheduleID);
        getData(allSchedule);
      }
    } on Exception catch (e) {}
  }

  getBookedStudentList({id, Function? getData, context}) async {
    print("gfhdg....................${id}");
    DialogBuilder(context).showLoadingIndicator();
    isStudentListCheck.value = false;
    allStudent.clear();
    List<String> studentName = [];
    List<String> studentEmail = [];
    List<String> scheduleID = [];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Book Teachers Schedule')
          .where('scheduleID', isEqualTo: id)
          .get();

      for (var doc in querySnapshot.docs) {
        studentName.add(doc['studentName'].toString());
        studentEmail.add(doc['studentEmail'].toString());
        scheduleID.add(doc['scheduleID'].toString());
      }

      if (studentName.isNotEmpty && studentEmail.isNotEmpty) {
        print(",......${studentEmail.length}");
        allStudent.value.add(studentName);
        allStudent.value.add(studentEmail);
        allStudent.value.add(scheduleID);
        isStudentListCheck.value = true;
      }
      DialogBuilder(context).hideOpenDialog();
    } on Exception catch (e) {
      toastmessage("Exception : ${e.toString()}");
      isStudentListCheck.value = false;

      DialogBuilder(context).hideOpenDialog();
    }
  }

  getTeacherScheduleS({id, getData, context}) async {
    List<String> startTime = [];
    List<String> endTime = [];
    List<List> allData = [];
    List<String> allId = [];
    List<String> allScheduleID = [];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Teachers Teaching schedule')
          .where('id', isEqualTo: id)
          .get();
      for (var doc in querySnapshot.docs) {
        startTime.add(doc['startDate'].toString());
        endTime.add(doc['endDate'].toString());
        allId.add(doc['id'].toString());
        allScheduleID.add(doc['scheduleID'].toString());
      }
      if (startTime.isNotEmpty && endTime.isNotEmpty) {
        allData.add(startTime);
        allData.add(endTime);
        allData.add(allId);
        allData.add(allScheduleID);
        print('..........hsjdfhkjsdhf.........${allData.toString()}.....}');

        getData(allData);
      }
    } on Exception catch (e) {
      print("...........${e.toString()}..");
    }
  }

  bookteacherSchedule(context, list) async {
    DialogBuilder(context).showLoadingIndicator();
    print(".......................>>${list.toString()}");
    try {
      var isCheckd = await checkAlreadyBooked(context, list[1]);

      if (!isCheckd) {
        getStudentinfo(context, (result) async {
          DocumentReference store =
          await firestore.collection("Book Teachers Schedule").doc();

          store.set({
            'idTeacher': "${list[0]}",
            'scheduleID': list[1],
            'studentEmail': "${result['email']}",
            'idStudent': "${result['id']}",
            'studentName': "${result['name']}",
          }).then((value) =>
          {
            toastmessage("Successful book", color: Colors.green),
            print(".....doc id.........${store.id}"),

              DialogBuilder(context).hideOpenDialog(),
          Navigator.of(context).pop(),

          });
        });
      }else{
        DialogBuilder(context).hideOpenDialog();
        toastmessage("This time slot is already booked.");

      }
    } on Exception catch (e) {
      DialogBuilder(context).hideOpenDialog();
    toastmessage("Exception : ${e}");
    }
  }

  getStudentinfo(context, Function? result) async {
    try {
      DialogBuilder(context).showLoadingIndicator();

      var data = await preference.getSecureData(SharedPrefKey.SELECTEDROLE);
      var user = auth.currentUser?.uid;
      final querySnapshot = await FirebaseFirestore.instance
          .collection(data.toString())
          .where('id', isEqualTo: "${user.toString()}")
          .get();
      Map<String, String> myMap = {};

      for (var doc in querySnapshot.docs) {
        myMap["email"] = "${doc['email']}";
        myMap["id"] = "${doc['id']}";
        myMap["name"] = "${doc['name']}";
      }
      DialogBuilder(context).hideOpenDialog();
      if (result != null) {
        toastmessage("Successful", color: Colors.white);

        result(myMap);
      }
    } on Exception catch (e) {
      toastmessage("Exception : ${e.toString()}");
      DialogBuilder(context).hideOpenDialog();
    }
  }

  checkAlreadyBooked(context, String? id) async {
    var userId= auth.currentUser?.uid;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Book Teachers Schedule')
        .where('scheduleID', isEqualTo: id)
        .get();


    if (snapshot.docs != null && snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        if(doc['scheduleID']==id&&doc['idStudent']==userId){
        return true;
      }else{

          return false;
          Navigator.of(context).pop();

        }
      }
    }

    else{
      Navigator.of(context).pop(); //

      return false;}
  }
}
