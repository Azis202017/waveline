import 'package:flutter/material.dart';

import '../../theme/font.dart';

class DeviceWidget extends StatelessWidget {
  final String? name;
  final void Function()? onPressed;

  const DeviceWidget({super.key, this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name != null
                          ? "Congratulation you connect to device: "
                          : "",
                      style: h4SemiBold,
                    ),
                    SizedBox(
                      height: name != null ? 8 : 0,
                    ),
                    Text(
                      name ?? "Device not connected",
                      style: h2SemiBold.copyWith(
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/img/device.png',
                width: 100,
                height: 100,
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 46,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                  name != null ? 'Connect to other device.' : 'Connect Device'),
            ),
          ),
        ],
      ),
    );
  }
}
