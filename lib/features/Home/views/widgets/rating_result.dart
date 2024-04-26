import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/features/Home/views/widgets/rating_slider.dart';

class RatingResult extends StatefulWidget {
  const RatingResult(
      {super.key,
      required this.name,
      required this.title,
      required this.rating});
  final String name, title;
  final double rating;
  @override
  State<RatingResult> createState() => _RatingResultState();
}

class _RatingResultState extends State<RatingResult> {
  Color color = Colors.red;
  String text = 'good';
  IconData icon = Icons.done;
  @override
  void initState() {
    super.initState();
    if (widget.rating <= 4) {
      color = Colors.red;
      icon = Icons.close;
      text = 'bad';
    } else if (widget.rating >= 4 && widget.rating < 7) {
      color = Colors.amberAccent;
      text = 'normal';
    } else if (widget.rating > 7 && widget.rating <= 10) {
      color = Colors.green;
      text = 'very good';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Text(
            widget.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: kPrimary),
          ),
          RatingSlider(
            rating: widget.rating,
            title: widget.title,
            color: color,
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
