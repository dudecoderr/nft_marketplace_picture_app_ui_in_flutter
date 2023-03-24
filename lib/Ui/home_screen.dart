import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phlox_animations/phlox_animations.dart';

import 'grid_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121314),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                PhloxAnimations(
                  duration: Duration(seconds: 3),
                  fromX: -70,
                  child: Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white10,
                          border: Border.all(color: Colors.white10)),
                      child: const Center(
                          child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ))),
                ),
                Spacer(),
                PhloxAnimations(
                  duration: Duration(seconds: 3),
                  fromX: 70,
                  child: Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white10,
                          border: Border.all(color: Colors.white10)),
                      child: const Center(
                          child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: PhloxAnimations(
                duration: Duration(seconds: 3),
                fromY: -100,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFfff6de),
                                  blurRadius: 90.0,
                                  offset: Offset(0.0, 0.20))
                            ],
                            color: Color(0xFFfff6de),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/profile_image_1.png"),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "@hesamjr",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Hesam Link",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: Container(
                          height: 55.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color:
                                selected == true ? Colors.black : Colors.white,
                            border: Border.all(
                                color: selected == true
                                    ? Colors.white
                                    : Colors.white,
                                width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                selected == true ? "unfollow" : "follow",
                                style: TextStyle(
                                  color: selected == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                selected ? Icons.person_off : Icons.person_add,
                                color: selected == true
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///______________ grid _________
            SizedBox(height: 10.h),
            Align(alignment: Alignment.bottomCenter, child: CreatedPage()),
          ],
        ),
      ),
    );
  }
}
