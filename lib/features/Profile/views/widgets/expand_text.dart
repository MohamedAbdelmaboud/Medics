import 'package:flutter/material.dart';

class ExpandText extends StatefulWidget {
  const ExpandText({super.key, required this.sentence, required this.title});
  final String sentence;
  final String title;
  @override
  _ExpandTextState createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            onHighlightChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isTapped
                  ? isExpanded
                      ? 65
                      : 70
                  : isExpanded
                      ? 225
                      : 230,
              width: isExpanded ? 385 : 390,
              decoration: BoxDecoration(
                color: const Color(0xffF4EAE6),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 37, 32, 44).withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: isTapped
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.black,
                              size: 27,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          isTapped ? '' : widget.sentence,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
