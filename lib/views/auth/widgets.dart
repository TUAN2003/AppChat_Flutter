import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

// Gap
const gap = SizedBox(height: 12);

// Logo
class Logo extends StatelessWidget {
  final double? scale;
  const Logo({super.key, this.scale});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      width: (scale ?? 1) * 256,
      height: (scale ?? 1) * 256,
      fit: BoxFit.fill,
    );
  }
}

// InputOutlineField
class InputPasswordFeild extends StatefulWidget {
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? showIconSuffix;
  final Widget? hideIconSuffix;
  final FocusNode? focusNode;
  final bool? autoFocus;

  const InputPasswordFeild({
    super.key,
    this.textInputAction,
    this.controller,
    this.validator,
    this.label,
    this.hint,
    this.prefixIcon,
    this.showIconSuffix,
    this.hideIconSuffix,
    this.focusNode,
    this.autoFocus,
  });

  @override
  State<InputPasswordFeild> createState() => _InputFeildState();
}

class _InputFeildState extends State<InputPasswordFeild> {
  bool _isShow = false;
  bool _isShowSuffix = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus ?? false,
      focusNode: widget.focusNode,
      obscureText: !_isShow,
      onChanged: (value) {
        switch (value.length) {
          case 0:
            setState(() {
              _isShowSuffix = false;
            });
            break;
          case 1:
            setState(() {
              _isShowSuffix = true;
            });
            break;
          default:
        }
      },
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.label,
          hintFadeDuration: Duration.zero,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Color.fromARGB(123, 137, 134, 134)),
          prefixIcon: widget.prefixIcon,
          suffixIcon: _isShowSuffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isShow = !_isShow;
                    });
                  },
                  icon: (!_isShow
                      ? widget.showIconSuffix!
                      : widget.hideIconSuffix!))
              : null),
    );
  }
}

// status loading
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: ModalBarrier(
            color: const Color.fromARGB(93, 0, 0, 0),
            dismissible: false,
          ),
        ),
        const Positioned.fill(
          child: Center(
            child: RefreshProgressIndicator(
              elevation: 10,
            ),
          ),
        )
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              size: 32.0,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 2) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}

class TextCountDownTimer extends StatefulWidget {
  const TextCountDownTimer({super.key});

  @override
  State<TextCountDownTimer> createState() => _TextCountDownTimerState();
}

class _TextCountDownTimerState extends State<TextCountDownTimer> {
  bool _finished = false;
  @override
  Widget build(BuildContext context) {
    return _finished
        ? TextButton(onPressed: () {}, child: Text('Gửi lại mã'))
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('còn lại '),
              Countdown(
                onFinished: () {
                  setState(() {
                    _finished = true;
                  });
                },
                seconds: 10,
                build: (_, time) {
                  return Text(time.toInt().toString());
                },
              ),
              const Text(' giây'),
            ],
          );
  }
}

class SexModalBottomSheet extends StatelessWidget {
  final bool? tmp;
  const SexModalBottomSheet({super.key, this.tmp});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop('Nam');
              },
              child: Text('Nam'),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop('Nữ');
                },
                child: Text('Nữ')),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
