import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:Tiwee/presentation/screens/home/home_page.dart';

final forwardProvider = StateProvider<bool>((ref) {
  return true;
});

class MainAppbar extends StatefulWidget {
   MainAppbar({
    Key? key,
    required this.widget,
    this.havSettingBtn=false

  }) : super(key: key);
  final Widget widget;
  final bool havSettingBtn;

  @override
  State<MainAppbar> createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void changePage(PageController pageController, int index) async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      index == 0
          ? pageController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.bounceOut)
          : pageController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.bounceOut);
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff6A359C), Color(0xff9969C7)])),
                child: const Icon(
                  LineIcons.play,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Tiwee",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 21),
                ),
              ),
              const SizedBox(
                  height: 35,
                  child: VerticalDivider(color: Colors.grey, thickness: 1)),
              widget.widget
            ],
          ),
          widget.havSettingBtn?Consumer(builder: (context, ref, child) {
            final pageController = ref.watch(pageControllerProvider);
            final forward = ref.watch(forwardProvider.state);

            return GestureDetector(
                onTap: () {
                  print(forward.state);
                   _controller.forward();
                  forward.state = !forward.state;
                  print(forward);
                  changePage(pageController, forward.state ? 1 : 0);
                },
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey)),
                    child: Transform.scale(
                        scale: 0.8,
                        child: RotationTransition(
                          turns:
                              Tween(begin: 0.0, end: 3.1).animate(_controller),
                          child: SvgPicture.asset(
                            "assets/icons/setting.svg",
                          ),
                        ))));
          }):Container()
        ],
      ),
    );
  }
}
