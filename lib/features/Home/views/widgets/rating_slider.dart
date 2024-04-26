import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class RatingSlider extends StatefulWidget {
  final double rating;
  final String title;
  final Color color;
  const RatingSlider({
    Key? key,
    required this.rating,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RatingSliderState createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 6,
        ),
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 5,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
          ),
          child: Slider(
            value: _currentRating,
            min: 0,
            max: 10,
            onChanged: (double value) {},
            // label: _currentRating.toString(),
            activeColor: widget.color,
            inactiveColor: kSecondary,
            // semanticFormatterCallback: (double value) {
            //   return '$value stars';
            // },
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
