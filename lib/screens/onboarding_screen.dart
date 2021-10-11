import 'package:flutter/material.dart';

import 'package:smashbros_app/widgets/widgets.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final PageController _controller = PageController(initialPage: 0);

    
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children:  [
          Page(
            imagePath: 'assets/img/1.png',
            bodyText: 'Access Our Extended Catalog', 
            buttonText: "Next",
            callback: () => _controller.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
          ),
          Page(
            imagePath: 'assets/img/2.png',
            bodyText: 'Filter Universes', 
            buttonText: "Next",
            callback: () => _controller.animateToPage(2, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
          ),
          Page( 
            imagePath: 'assets/img/3.png',
            bodyText: 'And More...', 
            buttonText: "Get Started",
            callback: () => Navigator.of(context).pushReplacementNamed('fightersList')
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {

  final String imagePath;
  final String? bodyText;
  final String? buttonText;
  final void Function()? callback;

  const Page({ 
    Key? key,
    required this.imagePath,
    required this.bodyText,
    required this.buttonText,
    this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const OnBoardBackground(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(imagePath, height: 400.0,)),
            Container(
              margin: const EdgeInsets.only(left: 52.0, right: 52.0, bottom: 80.0, top: 10.0 ),
              alignment: Alignment.center,
              child: Text(bodyText ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36.0,
                  color: Colors.white
                ),
              ),
            ),
            PageViewButton(text: buttonText, callback: callback,)
          ],
        )
      ],
    );
  }
}

class PageViewButton extends StatelessWidget {
  const PageViewButton({
    Key? key,
    required this.text,
    this.callback
  }) : super(key: key);

  final String? text;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 54.0,
      child: Container(
        alignment: Alignment.center,
        width: 192,
        height: 54.0,
        child: Text(text ?? '',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27), 
          color: const Color.fromRGBO(219, 48, 105, 1),
        )
      ),
      onPressed: callback
    );
  }
}
