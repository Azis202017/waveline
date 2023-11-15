import 'package:flutter/material.dart';

import '../../theme/font.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final String foto;
  const ProfileWidget({
    super.key,
    required this.name,
    required this.foto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '👋  Welcome',
                style: body2Regular,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                name,
                style: h2Bold,
              )
            ],
          ),
        ),
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: const Color.fromRGBO(172, 136, 111, 0.1),
          ),
          child: Image.asset(
            foto.isEmpty ? "assets/img/21.png" : foto,
            width: 120,
            height: 120,
          ),
        ),
      ],
    );
  }
}

