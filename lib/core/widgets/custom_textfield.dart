import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
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
  });
  final TextEditingController controller;
  bool obscureText;
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
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    void onFieldSubmitted(String text) {
      widget.onFieldSubmitted?.call(text);
      if (widget.nextNode != null) {
        widget.nextNode!.requestFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        autofillHints: widget.autofillHints,
        enableSuggestions: false,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        onTap: widget.onTap,
        controller: widget.controller,
        onFieldSubmitted: onFieldSubmitted,
        validator: (value) {
          final regex = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
          if (value == null || value == '') {
            return '${widget.hintText} is required.';
          }
          if (widget.hintText == 'Email') {
            if (!regex.hasMatch(value.trim())) {
              return 'Email is not valid';
            }
          } else if (widget.hintText == 'Password') {
            if (value.length < 8) {
              return 'Password should be at least 8 character.';
            }
          }

          return null;
        },
        inputFormatters: widget.inputFormatters ?? [],
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction ??
            (widget.nextNode == null
                ? TextInputAction.done
                : TextInputAction.next),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffixIcon: widget.hintText == 'Password'
              ? IconButton(
                  splashColor: Colors.transparent,
                  icon: widget.obscureText
                      ? const Icon(
                          Icons.visibility_off,
                        )
                      : const Icon(
                          Icons.visibility,
                        ),
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
