// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sbucks/src/utils/utilities.dart';

// class AppTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final bool autocorrect;
//   final bool autofocus;
//   final FocusNode focusNode;
//   final TextStyle style;
//   final InputDecoration decoration;
//   final TextInputType keyboardType;
//   final int maxLines;
//   final int maxLength;
//   final TextAlign textAlign;
//   final bool obscureText;
//   final bool enabled;
//   final Function onTap;
//   final Function onChanged;
//   final Function onSubmitted;
//   final Function onEditingComplete;

//   AppTextField({
//     this.controller,
//     this.autocorrect = false,
//     this.autofocus = false,
//     this.focusNode,
//     this.style,
//     this.decoration,
//     this.maxLines = 1,
//     this.maxLength,
//     this.textAlign = TextAlign.start,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//     this.enabled = true,
//     this.onTap,
//     this.onChanged,
//     this.onSubmitted,
//     this.onEditingComplete,
//   });

//   @override
//   _AppTextFieldState createState() => _AppTextFieldState();
// }

// class _AppTextFieldState extends State<AppTextField> {
//   final _textController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // @Notes: Copy object for use inside widget.
//     _textController.value = widget.controller.value.copyWith();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _textController,
//       autocorrect: widget.autocorrect,
//       autofocus: widget.autofocus,
//       focusNode: widget.focusNode,
//       style: widget.style,
//       decoration: widget.decoration.copyWith(
//         counterText: '',
//       ),
//       maxLines: widget.obscureText ? 1 : widget.maxLines,
//       maxLength: widget.maxLength,
//       textAlign: widget.textAlign,
//       keyboardType: widget.keyboardType,
//       obscureText: widget.obscureText,
//       enabled: widget.enabled,
//       onTap: widget.onTap,
//       inputFormatters: Utilities.filterEmoticonInputFormatter,
//       onChanged: (String text) {
//         setState(() {
//           _textController.value = _textController.value.copyWith(
//             text: text,
//           );
//         });

//         if (widget.controller != null) {
//           widget.controller.value = _textController.value.copyWith();
//         }

//         if (widget.onChanged != null) {
//           widget.onChanged(text);
//         }
//       },
//       onSubmitted: widget.onSubmitted,
//       onEditingComplete: () {
//         if (widget.onEditingComplete != null) {
//           widget.onEditingComplete();
//         }
//         FocusScope.of(context).unfocus();
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';

label(String title) => Text(title);

InputDecoration buildInputDecoration({String hintText, IconData icon}) {
  return InputDecoration(
    prefixIcon: icon != null
        ? Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0))
        : null,
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

String validateEmail(String value) {
  String _msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    _msg = "Your username is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Please provide a valid emal address";
  }
  return _msg;
}
