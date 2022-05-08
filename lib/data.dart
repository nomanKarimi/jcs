
import 'package:jcs/models/notification_demo.dart';
import 'package:jcs/models/volunteer_demo.dart';

import 'models/orderItem.dart';


// foods data

// order items
List<EventDemo> events = [
  EventDemo(imgPath: 'assets/volunteer.png',title: 'Help elders',isAccepted: true,exDate: 'March 20, 2022',time: '11:00 AM'),
  EventDemo(imgPath: 'assets/workers.png',title: 'Planting trees',isAccepted: true,exDate: 'March 20, 2022',time: '11:00 AM'),
];
List<EventDemo> orderItem = [
  EventDemo(imgPath: 'assets/clean_valunteer.png',title: 'Planting trees',isAccepted: true,exDate: 'March 20, 2022',time: '11:00 AM'),
];

// delivery items

List<NotificationData> notifications = [
  NotificationData(message: 'Accepted activity'),
  NotificationData(message: 'New trophy'),
  NotificationData(message: 'New Update'),
];

List<VolunteerDemo> volunteers = [
  VolunteerDemo(name: 'Mohammad khalaleer',age: '22',skill:'developer',lName: 'Khaleel',imgPath: 'assets/ellipsis.png',userName: '@khaleel'),
  VolunteerDemo(name: 'Mohammad yaser',age: '22',lName: 'Noman',skill:'developer',imgPath: 'assets/ellipsis1.png',userName: '@Sami'),
  VolunteerDemo(name: 'The governer',age: '22',skill:'developer',lName: 'Firoz',imgPath: 'assets/ellipsis2.png',userName: '@Yousuf'),
];