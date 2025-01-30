import 'package:flutter/material.dart';
import 'package:flutter_provider_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //todo Not Recommended Approach....
  Widget buildWithContext(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page', style: TextStyle(fontSize: 16)),
            Text('Home', style: TextStyle(fontSize: 40)),
            Text(
              '(${context.watch<UserProvider>().userName}), text From UserProvider',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
                'UserName value from Provider with read(): ${context.read<UserProvider>().userName}'),
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
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page', style: TextStyle(fontSize: 16)),
            Text('Home', style: TextStyle(fontSize: 40)),
            Consumer<UserProvider>(
              builder: (context, value, child) {
                return Text(
                  '(${value.userName}), text From UserProvider',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              },
              child: Text('Home Page', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
