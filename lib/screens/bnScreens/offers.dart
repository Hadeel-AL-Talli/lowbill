import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lowbill/widgets/on_boarding_content.dart';
import 'package:lowbill/widgets/on_boarding_indicator.dart';
class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
   late PageController _pageController;
  int _currentpage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: 0,
                    maxWidth: double.infinity,
                    minHeight: 0,
                    maxHeight: 500),
                child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        _currentpage = value;
                        print(value);
                      });
                    },
                    children: [
                      OnBoardingContent(
                        imagepath: 'images/sales.jpg',
                        title: 'Eid Offer',
                        subTitle:
                            'Full House Floor Cleaning  ',
                      ),
                      OnBoardingContent(
                        imagepath: 'images/sales.jpg',
                        title: 'Full House Floor Cleaning  ',
                        subTitle:
                            ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.',
                      ),
                      OnBoardingContent(
                        imagepath: 'images/sales.jpg',
                        title: 'Full House Floor Cleaning ',
                        subTitle: ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.',
                      ),
                    ]),
              ),


              Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: _currentpage > 0 ? Color(0xffF59A23): Colors.grey,
              ),
              Visibility(
                visible: _currentpage < 2,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icon(Icons.arrow_forward_ios,
                      color: Color(0xffF59A23)),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnBoardingIndicator(
                marginEnd: 10,
                selected: _currentpage == 0,
              ),
              OnBoardingIndicator(
                marginEnd: 10,
                selected: _currentpage == 1,
              ),
              OnBoardingIndicator(
                selected: _currentpage == 2,
              )
            ],
          )
      ],
    );
  }
}