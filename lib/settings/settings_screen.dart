import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/resources/constants.dart';
import '../utils/resources/styles.dart';
import '../utils/resources/strings.dart';
import '../providers/user_provider.dart';
import '../utils/widgets/text_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final providerTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CText(Strings.settingsPage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CText(Strings.settings, style: TextStyles.textHeadingStyle),
              CText(Strings.settingsPage, style: TextStyles.textStyle),
              const SizedBox(height: Constants.settingsSizedBoxHeight),
              CText(
                  '${Strings.textFromRead} ${context.read<UserProvider>().userName}'),
              const SizedBox(height: Constants.settingsSizedBoxHeight),
              CText(
                  '${Strings.textFromRWatch} ${context.watch<UserProvider>().userName}'),
              const SizedBox(height: Constants.settingsSizedBoxHeight),
              TextField(
                controller: providerTextFieldController,
                decoration: const InputDecoration(
                  hintText: '${Strings.newProviderValue}',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: Constants.settingsSizedBoxHeight),
              ElevatedButton(
                onPressed: () {
                  context.read<UserProvider>().updateUserName(
                      userName: providerTextFieldController.text.toString());
                  FocusScope.of(context).unfocus();
                  providerTextFieldController.clear();
                },
                child: CText(Strings.updateProviderValue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
