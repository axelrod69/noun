import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class StationDetailsScreenButton extends StatefulWidget {
  //StationDetailsScreenButton({Key? key}) : super(key: key);
  final String text;
  final Function onPressed;

  StationDetailsScreenButton({required this.text, required this.onPressed});

  @override
  State<StationDetailsScreenButton> createState() =>
      _StationDetailsScreenButtonState();
}

class _StationDetailsScreenButtonState
    extends State<StationDetailsScreenButton> {
  var _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) => setState(() => _isElevated = true),
      onPointerDown: (_) {
        setState(() {
          _isElevated = false;

          //_isElevated = false;
        });
        widget.onPressed();
        // Timer(const Duration(milliseconds: 10000), widget.onPressed());
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
        decoration: BoxDecoration(
            color: kScaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _isElevated == true
                ? [
                    BoxShadow(
                      color: Color(0xff1b1e2b),
                      offset: Offset(-2, -2), //Change done
                      blurRadius: 3, //Change done
                    ),
                    BoxShadow(
                      color: Color(0xff07080b),
                      offset: Offset(2, 2), //Change done
                      blurRadius: 3, //Change done
                    ),
                  ]
                : null),
        child: Text(
          widget.text,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 15.0),
        ),
      ),
    );
  }
}
