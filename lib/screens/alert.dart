class Alert {
   String? title;
  String ?subject;
 DateTime ?time;

  Alert({this.title, this.subject, this.time});
}

List<Alert> recentAlerts = [
  Alert(
    title: "Drawing Competition",
    subject: "For class V to VII",
    time: DateTime.parse("2020-06-06 12:30:00"),
  ),
  Alert(
    title: "Sports",
    subject: "Must participate all students",
    time: DateTime.parse("2020-06-06 14:30:00"),
  ),
];