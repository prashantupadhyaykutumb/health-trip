import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppDropDown extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final Function(String item) callback;
  const AppDropDown(
      {super.key,
      required this.items,
      required this.hintText,
      required this.callback});

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
          showSearchBox: false,
          fit: FlexFit.loose,
          searchFieldProps: TextFieldProps(
              decoration: const InputDecoration(
                hintText: "Search",
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: isLargeScreen ? 4.sp : 12.sp))),
      items: widget.items,
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            // hintText: widget.hintText,
            labelText: widget.hintText,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 12)
          ),
          baseStyle: TextStyle(
              color: Colors.black, fontSize: isLargeScreen ? 4.sp : 12.sp)),
      onChanged: print,
    );
  }
}
