import 'dart:async';

import 'package:flutter/material.dart';

class UploadButton extends StatefulWidget {
  const UploadButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  double _progressValue = 0.0;
  bool _inProgress = false;

  void _startProgress() {
    _inProgress = true;
    _progressValue = 0.0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_progressValue < 1) {
        setState(() {
          _progressValue += 0.01;
        });
      } else {
        timer.cancel();
        _inProgress = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = _inProgress ? Colors.grey.shade500 : Colors.blueAccent.shade400;

    return ElevatedButton(
      onPressed: _inProgress
          ? null
          : () async {
              _startProgress();
              widget.onPressed?.call();
            },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_inProgress)
            Positioned.fill(
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade400,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                value: _progressValue,
              ),
            ),
          Text(
            _inProgress ? '${(_progressValue * 100).toInt()}%' : 'Upload',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
