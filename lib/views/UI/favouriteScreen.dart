import 'package:flutter/material.dart';
import 'package:quicknotes/views/shared/appstyle.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


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
        title: Text("Favourite", style: appstyle(22, Colors.black, FontWeight.bold),),
      ),
      body: Center(
        child: Text("This is the Favourite\npage Which will use to \ndisplay the favourite or \npinned notes", style: appstyle(20, Colors.black, FontWeight.w600),textAlign: TextAlign.justify,),
      ),
    );
  }
}