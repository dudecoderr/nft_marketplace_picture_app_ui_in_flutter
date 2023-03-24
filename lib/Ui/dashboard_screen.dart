import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../Constant File/image_model.dart';

class DashboardScreen extends StatefulWidget {
  final String? items;
  final String? name_items;
  final String? owners;
  final int index;

  const DashboardScreen({
    Key? key,
    this.items,
    required this.index,
    this.name_items,
    this.owners,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  double fingerOffset = 0.0;
  // bool abc = false;
  bool isFinished = false;
  RxString count = "".obs;
  RxString count_owners = "".obs;
  PageController pageController = PageController();
  var _currPageValue = 0.0;

  // late AnimationController _animationController;

  /// ------------------ animation
  bool isExpand = false;
  bool isExpand2 = false;

  @override
  void initState() {
    super.initState();
    count.value = items[0].itemName;
    count_owners.value = items[0].itemName;
    pageController.addListener(() {
      _currPageValue = pageController.page!;
      print(_currPageValue);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("page value"); //ok ha
    return Scaffold(
      backgroundColor: const Color(0xFF121314),
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              padEnds: true,
              controller: PageController(initialPage: widget.index),
              itemCount: items.length,
              onPageChanged: (index) {
                count.value = items[index].itemName;
                count_owners.value = items[index].owners;
                setState(() {
                  isExpand = !isExpand;
                });
                setState(() {
                  isExpand2 = !isExpand2;
                });
              },
              itemBuilder: (context, index) {
                final imgList = items[index];
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(imgList.urlImages),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ],
                );
              }),

          ///___ appbar code_________
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
            child: PhloxAnimations(
              duration: Duration(seconds: 1),
              fromY: -100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                            border: Border.all(color: Colors.white10)),
                        child: const Center(
                            child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ))),
                  ),
                  Spacer(),
                  Container(
                    height: 55.h,
                    width: 120.h,
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.black54,
                        border: Border.all(color: Colors.white10)),
                    child: Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white10,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.upload,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///___________________ 1 st container _______________
          Positioned(
            left: 22,
            bottom: 219,
            child: PhloxAnimations(
              duration: Duration(seconds: 1),
              fromDegrees: -90,
              fromScale: 0,
              fromOpacity: 0.1,
              fromY: -100,
              fromX: -200,
              child: InkWell(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  transform: Matrix4Transform()
                      .rotateDegrees(
                        isExpand == true ? -20 : 20,
                        origin: Offset(50, 50),
                      )
                      .matrix4,
                  child: GlassmorphicContainer(
                    height: 165.h,
                    width: 150.w,
                    borderRadius: 50.sp,
                    blur: 5,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1
                        ]),
                    borderGradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.transparent, Colors.transparent],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white24),
                            child: Icon(
                              Icons.diamond,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Obx(() {
                                count.value;
                                return Text(
                                  count.value,
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                );
                              }),
                              SizedBox(width: 5.w),
                              Text(
                                "eth",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white70),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "floor price",
                            style: TextStyle(
                                fontSize: 18.sp, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          ///_____________________________2nd container _________________
          Positioned(
            left: 22,
            bottom: 55,
            child: PhloxAnimations(
              duration: Duration(seconds: 1),
              fromDegrees: 90,
              fromScale: 0,
              fromOpacity: 0.1,
              fromY: 100,
              fromX: 200,
              child: InkWell(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  transform: Matrix4Transform()
                      .rotateDegrees(
                        isExpand2 == true ? 20 : -20,
                        origin: Offset(50, 50),
                      )
                      .matrix4,
                  child: GlassmorphicContainer(
                    height: 165.h,
                    width: 150.w,
                    borderRadius: 50.sp,
                    blur: 5,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1
                        ]),
                    borderGradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.transparent, Colors.transparent],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white24),
                            child: const Icon(
                              Icons.group,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Obx(() {
                            count_owners.value;
                            return Text(
                              count_owners.value,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            );
                          }),
                          SizedBox(height: 20.h),
                          Text(
                            "owners",
                            style: TextStyle(
                                fontSize: 18.sp, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          ///______________________ swiper button ___________________
          PhloxAnimations(
            duration: Duration(seconds: 1),
            fromX: -40,
            fromY: 100,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 180.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50.r)),
                  child: SwipeableButtonView(
                      buttontextstyle:
                          TextStyle(fontSize: 30.sp, color: Colors.white70),
                      buttonText: "     > > >",
                      buttonWidget: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                      activeColor: Colors.black45,
                      buttonColor: Colors.white,
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(const Duration(seconds: 0), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        setState(() {
                          isFinished = false;
                        });
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
