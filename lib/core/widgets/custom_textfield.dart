import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.focusNode,
    this.nextNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textInputType,
    this.length,
    this.onTap,
    this.textCapitalization,
    this.labelText,
    this.inputFormatters,
    this.autofillHints,
    this.prefixIcon,
    this.validator,
  });

  final TextEditingController controller;
  final String? hintText;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function()? onTap;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onFieldSubmitted;
  final int? length;
  final String? labelText;
  final List<String>? autofillHints;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        autofillHints: widget.autofillHints,
        enableSuggestions: false,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        onTap: widget.onTap,
        controller: widget.controller,
        onFieldSubmitted: onFieldSubmitted,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters ?? [],
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction ??
            (widget.nextNode == null
                ? TextInputAction.done
                : TextInputAction.next),
        obscureText: obscureText,
        decoration: buildInputDecoration(),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      labelText: widget.labelText,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.hintText == 'Password'
          ? IconButton(
              splashColor: Colors.transparent,
              icon: obscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            )
          : const SizedBox(),
    );
  }

  void onFieldSubmitted(String text) {
    widget.onFieldSubmitted?.call(text);
    if (widget.nextNode != null) {
      widget.nextNode!.requestFocus();
    } else {
      FocusScope.of(context).unfocus();
    }
  }
}
