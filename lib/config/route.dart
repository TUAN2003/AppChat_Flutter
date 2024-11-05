import 'package:appchat/views/auth/signup/sign_up_avatar_screen.dart';

import '../views/screens.dart';

//To add a new screen
//Step 1:add new screen name to enum
enum RouteName {
  splash,
  login,
  signUpPhone,
  signUpPassword,
  signUpInfo,
  signUpAvatar,
  main,
  chat,
  verify,
}

//Step 2:add enum name map with string name
const mapRouteName = {
  RouteName.splash: '/',
  RouteName.login: '/login',
  RouteName.signUpPhone: '/signupphone',
  RouteName.signUpPassword: '/signuppassword',
  RouteName.signUpInfo: '/signupinfo',
  RouteName.signUpAvatar: '/signupavatar',
  RouteName.main: '/main',
  RouteName.chat: '/chat',
  RouteName.verify: '/verify',
};

//Step 3:add the string map name to the screen
final routes = {
  '/': (_) => const SplashScreen(),
  '/login': (_) => const LoginScreen(),
  '/main': (_) => const MainScreen(),
  // '/chat': (_) => const ChatScreen(),
  // '/verify': (_) => const VerifyScreen(),
  '/signupphone': (_) => const SignUpPhoneScreen(),
  '/signuppassword': (_) => const SignUpPasswordScreen(),
  '/signupinfo': (_) => const SignUpInfoScreen(),
  '/signupavatar': (_) => const SignUpAvatarScreen(),
};
