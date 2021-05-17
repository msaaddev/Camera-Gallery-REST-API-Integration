import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  Homepage createState() => Homepage();
}

class Homepage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Center(
              child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Container(
                    child: InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://i.pinimg.com/originals/bc/aa/d0/bcaad00d4bf16fd94bc45665ddad18e9.jpg',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  onTap: () {
                    print('working');
                  },
                )),
              ],
            ),
          )),
        )
      ],
    );
  }
}
