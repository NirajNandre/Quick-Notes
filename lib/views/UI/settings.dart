import 'package:flutter/material.dart';
import 'package:quicknotes/views/shared/appstyle.dart';
import 'package:quicknotes/views/shared/customItem.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {

    bool isAddToBottom = true;
    bool isMoveToBottom = true;
    bool isDisplayPreviews = true;
    bool isSharingEnabled = true;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 4,
        titleSpacing: 22,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: Icon(Icons.arrow_back, color: Colors.black,size: 25,),
        ),
        title: Text("Settings", style: appstyle(22, Colors.black, FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text("Display Options", style: appstyle(18, Colors.black, FontWeight.w600),),
            ),
            CustomItem(
                label: "Add new items to bottom",
              isToggleOn: isAddToBottom,
              onToggle: (value) {
                setState(() {
                  isAddToBottom = value;
                });
              },
            ),
            CustomItem(
              label: "Move checked items to bottom",
              isToggleOn: isMoveToBottom ,
              onToggle:(value){
                setState(() {
                  isMoveToBottom = value;
                });
              },
            ),
            CustomItem(
              label: "Display rick link previews",
              isToggleOn: isDisplayPreviews,
              onToggle:(value){
                setState(() {
                  isDisplayPreviews = value;
                });

              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Theme", style: appstyle(15, Colors.black, FontWeight.w400),),
                  Text("System default", style: appstyle(15, Colors.black, FontWeight.w400),),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text("Reminder defaults", style: appstyle(18, Colors.black, FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Morning", style: appstyle(15, Colors.black, FontWeight.w400),),
                  Text("8:00 AM", style: appstyle(15, Colors.black, FontWeight.w400),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Afternoon", style: appstyle(15, Colors.black, FontWeight.w400),),
                  Text("1:00 PM", style: appstyle(15, Colors.black, FontWeight.w400),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Evening", style: appstyle(15, Colors.black, FontWeight.w400),),
                  Text("6:00 PM", style: appstyle(15, Colors.black, FontWeight.w400),),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text("Sharing", style: appstyle(18, Colors.black, FontWeight.w600),),
            ),
            CustomItem(
              label: "Enable sharing",
              isToggleOn: isSharingEnabled,
              onToggle:(value){
                setState(() {
                  isSharingEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
