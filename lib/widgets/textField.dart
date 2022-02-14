import 'package:flutter/material.dart';

// ignore: camel_case_types
class W_Textfield extends StatelessWidget {
  final String _hindText;
  final bool _isObscured;
  final TextInputAction _inputAction;
  final TextEditingController _controller = TextEditingController();
  W_Textfield(this._hindText, this._inputAction, this._isObscured, _controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 350,
            height: 40,
            margin: EdgeInsets.only(top: 19),
            child: TextFormField(
              style: TextStyle(color: const Color(0xffbF4511E)),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: _hindText,
              ),
              textInputAction: _inputAction,
              controller: _controller,
              obscureText: _isObscured,
              /*validator: MultiValidator([
                                EmailValidator(errorText: 'Not a valid email'),
                                RequiredValidator(errorText: 'requred')
                              ]),*/
            ),
          ),
          Container(
            width: 355,
            height: 1,
            color: Color(0xffbF4511E),
          ),
        ],
      ),
    );
  }
}
