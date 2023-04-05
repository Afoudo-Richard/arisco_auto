import 'package:arisco_auto/arisco_auto.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBottomNavigationBarBloc, AppBottomNavigationBarState>(
      builder: (context, state) {
        return Container(
          height: 50.sp,
          padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 0),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
                spreadRadius: 0,
                offset: Offset(0, -8),
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavItem(
                    active: state.activePage is HomePage,
                    icon: LineIcons.home,
                    text: "Home",
                    onTap: () {},
                    isExplorer: true,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool active;
  final void Function() onTap;
  final bool isExplorer;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.text,
    required this.active,
    required this.onTap,
    this.isExplorer = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
            SizerUtil.deviceType == DeviceType.mobile ? 5.sp : 9.sp),
        decoration: BoxDecoration(
          // color: active ? Color(0XFFEEECED) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: active ? Border.all(color: secondaryColor) : null,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: active ? primaryColor : Colors.grey,
              size: SizerUtil.deviceType == DeviceType.mobile ? 18.sp : 9.sp,
            ),
            active
                ? Column(
                    children: [
                      0.5.h.ph,
                      CustomCircle(
                        color: primaryColor,
                        radius: 3.sp,
                      ),
                    ],
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: SizerUtil.deviceType == DeviceType.mobile
                          ? 7.sp
                          : 3.sp,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
