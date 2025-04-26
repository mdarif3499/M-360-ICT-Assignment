import 'package:flutter/material.dart';
import '../../util/constants.dart';
import '../../util/dimen.dart';

class CustomTextFieldWithoutTitle extends StatefulWidget {
  TextEditingController _con;
  String? labelName, hintText;
  FocusNode? focusNode = FocusNode();
  Function? onTextChanged;
  Function? validate;
  bool? isPassword = false;
  bool? isReadOnly = false;
  bool? isMultiline = false;
  int? numberOfLines;
  TextInputType? inputType;
  BorderRadius borderRadius = BorderRadius.circular(5);

  CustomTextFieldWithoutTitle(
      this._con, this.labelName, this.hintText, this.validate,
      {Key? key,
      this.focusNode,
      this.onTextChanged,
      this.isPassword,
      this.isReadOnly,
      this.inputType,
      this.isMultiline,
      this.numberOfLines,
      BorderRadius? borderRadius})
      : super(key: key) {
    this.borderRadius = borderRadius ?? Constants.defaultBorderRadius();
  }

  @override
  State<CustomTextFieldWithoutTitle> createState() =>
      _CustomTextFieldWithoutTitleState();
}

class _CustomTextFieldWithoutTitleState
    extends State<CustomTextFieldWithoutTitle> {
  bool isEditing = false;
  bool passwordIsVisible = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.name,

        focusNode: widget.focusNode,
        controller: widget._con,
        readOnly: widget.isReadOnly ?? false,
        style: TextStyle(fontSize: 16),
        minLines: widget.isMultiline == true ? widget.numberOfLines ?? 3 : 1,
        maxLines: widget.isMultiline == true ? null : 1,
        onChanged: (value) {
          setState(() {
            isEditing = true;
          });
          if (widget.onTextChanged != null) {
            widget.onTextChanged!(value);
          }
        },
        decoration: InputDecoration(
          isDense: true,
          focusColor: activeColor,
          hoverColor: activeColor,
          labelStyle: TextStyle(
              fontSize: Dimen.textSize(context), fontWeight: FontWeight.bold),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: Dimen.textSize(context)),
          suffixIcon: widget.isPassword == false
              ? InkWell(
                  onTap: () {
                    setState(() {

                    });
                    _obscurePassword = !_obscurePassword;
                  },
                  child: _obscurePassword
                      ?   Image.asset("assets/images/eyebroww.png",color: Colors.black38,)
                      : Icon(Icons.remove_red_eye_rounded) ,)
              : null,
          errorText: isEditing ? widget.validate!(widget._con.text) : null,
        ),
        validator: (text) {
          return widget.validate!(widget._con.text);
        });
  }
}
