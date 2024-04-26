import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en','1'), // English
        Locale('fa','98'), // Spanish
      ],
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getThemedata()
          : MyAppThemeConfig.light().getThemedata(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
        isDark: themeMode == ThemeMode.dark,
      ),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryColors = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0d000000),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getThemedata() {
    return ThemeData(
      primaryColor: primaryColors,
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appBarColor),
      dividerColor: surfaceColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColors),
          
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceColor,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          bodyText1: TextStyle(fontSize: 12, color: primaryTextColor),
          bodyText2: TextStyle(fontSize: 15, color: secondaryTextColor),
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final bool isDark;

  const MyHomePage({super.key, required this.toggleThemeMode, required this.isDark});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType { photoshop, adobeXd, illustrator, afterEffects, lightroom }

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;

  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          InkWell(
            onTap: () {
              widget.toggleThemeMode();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10 , 0 , 10 , 2),
              child: Icon(widget.isDark ? Icons.brightness_3 : Icons.brightness_7),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'asset/image/images.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Geralt of Revia',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: 3),
                        Text('I work in job witchers'),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location_solid,
                              size: 14,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            SizedBox(width: 2),
                            Text('Koer Morhen', style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(CupertinoIcons.heart, color: Theme.of(context).primaryColor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                'Geralt of Rivia (Polish: Geralt z Rivii) is a fictional character and the protagonist of The Witcher series of short stories and novels by Polish author Andrzej Sapkowski. He is a magically enhanced monster-hunter known as a "witcher", who possesses supernatural abilities due to his mutations.[1]',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 16, 0, 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Skills',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 3, height: 8),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 10,
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  SkillItem(
                    type: _SkillType.photoshop,
                    title: 'Photoshop',
                    imagePath: 'asset/image/app_icon_01.png',
                    isActive: _skill == _SkillType.photoshop,
                    shadowColor: Colors.blue,
                    onTap: () {
                      updateSelectedSkill(_SkillType.photoshop);
                    },
                  ),
                  SkillItem(
                    type: _SkillType.adobeXd,
                    title: 'Adobe XD',
                    imagePath: 'asset/image/app_icon_05.png',
                    isActive: _skill == _SkillType.adobeXd,
                    shadowColor: Colors.pink,
                    onTap: () {
                      updateSelectedSkill(_SkillType.adobeXd);
                    },
                  ),
                  SkillItem(
                    type: _SkillType.illustrator,
                    title: 'Illustrator',
                    imagePath: 'asset/image/app_icon_04.png',
                    isActive: _skill == _SkillType.illustrator,
                    shadowColor: Colors.orange.shade100,
                    onTap: () {
                      updateSelectedSkill(_SkillType.illustrator);
                    },
                  ),
                  SkillItem(
                    type: _SkillType.afterEffects,
                    title: 'After Effects',
                    imagePath: 'asset/image/app_icon_03.png',
                    isActive: _skill == _SkillType.afterEffects,
                    shadowColor: Colors.blue.shade800,
                    onTap: () {
                      updateSelectedSkill(_SkillType.afterEffects);
                    },
                  ),
                  SkillItem(
                    type: _SkillType.lightroom,
                    title: 'Lightroom',
                    imagePath: 'asset/image/app_icon_02.png',
                    isActive: _skill == _SkillType.lightroom,
                    shadowColor: Colors.blue,
                    onTap: () {
                      updateSelectedSkill(_SkillType.lightroom);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Save'),
                    ),
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

class SkillItem extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const SkillItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: defaultBorderRadius,
        )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              )
                  : null,
              child: Image.asset(
                imagePath,
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
