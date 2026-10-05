import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final list = [
    NotificationModel(
      title: 'New Trip Assigned',
      body: 'You have been assigned a new trip\nTR-2060.',
      time: '10:30 AM',
      type: NotificationType.newTrip,
      isRead: false,
    ),
    NotificationModel(
      title: 'Trip Cancelled',
      body: 'Trip TR-2050 has been cancelled.\nPlease check your assigned trips.',
      time: '09:15 AM',
      type: NotificationType.tripCancelled,
      isRead: false,
    ),
    NotificationModel(
      title: 'Trip Cancelled',
      body: 'Trip TR-2050 status updated to In\nTransit.',
      time: '07:00 AM',
      type: NotificationType.tripUpdated,
      isRead: false,
    ),
    NotificationModel(
      title: 'Location Sharing',
      body: 'Your location is being shared\nsuccessfully.',
      time: 'Yesterday',
      type: NotificationType.locationSharing,
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 90,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1C3877), Color(0x991C3877)],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0x140A4AEB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(text: "All"),
                      Tab(text: "Unread"),
                      Tab(text: "Read"),
                    ],
                    unselectedLabelColor: Color(0xff1C3877),
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Color(0xff1C3877),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsetsDirectional.only(bottom: 16, top: 24),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) => _Item(model: list[index]),
                    itemCount: list.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final NotificationModel model;

  const _Item({super.key, required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  String get iconName {
    switch (widget.model.type) {
      case NotificationType.newTrip:
        return "trip_assigned.svg";
      case NotificationType.tripCancelled:
        return 'trip_canceled.svg';
      case NotificationType.tripUpdated:
        return 'trip_update.svg';
      case NotificationType.locationSharing:
        return 'location_sharing.svg';
    }
  }

  int get iconBGColor {
    switch (widget.model.type) {
      case NotificationType.newTrip:
        return 0xffEFF6FF;
      case NotificationType.tripCancelled:
        return 0xffF0FDF4;
      case NotificationType.tripUpdated:
        return 0xffFFF7ED;
      case NotificationType.locationSharing:
        return 0xffFAF5FF;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      onTap: () {
        widget.model.isRead = true;
        setState(() {});
      },
      contentPadding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Color(iconBGColor),
        child: SvgPicture.asset(
          'assets/icons/$iconName',
          height: 18,
          width: 22.5,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Row(
        children: [
          Text(
            widget.model.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff1C3877),
            ),
          ),
          Spacer(),
          Text(
            widget.model.time,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff718096),
            ),
          ),
          SizedBox(width: 8),
          if (!widget.model.isRead)
            CircleAvatar(radius: 4, backgroundColor: Color(0xff2B6CB0)),
        ],
      ),
      subtitle: Text(
        widget.model.body,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff718096),
        ),
      ),
    );
  }
}

class NotificationModel {
  final String title, body, time;
  final NotificationType type;
  bool isRead;

  NotificationModel({
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.isRead = true,
  });
}

enum NotificationType { newTrip, tripCancelled, tripUpdated, locationSharing }
