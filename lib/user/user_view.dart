import 'dart:math';

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
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:
                        Provider.of<UserController>(context).users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          //  leading: const Icon(Icons.list),
                          trailing: InkWell(
                            child: const Icon(Icons.delete),
                            onTap: () {
                              Provider.of<UserController>(context,
                                      listen: false)
                                  .removeUser(index);
                            },
                          ),
                          title: Row(
                            children: [
                              Selector<UserController, String>(
                                builder: (context, value, child) =>
                                    Text('$value     age:'),
                                selector: (context, userController) =>
                                    userController.users[index].name,
                              ),
                              Selector<UserController, int>(
                                builder: (context, value, child) =>
                                    Text('$value'),
                                selector: (context, userController) =>
                                    userController.users[index].age,
                              )
                            ],
                          ));
                    }),
              ),
              MaterialButton(
                onPressed: () {
                  Provider.of<UserController>(context, listen: false).addUser(
                      UserModel(
                          name: 'Gen Name ${1 + Random().nextInt(100 - 1 + 1)}',
                          age: 1 +
                              Random().nextInt(30 -
                                  1 +
                                  1))); //------add random name with random age----
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
