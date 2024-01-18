import '../UI/UI_Widgets/item_cards.dart';

class Urls{

  static const String _baseUrl='https://task.teamrabbil.com/api/v1';
  static const String registration='$_baseUrl/registration';
  static const String login="$_baseUrl/login";
  static const String createTask="$_baseUrl/createTask";
  static const String listTask="$_baseUrl/listTaskByStatus/New";
  static const String progressTask="$_baseUrl/listTaskByStatus/Progress";
  static const String taskCount="$_baseUrl/taskStatusCount";
  static  String getNewTask="$_baseUrl/listTaskByStatus/${TaskStatus.New.name}";
  static  String getProgressTask="$_baseUrl/listTaskByStatus/${TaskStatus.Progress.name}";
  static  String getCompletedTask="$_baseUrl/listTaskByStatus/${TaskStatus.Completed.name}";
  static  String getCanceledTask="$_baseUrl/listTaskByStatus/${TaskStatus.Canceled.name}";
  static const String UpdateProfile="$_baseUrl/profileUpdate";
  static  String updateTaskStatus(String taskId,String status)=>"$_baseUrl/updateTaskStatus/$taskId/$status";

}