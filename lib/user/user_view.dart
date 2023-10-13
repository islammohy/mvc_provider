import 'package:flutter/material.dart';
import 'package:mvc_provider/user/user_controller.dart';
import 'package:mvc_provider/user/user_model.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    //------just add for test-------
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Provider.of<UserController>(context).users.isNotEmpty
                  ? Column(
                      children: [
                        Selector<UserController, String>(
                            builder: (context, value, child) => Text(value),
                            selector: (context, usermodel) =>
                                usermodel.users[0].name),
                        Selector<UserController, int>(
                            builder: (context, value, child) =>
                                Text('Age: $value'),
                            selector: (context, usermodel) =>
                                usermodel.users[0].age),
                        MaterialButton(
                          onPressed: () {
                            Provider.of<UserController>(context, listen: false)
                                .increaseAge(0);
                          },
                          child: const Text('Increase Age'),
                        ),
                      ],
                    )
                  : const SizedBox(),
              MaterialButton(
                onPressed: () {
                  Provider.of<UserController>(context, listen: false)
                      .addUser(UserModel(name: 'GG', age: 50));
                },
                child: const Text('Add User'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
