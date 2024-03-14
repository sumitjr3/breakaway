// ignore: unused_import
import 'dart:math';

import 'package:breakaway/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HobbiesView extends StatefulWidget {
  const HobbiesView({Key? key}) : super(key: key);

  @override
  _HobbiesView createState() => _HobbiesView();
}

class _HobbiesView extends State<HobbiesView> {
  final List<String> _interests = [
    '⚽ Football',
    '🏏 Cricket',
    '🏑 Hockey',
    '🎾 Tennis',
    '♟ Chess',
    '🏐 Volleyball',
    '🏸 Badminton',
    '🏓 Table Tennis',
    '🎳 Bowling',
    '🏉 Rugby',
  ];

  final List<String> _selectedInterests = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEDDD),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child:
                    SvgPicture.asset('assets/Logo.svg', width: 80, height: 80),
              ),
              const SizedBox(
                height: 70,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What topics are you most intrested?',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _interests
                      .map(
                        (interest) => FilterChip(
                          label: Text(interest),
                          selected: _selectedInterests.contains(interest),
                          onSelected: (isSelected) {
                            setState(() {
                              if (isSelected) {
                                _selectedInterests.add(interest);
                              } else {
                                _selectedInterests.remove(interest);
                              }
                            });
                          },
                          shape: _selectedInterests.contains(interest)
                              ? const StadiumBorder(
                                  side: BorderSide(
                                      color: Color(0xFF7149C6), width: 2),
                                )
                              : RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                          showCheckmark: false,
                          backgroundColor: const Color(0xFFFFDEB9),
                          selectedColor: const Color(0xFFFFDEB9),
                        ),
                      )
                      .toList(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(signupRoute);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7149C6),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
