import 'package:get/get.dart';

import '../../exam_degree.dart';
import '../../student_attend.dart';
import '../../student_ride.dart';
import '../../student_salary.dart';

String? vinputphne(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  } else if (input.length < 11) {
    return 'This is short';
  }
  return null;
}

String? vinputpassword(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  } else if (input.length < 6) {
    return 'Must be grater than 6 latters';
  }
  return null;
}

String? vinputname(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  }
  return null;
}

moveScreens(int index) {
  if (index == 2) {
    Get.to(StudentAttend());
  }
  if (index == 3) {
    Get.to(const ExamDegree());
  }
  if (index == 5) {
    Get.to(const StudentSalary());
  }
  if (index == 4) {
    Get.to(const StudentDriver());
  }
}
