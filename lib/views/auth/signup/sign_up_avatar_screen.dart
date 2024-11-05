import 'package:appchat/config/config.dart';
import 'package:appchat/views/auth/widgets.dart';
import 'package:appchat/views/widgets/auto_image.dart';
import 'package:flutter/material.dart';

class SignUpAvatarScreen extends StatefulWidget {
  const SignUpAvatarScreen({super.key});

  @override
  State<SignUpAvatarScreen> createState() => _SignUpAvatarScreenState();
}

class _SignUpAvatarScreenState extends State<SignUpAvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Navigator.pop(context),
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Bạn nên cập nhật ảnh đại diện của bạn',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            'Để bạn bạn của bạn có thể nhật biết là bạn',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: AutoImageByName(
                            color: Colors.yellow, name: 'Vu Anh Tuan')),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Cập nhật ảnh đại diện',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          gap,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Hoàn tất đăng ký',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  mapRouteName[RouteName.main]!,
                                  (route) => false,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
