import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/styles.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(CountryCode)? onCountryChanged;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const PhoneField({super.key, required this.controller, required this.onCountryChanged, required this.onChanged, required this.validator });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: Styles.subHeading,
        ),
        SizedBox(
          height: 08.h,
        ),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter phone number",
            hintStyle: Styles.body.copyWith(
                fontSize: 16.sp, color: Colors.black.withOpacity(0.5)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            prefixIcon: Container(
              height: 50.h,
              width: 90.w,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.only(right: 08.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r),
                ),
                border: Border.all(color: const Color(0xff606060), width: 1),
              ),
              child: CountryCodePicker(
                onChanged: onCountryChanged,
                initialSelection: 'PK',
                favorite: const ['+39', 'FR'],
                padding: EdgeInsets.zero,
                showCountryOnly: false,
                showFlag: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
                showDropDownButton: true,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff606060), width: 1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff606060), width: 1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
