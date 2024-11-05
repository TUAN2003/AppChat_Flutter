import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  final bool? isOnline;
  const AvatarWidget({super.key, this.isOnline});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // gradient: LinearGradient(
                      //   colors: [Colors.green, Colors.yellow],
                      // ),
                      border: Border.all(),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 30,
                  //   height: 30,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           image: NetworkImage(
                  //               'https://www.vietnamworks.com/hrinsider/wp-content/uploads/2023/12/hinh-anh-cute-anime-001.jpg'),
                  //           fit: BoxFit.cover)),
                  // ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                color: Colors.green),
          ),
        )
      ],
    );
  }
}
