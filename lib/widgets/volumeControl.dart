import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

import '../constants.dart';
import '../size_config.dart';

class VolumeControl extends StatefulWidget {
  const VolumeControl({Key? key}) : super(key: key);

  @override
  State<VolumeControl> createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {

  double volume = 0.0;

  @override
  void initState() {
    super.initState();
    PerfectVolumeControl.hideUI = true;
    Future.delayed(Duration.zero, () async {
      volume = await PerfectVolumeControl.getVolume();
      setState(() {});
    });

    PerfectVolumeControl.stream.listen((newVolume) {
      setState(() => volume = newVolume);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defScreenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              volume = 0.0;
              PerfectVolumeControl.setVolume(volume);
              setState(() {});
            },
            child: const Icon(Icons.volume_off_rounded),
          ),
          SizedBox(
            width: getProporcionalWidth(260),
            child: Slider(
              value: volume,
              min: 0.0,
              max: 1.0,
              activeColor: kPrimaryLightColor,
              inactiveColor: const Color(0xBBB8B8B8),
              onChanged: (newVolume) {
                volume = newVolume;
                PerfectVolumeControl.setVolume(volume);
                setState(() {});
              },
            ),
          ),
          Icon(volume > 0.5 ? Icons.volume_up_rounded : Icons.volume_down_rounded),
        ],
      ),
    );
  }
}