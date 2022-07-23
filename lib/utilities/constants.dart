import 'package:flutter/material.dart';

const kScaffoldBackgroundColor = Color(0xff11131b);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: const Color(0xff1f1f1f),
  hintText: 'Your Name',
  hintStyle: TextStyle(color: Color(0xff62676e)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(35.0),
    ),
    borderSide: BorderSide.none,
  ),
);

final kBookAndPayContainer = BoxDecoration(
  color: const Color(0xff1f1f1f),
  borderRadius: BorderRadius.circular(20),
  boxShadow: const [
    BoxShadow(
      color: Color(0xff00ffba),
      offset: Offset(0, 0),
      blurRadius: 5, //change done
      spreadRadius: 0.4, //change done
    ),
    BoxShadow(
      color: Colors.black,
      offset: Offset(-2, -2), //change done
      blurRadius: 5, //change done
    )
  ],
);

List checkListItems = [
  {
    "id": 0,
    "value": false,
    "title": "UPI",
  },
  {
    "id": 0,
    "value": false,
    "title": "Cash",
  },
  {
    "id": 0,
    "value": false,
    "title": "Net Banking",
  },
  {
    "id": 0,
    "value": false,
    "title": "Credit/Debit Card",
  },
];

var kSlots = [
  {'id': 1, 'time': '9-9:30', 'slotNumber': '01', 'clicked': false},
  {'id': 2, 'time': '9:30-10', 'slotNumber': '02', 'clicked': false},
  {'id': 3, 'time': '9-9:30', 'slotNumber': '03', 'clicked': false},
  {'id': 4, 'time': '10:30-11', 'slotNumber': '04', 'clicked': false},
  {'id': 5, 'time': '11-11:30', 'slotNumber': '05', 'clicked': false},
  {'id': 6, 'time': '11:30-12', 'slotNumber': '06', 'clicked': false},
  {'id': 7, 'time': '12-12:30', 'slotNumber': '07', 'clicked': false},
  {'id': 8, 'time': '12:30-1', 'slotNumber': '08', 'clicked': false},
  {'id': 9, 'time': '1-1:30', 'slotNumber': '09', 'clicked': false},
  {'id': 10, 'time': '1:30-2', 'slotNumber': '10', 'clicked': false},
  {'id': 11, 'time': '9-9:30', 'slotNumber': '11', 'clicked': false},
  {'id': 12, 'time': '9:30-10', 'slotNumber': '12', 'clicked': false},
  {'id': 13, 'time': '9-9:30', 'slotNumber': '13', 'clicked': false},
  {'id': 14, 'time': '10:30-11', 'slotNumber': '14', 'clicked': false},
  {'id': 15, 'time': '11-11:30', 'slotNumber': '15', 'clicked': false},
  {'id': 16, 'time': '11:30-12', 'slotNumber': '16', 'clicked': false},
  {'id': 17, 'time': '12-12:30', 'slotNumber': '17', 'clicked': false},
  {'id': 18, 'time': '12:30-1', 'slotNumber': '18', 'clicked': false},
  {'id': 19, 'time': '1-1:30', 'slotNumber': '19', 'clicked': false},
  {'id': 20, 'time': '1:30-2', 'slotNumber': '20', 'clicked': false},
];

const bookingItemList = [
  {
    'car_iamge': 'assets/images/lambo.png',
    'car_name': 'Lamborghini Sian',
    'booking_date': '2/2/2022',
    'booking_time': '9:30 pm',
    'power': '50KwH',
    'price': '852',
  },
  {
    'car_iamge': 'assets/images/lambo.png',
    'car_name': 'Lamborghini Sian',
    'booking_date': '2/2/2022',
    'booking_time': '9:30 pm',
    'power': '50KwH',
    'price': '852',
  },
  {
    'car_iamge': 'assets/images/lambo.png',
    'car_name': 'Lamborghini Sian',
    'booking_date': '2/2/2022',
    'booking_time': '9:30 pm',
    'power': '50KwH',
    'price': '852',
  },
  {
    'car_iamge': 'assets/images/lambo.png',
    'car_name': 'Lamborghini Sian',
    'booking_date': '2/2/2022',
    'booking_time': '9:30 pm',
    'power': '50KwH',
    'price': '852',
  },
  {
    'car_iamge': 'assets/images/lambo.png',
    'car_name': 'Lamborghini Sian',
    'booking_date': '2/2/2022',
    'booking_time': '9:30 pm',
    'power': '50KwH',
    'price': '852',
  }
];
