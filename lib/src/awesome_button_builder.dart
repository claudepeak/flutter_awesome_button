import 'package:flutter/material.dart';
import 'model/button_options_model.dart';

part './widgets/button_widget.dart';
part './widgets/elevated_button.dart';
part './widgets/outlined_button.dart';

class AwesomeButtonBuilder {
  Key? _key;
  Widget? _text;
  Widget? _icon;
  Color? _color;

  bool? _outline = false;
  bool? _disabled = false;
  bool? _loading = false;
  double? _radius = 10;

  Function()? _onPressed;
  Widget? _loadingWidget;

  /// Creating options for the button
  AwesomeButtonBuilder fromOptions(ButtonOptions options) {
    _key = options.key ?? UniqueKey();
    _text = options.text ?? const SizedBox.shrink();
    _icon = options.icon ?? const SizedBox.shrink();
    _loading = options.loading ?? false;
    _outline = options.outline ?? false;
    _disabled = options.disabled ?? false;
    _color = options.color ?? Colors.blueAccent.shade400;
    _radius = options.radius;
    _onPressed = options.onPressed ?? () {};
    _loadingWidget = options.loadingWidget ??
        const CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          backgroundColor: Colors.white,
        );

    return this;
  }

  /// Creates a Elevated button
  Widget buildElevatedButton() {
    return _ElevatedButton(
      loadingWidget: _loadingWidget!,
      key: _key!,
      onPressed: _onPressed!,
      text: _text!,
      icon: _icon!,
      color: _color!,
      outline: _outline!,
      disabled: _disabled!,
      loading: _loading!,
      radius: _radius!,
    );
  }

  Widget buildOutlinedButton() {
    return _OutlinedButton(
      loadingWidget: _loadingWidget!,
      key: _key!,
      onPressed: _onPressed!,
      text: _text!,
      icon: _icon!,
      color: _color!,
      outline: _outline!,
      disabled: _disabled!,
      loading: _loading!,
      radius: _radius!,
    );
  }
}
