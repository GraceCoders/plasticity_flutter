import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plasticity/components/custom_surfix_icon.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';
import 'package:plasticity/views/auth/signin_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SignInScreen()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, String title, [double width = 350]) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
            style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700 , fontColor: kDarkGrayBlack),
           ),
          SvgPicture.asset(
            'assets/icons/$assetName',
            width: width,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle =  TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14

    );

    const pageDecoration = const PageDecoration(

      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      titlePadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      bodyAlignment: Alignment.topCenter,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: Center(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: Text(''),
              ),
            ),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit magna aliqua.",
          image: _buildImage('illus1.svg' , 'Find your match'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit magna aliqua.",
          image: _buildImage('illus2.svg' ,  'Join or create groups'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",

          body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit magna aliqua.",
          image: _buildImage('illus1.svg' , 'Search your interests'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      isBottomSafeArea: false,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip' , style: TextStyle(fontSize: 14 ,color: kDarkBlack, fontWeight: FontWeight.w400),),
      next: const CustomSurffixIcon(
        svgIcon: 'assets/icons/next_arrow.svg',
        size: 45,
      ),
      done: const  CustomSurffixIcon(
      svgIcon: 'assets/icons/next_arrow.svg',
      size: 45,
    ),
      //curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.only(bottom: 80),
      controlsPadding: const EdgeInsets.fromLTRB(10.0, 4.0, 8.0, 10.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: kColorPrimary,
        color: kLightGrey,
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
      ),
      // dotsContainerDecorator: const ShapeDecoration(
      //   color: Colors.black87,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
     // ),
    );
  }
}
