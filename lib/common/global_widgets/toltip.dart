import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyTooltipButton extends StatefulWidget {
  final Widget child;
  final String tooltipMessage;
  final VoidCallback onPressed;

  const CopyTooltipButton({
    Key? key,
    required this.child,
    required this.tooltipMessage,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CopyTooltipButtonState createState() => _CopyTooltipButtonState();
}

class _CopyTooltipButtonState extends State<CopyTooltipButton> {
  bool _showTooltip = false;

  void _showTemporaryTooltip() {
    setState(() {
      _showTooltip = true;
    });

    // Hide the tooltip after a delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showTooltip = false;
      });
    });
  }

  void _handlePress() {
    widget.onPressed();
    _showTemporaryTooltip();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
          onPressed: _handlePress,
          child: widget.child,
        ),
        if (_showTooltip)
          Positioned(
            bottom: 50,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.tooltipMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
