import 'package:flutter/material.dart';

class AvatarCustom extends StatefulWidget {
  final String? url;
  final double? diameter;
  const AvatarCustom({super.key, this.url, this.diameter});

  @override
  State<AvatarCustom> createState() => _AvatarCustomState();
}

class _AvatarCustomState extends State<AvatarCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.diameter ?? 60,
      width: widget.diameter ?? 60,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: (widget.diameter ?? 60),
            height: (widget.diameter ?? 60),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.yellow],
              ),
            ),
            child: CircleAvatar(
              radius: (widget.diameter ?? 60) / 2,
              backgroundImage: NetworkImage(widget.url!),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: (widget.diameter ?? 60) / 4,
              height: (widget.diameter ?? 60) / 4,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
