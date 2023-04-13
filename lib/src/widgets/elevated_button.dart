part of '../awesome_button_builder.dart';

class _ElevatedButton extends _ButtonWidget {
  const _ElevatedButton({
    Key? key,
    required Widget text,
    required Widget icon,
    required Color color,
    required bool outline,
    required bool disabled,
    required bool loading,
    required double radius,
    required Function()? onPressed,
    required Widget? loadingWidget,
  }) : super(
          key: key,
          text: text,
          icon: icon,
          color: color,
          outline: outline,
          disabled: disabled,
          loading: loading,
          radius: radius,
          onPressed: onPressed,
          loadingWidget: loadingWidget,
        );
  @override
  Widget build(BuildContext context) {
    final buttonStyle = _outline
        ? ElevatedButton.styleFrom(
            foregroundColor: _loading
                ? Colors.grey.shade400
                : _disabled
                    ? Colors.white.withOpacity(0.5)
                    : Colors.white,
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            side: BorderSide(
              color: _color,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius),
            ),
          )
        : OutlinedButton.styleFrom(
            backgroundColor: _loading
                ? Colors.grey.shade500
                : _disabled
                    ? Colors.grey.shade400
                    : _color,
            foregroundColor: _disabled ? Colors.white.withOpacity(0.5) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius),
            ),
          );

    return ElevatedButton(
      key: key,
      onPressed: !_disabled ? _onPressed : null,
      style: buttonStyle,
      child: _loading
          ? _loadingWidget
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _icon,
                _text,
              ],
            ),
    );
  }
}
