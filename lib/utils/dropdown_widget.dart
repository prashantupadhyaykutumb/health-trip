import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppDropDown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  bool hasError = false;
  final Function(String item) callback;
  AppDropDown(
      {super.key,
      required this.items,
      required this.hintText,
      required this.callback,
      this.hasError = false});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  bool isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    isLargeScreen = ResponsiveBreakpoints.of(context).largerThan(MOBILE);

    return DropdownSearch<String>(
      
      popupProps: PopupProps.menu(
          menuProps: MenuProps(backgroundColor: Colors.white),
          showSelectedItems: true,
          showSearchBox: true,
          fit: FlexFit.loose,
          searchFieldProps: TextFieldProps(
            textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: isLargeScreen ? 4.sp : 12.sp))),
      items: widget.items,
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              errorText: widget.hasError ? "required" : null,
              // hintText: widget.hintText,
              labelText: widget.hintText,
              labelStyle: TextStyle(color: Colors.grey, fontSize: 12)),
          baseStyle: TextStyle(
              color: Colors.black, fontSize: isLargeScreen ? 4.sp : 12.sp)),
      onChanged:(value) => widget.callback(value!),
    );
  }
}
