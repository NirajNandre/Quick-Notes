import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quicknotes/views/shared/appstyle.dart';
import 'package:quicknotes/views/shared/customBtn.dart';

class StartPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const StartPage({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: IconButton(
                        icon: Icon(MdiIcons.menu, size: 35,color: Colors.white,), // Four-dot menu icon
                        onPressed: () {
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 16.0),
                      child: Text(
                        'Create and record your notes easily',
                        style: appstyle(32, Colors.white, FontWeight.bold)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Capture your thoughts on the go with our efficient and intuitive note-taking app",
                          style: appstylewithHeight(12, Colors.white, FontWeight.normal, 1.5),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                     CustomBtn(label: "Get Started",
                       onTap: () {
                         Navigator.of(context).pushReplacementNamed('/home');
                       },
                     ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
