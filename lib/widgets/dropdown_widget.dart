import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  //DropDownWidget({Key? key}) : super(key: key);
  final List dataList;
  final String text;
  DropDownWidget({required this.dataList, required this.text});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.dataList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff1f1f1f),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  const BoxShadow(
                    color: Color(0xff00ffba),
                    offset: Offset(2, 2),
                    blurRadius: 3, //Change done
                    spreadRadius: 0.4, //Change done
                  ),
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(-2, -2), //Change done
                    blurRadius: 3, //Change done
                  )
                ]),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: _selectedItem,
                items: widget.dataList
                    .map((item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (item) => setState(() {
                  _selectedItem = item as String?;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
