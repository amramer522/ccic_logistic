import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Badge(
            alignment: AlignmentDirectional.bottomStart,
            smallSize: 15,
            label: SizedBox(),
            offset: Offset(0, -10),
            backgroundColor: Color(0xff16A34A),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xffE7EEFE),
                  width: 4,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(
                  'https://img.magnific.com/premium-photo/saudi-man-wearing-traditional-white-thobe-red-shemagh-isolated-green-background_99297-1511.jpg?semt=ais_hybrid&w=740&q=80',
                ),
              ),
            ),
          ),
          title: Text(
            'Good morning,',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          subtitle: Text(
            'Majed Abdullah',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        toolbarHeight: 100,
        flexibleSpace: Container(decoration: BoxDecoration(color: Color(0xff1C3877))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).copyWith(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Trip',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff01031A),
              ),
            ),
            Container(
              height: 2,
              width: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1C3877), Color(0xffF3F5F9)],
                  stops: [.38, .90],
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/current_trip_card_bg.png'),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.directional(
                    textDirection: TextDirection.rtl,
                    start: -20,
                    top: 50,
                    child: Image.asset('assets/images/car.png', width: 165, height: 109),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Chip(
                          label: Text(
                            'In Progress'.toUpperCase(),
                            style: TextStyle(
                              color: Color(0xff1C3877),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(44),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'TR-2051',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/from_to_step.png',
                              height: 77,
                              width: 24,
                              fit: BoxFit.fitHeight,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                // color: Colors.red,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        'Al Olaya, Riyadh',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Pickup',
                                        style: TextStyle(
                                          color: Color(0xff7F8590),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      title: Text(
                                        'Al Rawdah, Jeddah',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Delivery',
                                        style: TextStyle(
                                          color: Color(0xff7F8590),
                                          fontSize: 12,
                                        ),
                                      ),
                                      trailing: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffB8B8B8).withValues(alpha: .4),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 4),
                                              color: Colors.black.withValues(alpha: .25),
                                              spreadRadius: 0,
                                              blurRadius: 16,
                                              blurStyle: BlurStyle.outer,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: TextButton.icon(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            visualDensity: VisualDensity.compact,
                                            padding: EdgeInsets.symmetric(horizontal: 6),
                                          ),
                                          iconAlignment: IconAlignment.end,
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          label: Text(
                                            'View Details',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Upcoming Trip',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff01031A),
              ),
            ),
            Container(
              height: 2,
              width: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1C3877), Color(0xffF3F5F9)],
                  stops: [.38, .90],
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: BorderDirectional(start: BorderSide(color: Color(0xff01031A))),
                image: DecorationImage(
                  image: AssetImage('assets/images/up_coming_trips.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Chip(
                        label: Text(
                          'Upcoming'.toUpperCase(),
                          style: TextStyle(
                            color: Color(0xff1C3877),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        backgroundColor: Color(0xff1444AE).withValues(alpha: .1),
                        labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(44),
                          side: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'TR-2051',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff01031A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text('Fahad Salem'),
                    contentPadding: EdgeInsets.zero,
                    subtitle: Row(
                      children: [
                        Text(
                          'Al Aziziyah, Jeddah',
                          style: TextStyle(fontSize: 12, color: Color(0xff43474E)),
                        ),
                        Icon(Icons.arrow_forward, size: 9, color: Color(0xff6B7280)),
                        Text(
                          'Al Malaz, Riyadh',
                          style: TextStyle(fontSize: 12, color: Color(0xff43474E)),
                        ),
                      ],
                    ),
                    leading: Image.asset('assets/images/client_shipped.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '- ' * 100,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xff374151).withValues(alpha: .5),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.schedule, color: Color(0xff1C3877), size: 20),
                      SizedBox(width: 6),
                      Text(
                        'ETA',
                        style: TextStyle(
                          color: Color(0xff1C3877),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '12 Aug 2026  12:00 PM',
                        style: TextStyle(
                          color: Color(0xff6F767E),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff1C3877),
                          size: 16,
                        ),
                        backgroundColor: Color(0xff1444AE).withValues(alpha: .05),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
