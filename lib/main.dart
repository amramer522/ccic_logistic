import 'package:ccic_g1_2026_flutter/views/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/logic/helper_methods.dart';

late SharedPreferences prefs;

void main() async {
  await ScreenUtil.ensureScreenSize();
  prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLight;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(852, 393),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navKey,
          home: prefs.getBool('isLogin') == true ? LoginView() : LoginView(),
          // themeMode: isLight == null
          //     ? ThemeMode.system
          //     : isLight == true
          //     ? ThemeMode.light
          //     : ThemeMode.dark,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1C3877)),
            scaffoldBackgroundColor: Color(0xffF3F5F9),
            appBarTheme: AppBarThemeData(centerTitle: true),
            textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 14.sp)),
            cardTheme: CardThemeData(
              color: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            ),
            dividerTheme: DividerThemeData(color: Colors.red, thickness: 10),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                fixedSize: Size.fromHeight(52),
                backgroundColor: Color(0xff1C3877),
                disabledBackgroundColor: Color(0xff0063E6).withValues(alpha: .40),
                disabledForegroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationThemeData(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),

          darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 14)),
            cardTheme: CardThemeData(
              color: Colors.red,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            ),
            appBarTheme: AppBarThemeData(backgroundColor: Colors.transparent),
            dividerTheme: DividerThemeData(color: Colors.red, thickness: 10),
            inputDecorationTheme: InputDecorationThemeData(border: OutlineInputBorder()),
          ),
        );
      },
    );
  }
}

// MaterialApp
// Scaffold
// AppBar
// Drawer
// SafeArea
// Text
// Center
// Align
// TextField
// TextFormField
// Icon
// FilledButton
// Row
// Column
// Stack
// Container
// Divider
// SizedBox
// VerticalDivider
// CircleAvatar
// OutlinedButton
// ElevatedButton
// IconButton
// Padding
// SingleChildScrollView
// Spacer
// Expanded
// DecoratedBox
// DropdownButton
// CircularProgressIndicator
// Directionality
// FloatingActionButton
// LinearProgressIndicator
// CupertinoActivityIndicator
// Switch
// RadioGroup
// Radio
// Slider
// Checkbox
// ListTile
// Card
// RadioListTile
// SwitchListTile
// GestureDetector
// InkWell
// Builder
// StatefulBuilder
// Image.network
// ClipRRect
// ClipOval
// PageView
// IgnorePointer
// IntrinsicHeight
// Form
// BottomSheet
// Image.asset
// Transform.rotate
// BottomNavigationBar
// ListView.builder
// ListView.separated
// DefaultTabController
// TabBar
// TabBarView
// Tab
// Badge
// Banner
// Positioned
// Chip
