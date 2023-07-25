// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:retro_game_controller/retro_game_controller.dart';

class NesControllerPage extends StatefulWidget {
  const NesControllerPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NesControllerPage(),
    );
  }

  @override
  State<NesControllerPage> createState() => _NesControllerPageState();
}

class _NesControllerPageState extends State<NesControllerPage> {
  final List<NesButton> _pressedButtons = [];

  @override
  Widget build(BuildContext context) {
    return RetroGameControllerListerner<NesButton>(
      mapping: nesMapping,
      onEvent: ({
        required NesButton button,
        required String controllerId,
        required EventType type,
      }) {
        if (type == EventType.down) {
          setState(() {
            _pressedButtons.add(button);
          });
        } else {
          setState(() {
            _pressedButtons.remove(button);
          });
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(
            color: const Color(0xFFd8d8da),
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 36,
            ),
            width: 400,
            height: 180,
            child: ColoredBox(
              color: const Color(0xff37383a),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 20,
                          bottom: 20,
                          left: 40,
                          right: 40,
                          child: ColoredBox(
                            color: Color(0xFF000000),
                          ),
                        ),
                        const Positioned(
                          top: 50,
                          bottom: 50,
                          left: 10,
                          right: 10,
                          child: ColoredBox(
                            color: Color(0xFF000000),
                          ),
                        ),
                        if (_pressedButtons.contains(NesButton.left))
                          const Positioned(
                            top: 50,
                            bottom: 50,
                            left: 10,
                            child: ColoredBox(
                              color: Color(0xFFFFFFFF),
                              child: SizedBox(width: 20),
                            ),
                          ),
                        if (_pressedButtons.contains(NesButton.right))
                          const Positioned(
                            top: 50,
                            bottom: 50,
                            right: 10,
                            child: ColoredBox(
                              color: Color(0xFFFFFFFF),
                              child: SizedBox(width: 20),
                            ),
                          ),
                        if (_pressedButtons.contains(NesButton.up))
                          const Positioned(
                            top: 20,
                            left: 40,
                            child: ColoredBox(
                              color: Color(0xFFFFFFFF),
                              child: SizedBox(width: 28, height: 20),
                            ),
                          ),
                        if (_pressedButtons.contains(NesButton.down))
                          const Positioned(
                            bottom: 20,
                            left: 40,
                            child: ColoredBox(
                              color: Color(0xFFFFFFFF),
                              child: SizedBox(width: 28, height: 20),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF9c9b99),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF9c9b99),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF9c9b99),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'SELECT',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: const Color(0xFFde0408),
                                      ),
                                ),
                                Text(
                                  'START',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: const Color(0xFFde0408),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFe3e3e3),
                              border: Border.all(
                                width: 4,
                                color: const Color(0xFFdedee0),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _pressedButtons
                                              .contains(NesButton.select)
                                          ? Colors.white
                                          : const Color(0xFF3a3b3d),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _pressedButtons
                                              .contains(NesButton.start)
                                          ? Colors.white
                                          : const Color(0xFF3a3b3d),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF9c9b99),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Retro Game Controller',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: const Color(0xFFde0408),
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              _ActionButton(
                                label: 'B',
                                pressed: _pressedButtons.contains(NesButton.b),
                              ),
                              const SizedBox(width: 8),
                              _ActionButton(
                                label: 'A',
                                pressed: _pressedButtons.contains(NesButton.a),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.pressed,
  });

  final String label;
  final bool pressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Align(
            child: Container(
              width: 50,
              height: 50,
              color: const Color(0xFFded7de),
              padding: const EdgeInsets.all(4),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: pressed ? Colors.white : const Color(0xFFd7011b),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: const Color(0xFFde0408),
              ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
