import 'package:flutter/material.dart';
import 'package:school_management_system/core/function/valid_input.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData icondata;
  final TextEditingController mycontroller;
  final bool iSnumber;
  final bool? obscureText;
  final void Function()? onTapicon;
  final int min;
  final int max;
  final String type;
  final bool error;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    required this.label,
    required this.icondata,
    required this.mycontroller,
    required this.iSnumber,
    this.obscureText,
    this.onTapicon,
    required this.min,
    required this.max,
    required this.type,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType:
            iSnumber == true
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
        validator: (val) {
          return validInput(val, min, max, type);
        },
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(label),
          ),
          suffixIcon: InkWell(onTap: onTapicon, child: Icon(icondata)),
          enabledBorder:
              error
                  ? const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ), // لون الحدود في حالة التفعيل
                  )
                  : const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}
