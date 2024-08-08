import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_tour/utils/dropdown_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _videoController;
  bool _isVideoInitialised = false;
  late TextEditingController _phoneController;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _initVideo();
    super.initState();
  }

  _initVideo() async {
    _videoController = VideoPlayerController.networkUrl(
        Uri.parse(
            'https://media.crafto.app/test/c6991cca-6fa9-4d75-9c17-b1050e8234e6?dimension=1920x1080'),
        videoPlayerOptions:
            VideoPlayerOptions(webOptions: const VideoPlayerWebOptions()));
    await _videoController.initialize();
    _videoController.setVolume(0);
    _videoController.setLooping(true);
    _videoController.play();
    setState(() {
      _isVideoInitialised = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: ListView(
        children: [
          isLargeScreen(context) ? _mainWidgetLarge() : _mainWidgetWeb()
        ],
      ),
    );
  }

  Widget _mainWidgetLarge() {
    return Stack(
      children: [
        _videoWidget(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quicker, Easier, Smarter Medical,\nWellness & Cosmetics Travel",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    fontSize: isLargeScreen(context) ? 12.sp : 18.sp,
                    shadows: const [
                      Shadow(
                        color: Colors.black38,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Healthtrip streamlines your medical travel experience by offering personalized assistance from start to finish.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: isLargeScreen(context) ? 6.sp : 12.sp,
                    height: 1.5,
                    shadows: const [
                      Shadow(
                        color: Colors.black38,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 32.h,
                ),
                _infoWidgetLargeScreen()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mainWidgetWeb() {
    return SizedBox(
      height: 1.sh,
      child: Stack(
        children: [
          _videoWidget(),
          Positioned(
            top: isLargeScreen(context) ? 0 : 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quicker, Easier, Smarter Medical,\nWellness & Cosmetics Travel",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      fontSize: isLargeScreen(context) ? 12.sp : 18.sp,
                      shadows: const [
                        Shadow(
                          color: Colors.black38,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Healthtrip streamlines your medical travel experience by offering personalized assistance from start to finish.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: isLargeScreen(context) ? 6.sp : 12.sp,
                      height: 1.5,
                      shadows: const [
                        Shadow(
                          color: Colors.black38,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  _infoWidget()
                ],
              ),
            ),
          ),
          // Positioned(
          //     bottom: 1,
          //     left: isLargeScreen ? .1.sh : 0,
          //     right: isLargeScreen ? .1.sh : 0,
          //     child: _infoWidget())
        ],
      ),
    );
  }

  Widget _videoWidget() {
    return SizedBox(
      width: 1.sw,
      height:
          ResponsiveBreakpoints.of(context).largerThan(MOBILE) ? 1.sh : .6.sh,
      child: _isVideoInitialised
          ? FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: _videoController.value.size.width,
                height: _videoController.value.size.height,
                child: VideoPlayer(_videoController),
              ),
            )
          : Container(
              width: 1.sw,
              height: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                  ? 1.sh
                  : .6.sh,
              color: Colors.black,
            ),
    );
  }

  Widget _infoWidgetLargeScreen() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _itemInfoLarge1(),
            VerticalDivider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            _itemInfoLarge2(),
            VerticalDivider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            _itemInfoLarge3(),
            VerticalDivider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0.h),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16.h),
              decoration: BoxDecoration(
                  color: Color(0xffe48822),
                  borderRadius: BorderRadius.circular(6.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.h,
                  ),
                  Text(
                    "Chat with a health expert now",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      width: isLargeScreen(context) ? .6.sw : .9.sw,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          _itemInfo1(),
          _itemInfo2(),
          _itemInfo3(),
          Container(
            width: isLargeScreen(context) ? .4.sw : .8.sw,
            margin: EdgeInsets.symmetric(vertical: 16.h),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
                color: Color(0xffe48822),
                borderRadius: BorderRadius.circular(6.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4.h,
                ),
                Text(
                  "Chat with a health expert now",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemInfoLarge1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.home),
            SizedBox(
              width: 4.h,
            ),
            const Text(
              "Resident of",
            )
          ],
        ),
        SizedBox(
          width: .1.sw,
          child: AppDropDown(
            items: [
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada'
            ],
            hintText: "Select Country",
            callback: (item) {},
          ),
        )
      ],
    );
  }

  Widget _itemInfoLarge2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.medical_information),
            SizedBox(
              width: 4.h,
            ),
            const Text(
              "Treatment",
            )
          ],
        ),
        SizedBox(
          width: .1.sw,
          child: AppDropDown(
            items: [
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada'
            ],
            hintText: "Select Treatment",
            callback: (item) {},
          ),
        )
      ],
    );
  }

  Widget _itemInfoLarge3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(Icons.phone),
            SizedBox(
              width: 4.h,
            ),
            const Text(
              "Phone Number",
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 60.h,
              child: DropdownSearch<String>(
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
                        fontSize: isLargeScreen(context) ? 4.sp : 12.sp),
                  ),
                ),
                items: [
                  "+91",
                  "+92",
                  '+93',
                  "+94",
                  "+95",
                  '+96',
                  "+97",
                  "+98",
                  '+99'
                ],
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      // hintText: widget.hintText,
                      hintText: "+91"),
                ),
                onChanged: print,
                // selectedItem: "+91",
              ),
            ),
            SizedBox(
              width: 100.h,
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your mobile",
                    hintStyle: TextStyle(
                        fontFamily: null,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 12)),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _itemInfo1() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.home),
              SizedBox(
                width: 4.h,
              ),
              const Text(
                "Resident of",
              )
            ],
          ),
          AppDropDown(
            items: [
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada'
            ],
            hintText: "Select Country",
            callback: (item) {},
          )
        ],
      ),
    );
  }

  Widget _itemInfo2() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.medical_information),
              SizedBox(
                width: 4.h,
              ),
              const Text(
                "Treatment",
              )
            ],
          ),
          AppDropDown(
            items: [
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada',
              "Brazil",
              "Tunisia",
              'Canada'
            ],
            hintText: "Select Treatment",
            callback: (item) {},
          )
        ],
      ),
    );
  }

  Widget _itemInfo3() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.phone),
              SizedBox(
                width: 4.h,
              ),
              const Text(
                "Phone Number",
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 80.h,
                child: DropdownSearch<String>(
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
                          fontSize: isLargeScreen(context) ? 4.sp : 12.sp),
                    ),
                  ),
                  items: [
                    "+91",
                    "+92",
                    '+93',
                    "+94",
                    "+95",
                    '+96',
                    "+97",
                    "+98",
                    '+99'
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        // hintText: widget.hintText,
                        hintText: "+91"),
                  ),
                  onChanged: print,
                  // selectedItem: "+91",
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your mobile",
                      hintStyle: TextStyle(
                          fontFamily: null,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 12)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 600;
  }
}
