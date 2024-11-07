import 'package:deliveryman_app/helper/custom_validator.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? Function(String?)? validator; 
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool divider;
  final Widget? label;
  final bool isRequired;

  CustomTextField({
    this.hintText = 'Write something...',
    required this.controller,
     this.focusNode,
     this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.divider = false,
    this.label ,
    this.isRequired = false,
    this.fillColor,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: widget.isRequired && widget.validator==null?CustomValidator.requiredField:widget.validator,
          maxLines: widget.maxLines,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          focusNode: widget.focusNode,
          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
          // textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ]
              : null,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color:Theme.of(context).primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 212, 198,
                    198), // Set the default border color to green
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 212, 198, 198),
              ),
            ),
            isDense: true,
            hintText: widget.hintText,
            labelStyle: robotoRegular.copyWith(
              color: Theme.of(context).hintColor,
            ),
            label: Wrap(children: [
              widget.label??Text(widget.hintText),
              widget.isRequired
                  ? Text(
                      " *",
                      style: robotoRegular.copyWith(color: Colors.red),
                    )
                  : const SizedBox(),
              ],),
            fillColor: widget.fillColor??Theme.of(context).cardColor,
            hintStyle: robotoRegular.copyWith(
              fontSize: Dimensions.fontSizeLarge,
              color: Theme.of(context).hintColor,
            ),
            filled: true,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: widget.prefixIcon,
                  )
                : null,
            prefixIconColor:Theme.of(context).hintColor ,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: _toggle,
                  )
                : widget.suffixIcon,
          ),

          onSaved: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text!)
                  : null,
          onChanged: widget.onChanged,
        ),
        widget.divider
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8), child: Divider())
            : const SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
