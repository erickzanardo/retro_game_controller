// ignore_for_file: public_member_api_docs

import 'package:example/nes_controller_page.dart';
import 'package:flutter/material.dart';

class ControllersList extends StatelessWidget {
  const ControllersList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro Game Controller',
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        NesControllerPage.route(),
                      );
                    },
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('NES'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
