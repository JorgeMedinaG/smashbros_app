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
            imageUrl: 'https://s3-alpha-sig.figma.com/img/1501/97c4/5f3e2fa1c1d369520ba6014f8f789b19?Expires=1634515200&Signature=N6DbwGgyhulOrqc6nknkfgLX2WZj0k9t0lULM0d-pYZciiW6fMqMSw-VWxY3oJAuhQuSfI~PtwPpFraqYNf~jcWQZZziblXc84J0MUqxORZJPr7-FQjo4ngl0LMQnGmtPyH0ZR9izQOlOU9y4iQ27rr-mKO~8ZVnwtbBtDw~cjK4i1GJ9z-9EDuASM41kD2yyr~vUYhC07-Tvhamwg~3HX9edHIVo-JbuGMxBzEq8cERe-WS3d4dCTCqQMQLbMzE53nzyIaANnjzFqnM67N0sr2TFnUzD4rkDR3--ZKS-iG3spgsOgyMjuThT4Db5XIdTt3WvS-sxViFPiNNE4YcCQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA', 
            bodyText: 'Access Our Extended Catalog', 
            buttonText: "Next",
            callback: () => _controller.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
          ),
          Page(
            imageUrl: 'https://s3-alpha-sig.figma.com/img/8b0f/8e0e/34922ef3a4763a62a48b51ace0609e2d?Expires=1634515200&Signature=T7npcroJOwvIN4eZEIvIPsqfTUSrm4jdRbSEnXwHNW7JIBH1k4RiovYDCy7Fpt3JIJjcOCDvyYu2ewg5PMEfXFfSeOUyaurrsZMBbyooqrk8~pOT0wnBu2TQ9SS9tP6~uzFg7H5upb4wm3mFIQUQIqSdIUkohWBCYgFh1ddj5jgRIv8-0ZNFLAb4M9uTC2d1OrmMiLz8SCodSS9eWCMTLFNTijGru6QJ4CpXJLQciG2BmLeR8kwx1h~RYzIIBH21k8d6sTtADVwl0llk7wu1rKRCkGaRuuzdibag0WqmAJFMHMFTHYZIPtXBP0SkX-xBR9EDNmyKlyBIWV3ICtpR7g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
            bodyText: 'Filter Universes', 
            buttonText: "Next",
            callback: () => _controller.animateToPage(2, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
          ),
          Page( 
            imageUrl: 'https://s3-alpha-sig.figma.com/img/f451/3983/fa80dbef07d93f55466e603b86310314?Expires=1634515200&Signature=GZfHJ3ip6oOEV8XFkqFB4Ud99iOTe7ew~Ax8m4H26~YSqqmick0XMgo4EVMWvlrEDBQ6kPm4cYhaw7YhUcsg2RCO7ndmnZUSCrnq3vI~bYA5bQbjXGJqn-IhqMjuFBvStYbVwN5wmbmZVMWxCmbBIfZGSgQ3i0eNjIkCtuWExjwYyBWoaJUz4RONDCIYCf4TTm-eEaBbri7Vk4sdH3W5OS4ie7cLmnoiduMcTOJOe3iaDJ8JRX3dCXJ~kWhrLAxxKK2LsiTCuaIvzR-PxzjCIn790sFf9JnisR-dydv3C12TfHx3NuMZh6mElDj7SLvy3lEtT6pgf~lQ8DlRCLg9ew__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA', 
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

  final String imageUrl;
  final String? bodyText;
  final String? buttonText;
  final void Function()? callback;

  const Page({ 
    Key? key,
    required this.imageUrl,
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
            Center(child: Image.network(imageUrl)),
            Container(
              margin: const EdgeInsets.only(left: 52.0, right: 52.0, bottom: 80.0, top: 10.0 ),
              alignment: Alignment.center,
              child: Text(bodyText ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36.0,
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
