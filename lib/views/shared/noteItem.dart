
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quicknotes/models/note.dart';
import 'package:quicknotes/views/shared/appstyle.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  final int index;
  final double screenWidth;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const NoteCard({
    Key? key,
    required this.note,
    required this.onDelete,
    required this.index,
    required this.screenWidth,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {

  @override
  Widget build(BuildContext context) {
    return widget.screenWidth > 600
        ? _buildWideNoteItem()
        : _buildCompactNoteItem();
  }

  String _getFormattedDate(DateTime dateTime) {
    // Format the date as needed using intl package
    return DateFormat('MMM d, yyyy - HH:mm').format(dateTime);
  }

  Widget _buildWideNoteItem() {
    Color backgroundColor = widget.index.isEven ? Constants().primaryColor: Color(0xC3E0DD);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: backgroundColor,
        child: InkWell(
          onTap: widget.onTap,
          child: ListTile(
            title: Text(
              widget.note.title,
              style: appstyle(20, widget.index.isEven ? Color(0xFFF9AD3D) : Constants().primaryColor, FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.note.content,
                  style: appstyle(12,
                      widget.index.isEven ? Colors.white : Constants().primaryColor,
                      FontWeight.normal),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 4),
                Text(
                  _getFormattedDate(widget.note.timestamp), // Display formatted timestamp
                  style: appstyle(12,
                      widget.index.isEven ? Colors.white : Constants().primaryColor,
                      FontWeight.bold),
                ),
              ],
            ),
            trailing: InkWell(
              child: Icon(Icons.delete, color: widget.index.isEven ? Color(0xFFF9AD3D) : Constants().primaryColor,),
              onTap: widget.onDelete,
            ),
          ),
        ),
      ),
    );
  }
  String _getCurrentDate(DateTime dateTime) {
    // Format the date as needed
    return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }

  Widget _buildCompactNoteItem() {
    Color backgroundColor = widget.index.isEven ? Color.fromARGB(240, 250, 233, 218): Color.fromARGB(240, 195, 224, 221);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: backgroundColor,
        child: InkWell(
          onTap: widget.onTap,
          child: ListTile(
            title: Text(
              widget.note.title,
              style: appstyle(20, Constants().primaryColor, FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.note.content,
                  style: appstyle(12,Constants().primaryColor, FontWeight.normal),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 4),
                Text(
                  _getFormattedDate(widget.note.timestamp), // Display formatted timestamp
                  style: appstyle(12, Constants().primaryColor ,FontWeight.normal),
                ),
              ],
            ),
            trailing: InkWell(
                child: Icon(Icons.delete, color: widget.index.isEven ? Color(0xFFF9AD3D) : Constants().primaryColor,),
                onTap: widget.onDelete,
              ),
          ),
        ),
      ),
    );
  }
}