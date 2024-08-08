import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.all(16.h),
            child: const Text(
              "Available Doctors",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _doctorsGrid()
        ],
      ),
    );
  }

  Widget _doctorsGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      shrinkWrap: true,
      gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600, childAspectRatio: .8),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
          decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: Colors.black, width: .1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.grey,
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 32.h),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.network(
                    "https://media.crafto.app/test/522x416/2904b735-3834-4951-8f97-df34fa55343b?dimension=522x416",
                  ),
                ),
              ),
              Text(
                "Dr. Pradeep Chowbey",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Chairman - Max Institute of Laparoscopic, Endoscopic, Bariatric Surgery & Allied Surgical Specialities",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Consults at: Max Healthcare Saket",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 8,
              ),
              _textWithIconInRow(
                  icon: Icons.work, text: "Experience: 45+ years"),
              const SizedBox(
                height: 4,
              ),
              _textWithIconInRow(icon: Icons.cut, text: "Surgeries: 85000+"),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 0.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
                  decoration: BoxDecoration(
                      color: Color(0xffe48822),
                      borderRadius: BorderRadius.circular(6.r)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Book Appointment @ \$10",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
                            const Spacer(),
    
            ],
          ),
        );
      },
    );
  }

  Widget _textWithIconInRow({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(
          width: 8.w,
        ),
        Text(text)
      ],
    );
  }

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 600;
  }
}
