import 'package:flutter/material.dart';
import 'package:waveline/app/theme/font.dart';

class DoctorProfileWidget extends StatelessWidget {
  final String name;
  const DoctorProfileWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/img/doctor.png',
            width: 150,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Cardiologists',
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: h2Bold,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Record'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
