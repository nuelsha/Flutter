import 'package:flutter/material.dart';
import 'package:flutter_application_1/click_me.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/a4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ClickMe();
              }));
            },
            child: const Text("My Birthday Wish"),
          ),
        ],
      ),
    );
  }
}
