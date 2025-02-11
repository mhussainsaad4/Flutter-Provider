import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/resources/strings.dart';
import '../utils/resources/styles.dart';
import '../utils/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //todo Not Recommended Approach....
  Widget buildWithContext(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CText(Strings.homePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CText(Strings.homePage, style: TextStyles.textStyle),
            const CText(Strings.home, style: TextStyles.textHeadingStyle),
            CText(
              '(${context.watch<UserProvider>().userName}), ${Strings.textFromUserProvider}',
              textAlign: TextAlign.center,
              style: TextStyles.textSubHeadingStyle,
            ),
            CText(
                '${Strings.textFromRead} ${context.read<UserProvider>().userName}'),
          ],
        ),
      ),
    );
  }

//todo  User Consumer instead of context.watch as Consumer only rebuilds that
//todo  Widget  upon value change which is using Provider while context.watch updates entire widget tree  https://stackoverflow.com/a/79192948
// todo    we cant use context.read() for provider value (its a anti pattern), we have to use context.watch or Consumer or Selector

  //todo Recommended Approach
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CText(Strings.homePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CText(Strings.homePage, style: TextStyles.textStyle),
            const CText(Strings.home, style: TextStyles.textHeadingStyle),
            Consumer<UserProvider>(
              builder: (context, value, child) {
                return CText(
                  '(${value.userName}), ${Strings.textFromUserProvider}',
                  textAlign: TextAlign.center,
                  style: TextStyles.textSubHeadingStyle,
                );
              },
              child: const CText(Strings.homePage, style: TextStyles.textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
