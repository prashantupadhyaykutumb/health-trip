import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_tour/home/testinomial_data.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  final List<TestinomialData> _howDoWeWorkData = [
    TestinomialData(
      dp: "https://media.crafto.app/test/300x300/2837269e-ea32-4e07-b1af-226ebd438ede?dimension=300x300",
      title: "Fantastic Quality",
      subTitle: "",
    ),
    TestinomialData(
      dp: "https://media.crafto.app/test/300x300/e5abd760-0f04-4468-839d-9c1b460c7e10?dimension=300x300",
      title: "Superb Customer\nSupport",
      subTitle: "",
    ),
    TestinomialData(
      dp: "https://media.crafto.app/test/300x300/6ce12fd8-aa11-49c3-b82c-0cb7cec27902?dimension=300x300",
      title: "Exceeded Expectations",
      subTitle: "",
    ),
  ];

  final List<DoctorData> _doctors = [
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/147ce95e-30b6-49e7-9a24-4409f5dc0f2c?dimension=200x200",
      name: "Dr.Anand Chopra",
      about:
          "MBBS Armed Forces Medical College, Pune\nMD - General Medicine University of Mumbai\nFellowship in Infectious Diseases Medvarsity",
      hospital: "Hospital data",
      experience: "17+ years",
      surgeries: "683",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/d6fe30e2-0b34-47a8-a1e3-7fe98345f997?dimension=200x200",
      name: "Dr.Shruti Goswami",
      about:
          "MD Physician Ryazan State I.P. Pavlov Medical University, Russian Federation",
      hospital: "Hospital data",
      experience: "12+ years",
      surgeries: "580",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/13d59291-b0cc-4534-a0d5-485738a78078?dimension=200x200",
      name: "Dr.Navneet Kaur",
      about:
          "MD (Physician) TSMA University, Russia\nDNB National Board of Examinations",
      hospital: "Hospital data",
      experience: "13+ years",
      surgeries: "562",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/62411963-8d7a-4b8e-912b-2f62ac9bf71c?dimension=200x200",
      name: "Dr.Rupal Rana",
      about:
          "MBBS Mumbai University\nDCH Royal College Of Physicians of Ireland",
      hospital: "Hospital data",
      experience: "20+ years ",
      surgeries: "877",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/a78c7c60-0ace-4cc1-9982-ae74faa8ff36?dimension=200x200",
      name: "Dr.Vishal R Beriwala",
      about:
          "MBBS GCS Medical College, Ahmedabad\nMD NHLM Medical College, Ahmedabad",
      hospital: "Hospital data",
      experience: "5+ years",
      surgeries: "127",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/6452efe5-7977-436c-a688-17452819a27b?dimension=200x200",
      name: "Dr.Delnaz Jeyhan Dhabhar",
      about:
          "MBBS D Y Patil University, Navi Mumbai\nMD Internal Medicine D Y Patil University, Navi Mumbai Pain and Pallative Care Specialist American Society of Clinical Oncology",
      hospital: "Hospital data",
      experience: "1200",
      surgeries: "1000",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/3cde50ed-6b0c-4154-8798-8ed1f992ab4f?dimension=200x200",
      name: "Dr.Richa Prasad",
      about: "MBBS Tribhuvan University, Nepal\nSEEDS (Ongoing fellowship) American College of Chest Physician",
      hospital: "Hospital data",
      experience: "8+ years",
      surgeries: "198",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/7f451fcd-282b-4023-bfef-7525909401fd?dimension=200x200",
      name: "Dr.Rajeev Bansal",
      about: "MBBS MAMC MD(Internal Medicine) Lady Hardinge Medical college",
      hospital: "Hospital data",
      experience: "25+ years",
      surgeries: "993",
    ),
    DoctorData(
      dp: "https://media.crafto.app/test/200x200/30a110e4-dcad-4cc6-9a80-346103b986da?dimension=200x200",
      name: "Dr.Bhawana Pathak",
      about: "MBBS Aligarh Muslim University\nMD (General Medicine) Aligarh Muslim University",
      hospital: "Hospital data",
      experience: "18+ years",
      surgeries: "787",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(child: _howDoWeWork()),
          Container(
            alignment: Alignment.center,
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
      itemCount: _doctors.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600, childAspectRatio: .8),
      itemBuilder: (context, index) {
        final item = _doctors[index];
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
                    item.dp,
                  ),
                ),
              ),
              Text(
                item.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                item.about,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              // const SizedBox(
              //   height: 4,
              // ),
              // Text(
              //   "Consults at: ${item.hospital}",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 14,
              //       fontWeight: FontWeight.normal),
              // ),
              const SizedBox(
                height: 8,
              ),
              _textWithIconInRow(
                  icon: Icons.work, text: "Experience: ${item.experience}"),
              const SizedBox(
                height: 4,
              ),
              _textWithIconInRow(
                  icon: Icons.cut, text: "Surgeries: ${item.surgeries}"),
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

  Widget _howDoWeWork() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 32.h,
          ),
          const Text(
            "Get Your Medical Travel Plan in 3 Steps",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16.h,
          ),
          _tripBenefits()
          // isLargeScreen(context)
          //     ? Image.network(
          //         width: .6.sw,
          //         "https://media.crafto.app/test/3319x756/e0f3a805-1d4e-4f72-9236-5ec99631e811?dimension=3319x756")
          //     : Image.network(
          //         width: .8.sw,
          //         "https://media.crafto.app/test/1896x1635/ef7c5d5c-ca1e-4c88-9804-231e34a5e6a2?dimension=1896x1635")
        ],
      ),
    );
  }

  Widget _tripBenefits() {
    return SizedBox(
      height: .2.sh,
      child: Padding(
          padding: const EdgeInsets.all(0),
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _howDoWeWorkData.length,
              itemBuilder: (context, index) {
                final item = _howDoWeWorkData[index];
                return _itemImageWithText(item.dp, item.title);
              },
            ),
          )),
    );
  }

  Widget _itemImageWithText(String image, String text) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12))
          ],
        ),
      ),
    );
  }
}
