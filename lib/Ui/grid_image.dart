import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:phlox_animations/phlox_animations.dart';

import '../Constant File/image_model.dart';
import 'dashboard_screen.dart';

class CreatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhloxAnimations(
      duration: Duration(seconds: 3),
      fromY: 100,
      child: Container(
        height: 320.h,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final imgList = items[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashboardScreen(
                              items: imgList.urlImages,
                              name_items: imgList.itemName,
                              index: index,
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.r),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      imgList.urlImages,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: GlassmorphicContainer(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: 25.sp,
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
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54),
                                child: Icon(
                                  Icons.diamond,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                imgList.itemName,
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "eth",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2.5 : 3),
          /*   mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,*/
        ),
      ),
    );
  }
}
