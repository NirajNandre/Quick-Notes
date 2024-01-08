import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quicknotes/controller/note_provider.dart';
import 'package:quicknotes/models/note.dart';
import 'package:quicknotes/views/UI/addPage.dart';
import 'package:quicknotes/views/shared/BottomNavBar.dart';
import 'package:quicknotes/views/shared/appstyle.dart';
import 'package:quicknotes/views/shared/noteItem.dart';
import 'package:provider/provider.dart';


class homePage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const homePage({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 4,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            icon: Icon(MdiIcons.menu, size: 35,color: Constants().primaryColor,), // Four-dot menu icon
            onPressed: () {
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Constants().primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(22))
              ),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFF9AD3D),
                radius: 22,
                child: Text("N", style: appstyle(20, Constants().primaryColor, FontWeight.bold),),
              ),
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quick Notes", style: appstyle(25, Constants().primaryColor, FontWeight.bold),)
          ],
        ),
        centerTitle: true,
      ),
      body: _buildNotesList(context),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Constants().primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(17))
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          backgroundColor: const Color(0xFFF9AD3D),
          child: const Icon(Icons.add, size: 30,),
        ),
      ),
      bottomNavigationBar: BottomNavBar(navigatorKey: widget.navigatorKey),
    );
  }

  Widget _buildNotesList(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<NoteController>(
      builder: (context, noteController, child) {
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/circle-scatter-haikei.png', // Replace with the path to your image
                fit: BoxFit.fitHeight,
              ),
            ),
            // Notes List (non-scrollable)
            ListView.builder(
              itemCount: noteController.notes!.length, // Non-scrollable
              itemBuilder: (context, index) {
                return screenWidth > 600
                    ? _buildWideNoteCard(context, noteController.notes[index], index)
                    : _buildCompactNoteCard(noteController.notes[index], index, context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildWideNoteCard(BuildContext context, Note note, int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    return NoteCard(
      note: note,
      index: index,
      onDelete: () {
        Provider.of<NoteController>(context, listen: false).deleteNote(index);
      },
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPage(index: index),
          ),
        );

        if (result != null && result is Note) {
          Provider.of<NoteController>(context, listen: false).editNote(index, result);
        }
      },
      screenWidth: screenWidth ,
    );
  }

  Widget _buildCompactNoteCard(Note note, int index, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return NoteCard(
      note: note,
      index: index,
      onDelete: () {
        Provider.of<NoteController>(context, listen: false).deleteNote(index);
      },
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPage(index: index),
          ),
        );

        if (result != null && result is Note) {
          Provider.of<NoteController>(context, listen: false).editNote(index, result);
        }
      },
      screenWidth: screenWidth,
    );
  }
}
