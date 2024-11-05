import 'package:appchat/config/config.dart';
import 'package:appchat/utils/helper.dart';
import 'package:appchat/views/auth/verify_screen.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class SignUpInfoScreen extends StatefulWidget {
  const SignUpInfoScreen({super.key});

  @override
  State<SignUpInfoScreen> createState() => _SignUpInfoScreenState();
}

class _SignUpInfoScreenState extends State<SignUpInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => Navigator.pop(context),
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_back),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Đăng ký',
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Hãy nhập thông tin của bạn',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(115, 0, 0, 0),
                                      ),
                                    )
                                  ],
                                )),
                            Expanded(
                              flex: 6,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    const Logo(
                                      scale: 0.35,
                                    ),
                                    gap,
                                    TextFormField(
                                      focusNode: focusNode,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        labelText: 'Biệt danh',
                                        hintText: 'Biệt danh',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              123, 137, 134, 134),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person_rounded,
                                          color:
                                              Color.fromARGB(255, 73, 97, 231),
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    gap,
                                    TextFormField(
                                      canRequestFocus: false,
                                      controller: textEditingController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        hintText: 'Ngày sinh',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(138, 10, 7, 7),
                                        ),
                                        suffixIcon: TextButton(
                                            onPressed: () {
                                              showDatePicker(
                                                      initialEntryMode:
                                                          DatePickerEntryMode
                                                              .calendarOnly,
                                                      context: context,
                                                      firstDate: DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              157766400000),
                                                      lastDate: DateTime.now())
                                                  .then((value) =>
                                                      textEditingController
                                                          .text = value !=
                                                              null
                                                          ? Helper
                                                              .dateTimeToSting(
                                                                  value)
                                                          : '');
                                            },
                                            child: Text('chọn')),
                                        prefixIcon: Icon(
                                          Icons.date_range_rounded,
                                          color:
                                              Color.fromARGB(255, 73, 97, 231),
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    gap,
                                    TextFormField(
                                      controller: sexController,
                                      canRequestFocus: false,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        hintText: 'Giới tính',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(138, 10, 7, 7),
                                        ),
                                        suffixIcon: TextButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                context: context,
                                                builder: (context) =>
                                                    const SexModalBottomSheet(),
                                              ).then((value) => sexController
                                                      .text =
                                                  value ?? sexController.text);
                                            },
                                            child: Text('chọn')),
                                        prefixIcon: Icon(
                                          Icons.male_rounded,
                                          color:
                                              Color.fromARGB(255, 73, 97, 231),
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    gap,
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Tiếp theo',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context,
                                              mapRouteName[
                                                  RouteName.signUpAvatar]!);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }
}
