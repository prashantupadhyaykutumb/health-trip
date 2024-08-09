import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_tour/home/consultation_page.dart';
import 'package:medical_tour/home/testinomial_data.dart';
import 'package:medical_tour/utils/analytics_manager.dart';
import 'package:medical_tour/utils/constants.dart';
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
  String? country = "";
  String? illness = "";
  String? phoneNumber = "";
  String? phoneCode = "";
  final ScrollController _scrollController = ScrollController();
  final List<TestinomialData> _testinomialsData = [
    TestinomialData(
        dp:
            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        title:
            "The Avocure team were great at answering my questions and working with me figure out a plan for getting this done. With their help, I felt much more confident for such a major operation.",
        subTitle: "Marie Djomo, Rwanda - Apollo Hospitals"),
    TestinomialData(
        dp:
            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        title:
            "The Avocure team were great at answering my questions and working with me figure out a plan for getting this done. With their help, I felt much more confident for such a major operation.",
        subTitle: "Marie Djomo, Rwanda - Apollo Hospitals"),
    TestinomialData(
        dp:
            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        title:
            "The Avocure team were great at answering my questions and working with me figure out a plan for getting this done. With their help, I felt much more confident for such a major operation.",
        subTitle: "Marie Djomo, Rwanda - Apollo Hospitals"),
    TestinomialData(
        dp:
            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        title:
            "The Avocure team were great at answering my questions and working with me figure out a plan for getting this done. With their help, I felt much more confident for such a major operation.",
        subTitle: "Marie Djomo, Rwanda - Apollo Hospitals"),
    TestinomialData(
        dp:
            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        title:
            "The Avocure team were great at answering my questions and working with me figure out a plan for getting this done. With their help, I felt much more confident for such a major operation.",
        subTitle: "Marie Djomo, Rwanda - Apollo Hospitals"),
  ];

  @override
  void initState() {
    AnalyticsManager.instance.amplitude.logEvent("TestingHome");
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

  _scrollToTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        children: [
          isLargeScreen(context) ? _mainWidgetLarge() : _mainWidgetWeb(),
          SizedBox(height: isLargeScreen(context) ? .1.sh : .03.sh),
          _howDoWeWork(),
          _testinomials(),
          SizedBox(
            height: 32.h,
          ),
          InkWell(
            onTap: () {
              _scrollToTop();
            },
            child: UnconstrainedBox(
              child: Container(
                alignment: Alignment.center,
                width: isLargeScreen(context) ? .3.sw : .7.sw,
                margin: EdgeInsets.symmetric(horizontal: 0.h),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
                decoration: BoxDecoration(
                    color: Color(0xffe48822),
                    borderRadius: BorderRadius.circular(10.r)),
                child: const Text(
                  "Consult with a health expert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: .1.sh,
          ),
        ],
      ),
    );
  }

  Widget _testinomials() {
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        margin: EdgeInsets.only(top: 16.h),
        width: isLargeScreen(context) ? .6.sw : 1.sw,
        child: Column(
          children: [
            const Text(
              "How our patients feel about us?",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.h,
            ),
            FlutterCarousel(
              options: CarouselOptions(
                autoPlay: true,
                height: isLargeScreen(context) ? .2.sh : .4.sh,
                showIndicator: true,
                slideIndicator: const CircularSlideIndicator(
                    slideIndicatorOptions: SlideIndicatorOptions(
                        indicatorBorderColor: Colors.green,
                        currentIndicatorColor: Colors.green,
                        indicatorBackgroundColor: Colors.white)),
              ),
              items: _testinomialsData.map((data) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(12.h),
                      margin: EdgeInsets.only(left: 8.h, top: 8.h),
                      decoration: BoxDecoration(
                          color: const Color(0xfff7f7f7),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(color: Colors.green)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Image.network(
                                data.dp,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.h,
                          ),
                          SizedBox(
                            width: isLargeScreen(context) ? .3.sw : .4.sw,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  data.subTitle,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     SizedBox(
            //       width: .25.sw,
            //       child: const Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "How our patients feel about us?",
            //             style: TextStyle(
            //                 fontSize: 24,
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //           SizedBox(
            //             height: 8,
            //           ),
            //           Text(
            //             "Helped patients from across 60+ countries - Kenya, Congo, Ethiopia, Tanzania, Oman, UAE, Qatar etc. make an informed decision for their treatment.",
            //             style: TextStyle(
            //                 fontSize: 12,
            //                 color: Colors.grey,
            //                 fontWeight: FontWeight.normal),
            //           )
            //         ],
            //       ),
            //     ),

            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _howDoWeWork() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          const Text(
            "Medical tourism journey made simple.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          isLargeScreen(context)
              ? Image.network(
                  width: .6.sw,
                  "https://media.crafto.app/test/3319x756/e0f3a805-1d4e-4f72-9236-5ec99631e811?dimension=3319x756")
              : Image.network(
                  width: .8.sw,
                  "https://media.crafto.app/test/1896x1635/ef7c5d5c-ca1e-4c88-9804-231e34a5e6a2?dimension=1896x1635")
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
                const Text(
                  "Healthtrip streamlines your medical travel experience by offering personalized assistance from start to finish.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
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
      height: .75.sh,
      child: Stack(
        children: [
          _videoWidget(),
          Positioned(
            top: 60.h,
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
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.black38,
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
            InkWell(
              onTap: () {
                onButtonCLick();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.h),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
                decoration: BoxDecoration(
                    color: Color(0xffe48822),
                    borderRadius: BorderRadius.circular(6.r)),
                child: const Text(
                  "Consult with a health expert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onButtonCLick() {
    if (country == "") {
      country = null;
      setState(() {});
    } else if (illness == "") {
      illness = null;
      setState(() {});
    } else if (phoneNumber == "") {
      phoneNumber = null;
      setState(() {});
    } else if (country != null && illness != null && phoneNumber != null) {
      _moveToConsultaionPage();
    }
  }

  Widget _infoWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
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
          InkWell(
            onTap: () {
              onButtonCLick();
            },
            child: Container(
              alignment: Alignment.center,
              width: isLargeScreen(context) ? .4.sw : .8.sw,
              margin: EdgeInsets.symmetric(vertical: 16.h),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.h),
              decoration: BoxDecoration(
                  color: Color(0xffe48822),
                  borderRadius: BorderRadius.circular(10.r)),
              child: const Text(
                "Consult with a health expert",
                style: TextStyle(color: Colors.white),
              ),
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
          width: .13.sw,
          child: AppDropDown(
            hasError: country == null,
            items: Constants.countries,
            hintText: "Select Country",
            callback: (item) {
              setState(() {
                country = item;
              });
            },
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
          width: .14.sw,
          child: AppDropDown(
            hasError: illness == null,
            items: Constants.medicalIssues,
            hintText: "Select Treatment",
            callback: (item) {
              setState(() {
                illness = item;
              });
            },
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
              width: 80.h,
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  menuProps: MenuProps(backgroundColor: Colors.white),
                  showSelectedItems: true,
                  showSearchBox: true,
                  fit: FlexFit.loose,
                  searchFieldProps: TextFieldProps(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
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
                        fontSize: isLargeScreen(context) ? 4.sp : 12.sp),
                  ),
                ),
                items: Constants.countryCodes,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlign: TextAlign.center,
                  dropdownSearchDecoration: InputDecoration(
                      errorText: (phoneCode == null) || (phoneNumber == null)
                          ? "required"
                          : null,

                      // hintText: widget.hintText,
                      hintText: "+91"),
                ),
                onChanged: (value) {
                  setState(() {
                    phoneCode = value;
                  });
                },
                // selectedItem: "+91",
              ),
            ),
            SizedBox(
              width: 120.h,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: "Enter your mobile",
                    errorText: phoneNumber == null ? "" : null,
                    contentPadding: const EdgeInsets.all(3),
                    hintStyle: const TextStyle(
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
            hasError: country == null,
            items: Constants.countries,
            hintText: "Select Country",
            callback: (item) {
              setState(() {
                country = item;
              });
            },
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
            hasError: illness == null,
            items: Constants.medicalIssues,
            hintText: "Select Treatment",
            callback: (item) {
              setState(() {
                illness = item;
              });
            },
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
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    searchFieldProps: TextFieldProps(
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(fontSize: 10),
                        contentPadding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: isLargeScreen(context) ? 4.sp : 12.sp),
                    ),
                  ),
                  items: Constants.countryCodes,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    textAlign: TextAlign.center,
                    dropdownSearchDecoration: InputDecoration(
                        errorText: (phoneCode == null) || (phoneNumber == null)
                            ? "required"
                            : null,
                        // hintText: widget.hintText,
                        hintText: "+91"),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phoneCode = value;
                    });
                  },
                  // selectedItem: "+91",
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                  decoration: InputDecoration(
                      errorText: phoneNumber == null ? "" : null,
                      hintText: "Enter your mobile",
                      hintStyle: const TextStyle(
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

  _moveToConsultaionPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConsultationPage(),
        ));
  }
}
