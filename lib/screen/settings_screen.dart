import 'package:flutter/material.dart';
import 'package:random_number_create/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: maxNumber
                      .toInt()
                      .toString()
                      .split('')
                      .map(
                        (e) => Image.asset(
                          'asset/img/$e.png',
                          width: 50,
                          height: 70,
                        ),
                      )
                      .toList(),
                ),
              ),
              Slider(
                  value: maxNumber, // maxNumber로 재빌드!
                  min: 10000,
                  max: 1000000,
                  onChanged: (double val) {
                    setState(() {
                      maxNumber = val;
                    });
                  }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: RED_COLOR,
                ),
                onPressed: () {
                  Navigator.of(context).pop(maxNumber.toInt());
                },
                child: Text('저장!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
