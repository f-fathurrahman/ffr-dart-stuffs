import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


/// Accessing field state by using a controller
class InputControllerExamplesWidget extends StatelessWidget {
  final _controller = TextEditingController.fromValue(
    TextEditingValue(text: "Initial value"),
  );

  @override
  Widget build(BuildContext context) {
    _controller.addListener(_textFieldEvent);
    return Scaffold(
      body: Center(
        child: TextField(
          controller: _controller,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void _textFieldEvent() {
    print(_controller.text);
  }
}

class VerificationCodeInput extends StatefulWidget {

  final BorderSide borderSide;
  final onChanged;
  final controller;

  const VerificationCodeInput({
    Key key,
    this.controller,
    this.borderSide = const BorderSide(),
    this.onChanged,
  }) : super(key: key); 

  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();

} // class


class _VerificationCodeInputState extends State<VerificationCodeInput> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      inputFormatters: [
        WhitelistingTextInputFormatter(RegExp("[0-9]")), //FilteringTextInputFormatter.allow
        LengthLimitingTextInputFormatter(6),
      ],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: widget.borderSide),
      ),
      keyboardType: TextInputType.number,
      onChanged: widget.onChanged,
    );
  }

} // class


class VerificationCodeFormField extends FormField<String> {
  final TextEditingController controller;
  
  VerificationCodeFormField({
    Key key,
    FormFieldSetter<String> onSaved,
    this.controller,
    FormFieldValidator<String> validator,
  }) : super(
    key: key,
    validator: validator,
    builder: (FormFieldState<String> field) {
      _VerificationCodeFormFieldState state = field;
      return VerificationCodeInput(
        controller: state._controller,
      );
    },
  );

  @override
  FormFieldState<String> createState() => _VerificationCodeFormFieldState();

}

class _VerificationCodeFormFieldState extends FormFieldState<String> {
  final TextEditingController _controller = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _controller.addListener(_controllerChanged);
  }

  @override
  void reset() {
    super.reset();
    _controller.text = "";
  }

  void _controllerChanged() {
    didChange(_controller.text);
  }

  @override
  void dispose() {
    _controller?.removeListener(_controllerChanged);
    super.dispose();
  }

} // class