import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  bool isTextIncreaseClicked = false;
  bool isTextDecreaseClicked = false;
  bool isBoldClicked = false;
  bool isItalicClicked = false;
  bool isUnderlineClicked = false;
  bool isStrikethroughClicked = false;
  bool isListClicked = false;
  bool isCenterAlignmentClicked = false;
  bool isRightAlignmentClicked = false;
  bool isJustifyAlignmentClicked = false;

  TextAlign textAlign = TextAlign.start;
  double fontSize = 18.0;

  Widget buildUnorderedList() {
    return Text('⚈');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Formatter'), centerTitle: true, elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              style: const TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _bodyController,
                maxLines: 20,
                textAlign: textAlign,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isBoldClicked ? FontWeight.bold : FontWeight.normal,
                  fontStyle: isItalicClicked ? FontStyle.italic : FontStyle.normal,
                  decoration: TextDecoration.combine(
                    [
                      isUnderlineClicked ? TextDecoration.underline : TextDecoration.none,
                      isStrikethroughClicked ? TextDecoration.lineThrough : TextDecoration.none,
                    ],
                  ),
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80.0,
        color: Colors.black.withOpacity(0.05),
        alignment: Alignment.centerLeft,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          shrinkWrap: true,
          children: [
            /// text increase
            IconButton(
              onPressed: () {
                setState(() {
                  isTextDecreaseClicked = false;
                  isTextIncreaseClicked = true;
                  fontSize = fontSize + 1;
                });
              },
              icon: Icon(
                Icons.text_increase_rounded,
                color: isTextIncreaseClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// text decrease
            IconButton(
              onPressed: () {
                setState(() {
                  isTextIncreaseClicked = false;
                  isTextDecreaseClicked = true;
                  fontSize = fontSize - 1;
                });
              },
              icon: Icon(
                Icons.text_decrease_rounded,
                color: isTextDecreaseClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// bold
            IconButton(
              onPressed: () {
                setState(() {
                  isBoldClicked = !isBoldClicked;
                });
              },
              icon: Icon(
                Icons.format_bold_rounded,
                color: isBoldClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// italic
            IconButton(
              onPressed: () {
                setState(() {
                  isItalicClicked = !isItalicClicked;
                });
              },
              icon: Icon(
                Icons.format_italic_rounded,
                color: isItalicClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// underline
            IconButton(
              onPressed: () {
                setState(() {
                  isUnderlineClicked = !isUnderlineClicked;
                });
              },
              icon: Icon(
                Icons.format_underline_rounded,
                color: isUnderlineClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// strikethrough
            IconButton(
              onPressed: () {
                setState(() {
                  isStrikethroughClicked = !isStrikethroughClicked;
                });
              },
              icon: Icon(
                Icons.strikethrough_s_rounded,
                color: isStrikethroughClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// TODO: list
            /*IconButton(
              onPressed: () {
                setState(() {
                  isListClicked = !isListClicked;
                });
              },
              icon: Icon(
                Icons.list_rounded,
                color: isListClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),*/

            /// center alignment
            IconButton(
              onPressed: () {
                setState(() {
                  isCenterAlignmentClicked = !isCenterAlignmentClicked;
                  if (isCenterAlignmentClicked) {
                    isRightAlignmentClicked = false;
                    isJustifyAlignmentClicked = false;
                    textAlign = TextAlign.center;
                  } else {
                    textAlign = TextAlign.start;
                  }
                });
              },
              icon: Icon(
                Icons.format_align_center_rounded,
                color: isCenterAlignmentClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// right alignment
            IconButton(
              onPressed: () {
                setState(() {
                  isRightAlignmentClicked = !isRightAlignmentClicked;
                  if (isRightAlignmentClicked) {
                    isCenterAlignmentClicked = false;
                    isJustifyAlignmentClicked = false;
                    textAlign = TextAlign.end;
                  } else {
                    textAlign = TextAlign.start;
                  }
                });
              },
              icon: Icon(
                Icons.format_align_right_rounded,
                color: isRightAlignmentClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),

            /// justify alignment
            IconButton(
              onPressed: () {
                setState(() {
                  isJustifyAlignmentClicked = !isJustifyAlignmentClicked;
                  if (isJustifyAlignmentClicked) {
                    isCenterAlignmentClicked = false;
                    isRightAlignmentClicked = false;
                    textAlign = TextAlign.justify;
                  } else {
                    textAlign = TextAlign.start;
                  }
                });
              },
              icon: Icon(
                Icons.format_align_justify_rounded,
                color:
                    isJustifyAlignmentClicked ? Theme.of(context).primaryColorDark : Colors.black,
              ),
            ),
            const SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }
}
