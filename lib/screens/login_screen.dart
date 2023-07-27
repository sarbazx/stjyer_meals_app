import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late RiveAnimationController _riveController;

  final _passwordController = TextEditingController();

  bool _isPlaying = false;

  late StateMachineController? controller;

  @override
  void initState() {
    super.initState();
    _riveController = OneShotAnimation(
      'bounce',
      autoplay: true,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  void onChanged(String val) {
    controller?.findInput('hands_up')?.change(true);
  }

  @override
  void dispose() {
    _riveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 300,
            child: RiveAnimation.asset(
              'assets/Login_Screen_Character.riv',
              stateMachines: const [
                'hands_down',
                'hands_up',
              ],
              onInit: (artboard) {
                controller = StateMachineController.fromArtboard(
                  artboard,
                  'look_idle',
                );
                if (controller == null) return;

                artboard.addController(controller!);
              },
              animations: const [
                'look_idle',
                // 'hands_down',
                // 'hands_up',
                'Look_down_right',
                'Look_down_left',
                'success',
              ],
              fit: BoxFit.cover,
              controllers: [_riveController],
            ),
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            controller: _passwordController,
          ),
        ),
      ],
    );
  }
}
