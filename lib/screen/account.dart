import 'package:app_book/contains/app_colors.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  String nameImage = 'TN';

  String nameUser = 'toannguyen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageAccount(nameImage, nameUser),
            settingWidget(),
          ],
        ),
      ),
    );
  }
}

Widget ImageAccount(String image, String name) {
  return Container(
    height: 250,
    width: double.maxFinite,
    color: ColorGrey1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 130,
          width: 130,
          child: Center(
            child: Text(
              image,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          decoration:
              const ShapeDecoration(color: Colors.black, shape: CircleBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    ),
  );
}

Widget settingWidget() {
  return ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[
      Container(
        height: 50,
        color: ColorGrey1,
        child: const Text(
          'Manager Account',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.blue),
        ),
      ),
      Container(
        height: 50,
        color: ColorGrey1,
        child: const Text(
          'Change PassWork',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      )
    ],
  );
}
