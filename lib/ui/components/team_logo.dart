import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamLogo extends StatelessWidget {
  final String subtitle;
  final String title;
  final String logoPath;
  final String networkLogoPath;

  const TeamLogo({
    super.key,
    required this.subtitle,
    required this.title,
    this.logoPath = '',
    this.networkLogoPath = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (logoPath.isNotEmpty)
            Image.asset(
              logoPath,
              fit: BoxFit.contain,
              height: 100,
            )
          else if (networkLogoPath.isNotEmpty)
            SvgPicture.network(
              networkLogoPath,
              fit: BoxFit.contain,
              height: 80,
            ),
          if (subtitle.isNotEmpty && title.isNotEmpty) ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
