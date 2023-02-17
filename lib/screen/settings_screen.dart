import 'package:flutter/material.dart';
import 'package:random_number_create/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({Key? key, required this.maxNumber}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() { // build 실행 전, state 생성 전 실행
    // TODO: implement initState
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }
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
             _Body(maxNumber: maxNumber,),
              _Footer(onSlideChanged: onSlideChanged, maxNumber: maxNumber, onButtonPressed: onButtonPressed,),
            ],
          ),
        ),
      ),
    );
  }
  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
  void onSlideChanged(double val) { // valueChanged<double>? 필요
    setState(() {
      maxNumber = val;
    });
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({Key? key, required this.maxNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
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
    );
  }
}

class _Footer extends StatelessWidget {
  final ValueChanged<double>? onSlideChanged;
  final double maxNumber;
  final VoidCallback onButtonPressed;

  const _Footer({Key? key, this.onSlideChanged, required this.maxNumber, required this.onButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber, // maxNumber로 재빌드!
            min: 1000,
            max: 100000,
            onChanged: onSlideChanged,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: RED_COLOR,
          ),
          onPressed: onButtonPressed,
          child: Text('저장!'),
        ),
      ],
    );
  }
}
