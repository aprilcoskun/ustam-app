import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ustam/models/provider.dart';
import 'dart:math' as math;

const ligthText = TextStyle(fontWeight: FontWeight.w300);

class ProviderAbout extends StatelessWidget {
  final Provider provider;
  const ProviderAbout({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Info",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 12),
                  // TODO: Need advanced date formatting for this data
                  const Text("Last Seen: Yesterday"),
                  const Text("Avg. Response Time: 2 Hours"),
                  const Text("Last Delivery: 3 Days Ago"),
                  Text("Member since: ${DateFormat.yMMMM().format(provider.createdAt)}"),
                  const SizedBox(height: 12),
                ],
              ),
            )),
        Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 12),
                    Text(
                      "`${provider.description}`",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300, // light
                        fontStyle: FontStyle.italic, // italic
                      ),
                    )
                  ]),
            )),
        Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Skills / Expertises",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6.0,
                      runSpacing: 6.0,
                      children:
                          provider.skills.map((s) => _buildChip(s)).toList(),
                    )
                  ]),
            )),
        Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Education",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 12),
                    Text(provider.education["program"]),
                    const SizedBox(height: 4),
                    Text(provider.education["school"], style: ligthText),
                    const SizedBox(height: 4),
                    Text("Graduated ${provider.education["graduation_year"]}",
                        style: ligthText)
                  ]),
            )),
            Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Education",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 12),
                    Text(provider.education["program"]),
                    const SizedBox(height: 4),
                    Text(provider.education["school"], style: ligthText),
                    const SizedBox(height: 4),
                    Text("Graduated ${provider.education["graduation_year"]}",
                        style: ligthText)
                  ]),
            )),
            Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Education",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 12),
                    Text(provider.education["program"]),
                    const SizedBox(height: 4),
                    Text(provider.education["school"], style: ligthText),
                    const SizedBox(height: 4),
                    Text("Graduated ${provider.education["graduation_year"]}",
                        style: ligthText)
                  ]),
            )),
      ],
    ));
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }
}
