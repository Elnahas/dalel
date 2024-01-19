import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/features/on_boarding/functions/on_boarding.dart';
import 'package:dalel/features/on_boarding/views/widgets/custom_nav_bar.dart';
import 'package:dalel/features/on_boarding/views/widgets/get_buttons.dart';
import 'package:dalel/features/on_boarding/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 40,
              ),
              CustomNavBar(onTap: (){
                onBoardingVisited();
                customReplacementNavigate(context, "/signUp");
              },),
              OnBoardingWidgetBody(
                controler: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              GetButtons(controller: _controller , currentIndex: currentIndex),
              SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}


