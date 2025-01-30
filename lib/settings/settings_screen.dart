import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final providerTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Settings', style: TextStyle(fontSize: 40)),
              Text('Settings Page', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                  'UserName value from Provider with read(): ${context.read<UserProvider>().userName}'),
              const SizedBox(height: 10),
              Text(
                  'UserName value from Provider with watch() realtime: ${context.watch<UserProvider>().userName}'),
              const SizedBox(height: 10),
              TextField(
                controller: providerTextFieldController,
                decoration: const InputDecoration(
                  hintText: 'Enter new value of Provider text',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<UserProvider>().updateUserName(
                      userName: providerTextFieldController.text.toString());
                  FocusScope.of(context).unfocus();
                  providerTextFieldController.clear();
                },
                child: Text('Update Provider Value'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
