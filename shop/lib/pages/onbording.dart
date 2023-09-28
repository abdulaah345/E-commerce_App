import 'package:flutter/material.dart';
import 'package:shop/helper/custom_boarding.dart';
import 'package:shop/helper/custom_color.dart';
import 'package:shop/pages/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class modelboarding {
  final String image;
  final String text;
  final String body;

  modelboarding({required this.image, required this.text, required this.body});
}

class onboardung extends StatefulWidget {
  static String id = 'boarding';
  onboardung({super.key});

  @override
  State<onboardung> createState() => _onboardungState();
}

class _onboardungState extends State<onboardung> {
  var boardcontroller = PageController();

  List<modelboarding> boarding = [
    modelboarding(
      image: 'assets/images/2803207.jpg',
      text: 'Discover Amazing Products',
      body:
          'Explore a wide range of products from various categories in our store app.',
    ),
    modelboarding(
      image: 'assets/images/5521177.png',
      text: 'Easy Shopping Experience',
      body:
          'Enjoy a hassle-free shopping experience with our user-friendly store app.',
    ),
    modelboarding(
      image: 'assets/images/shopping-basket.png',
      text: 'Secure and Fast Checkout',
      body: 'Shop with confidence using our secure and fast checkout process.',
    )
  ];
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Loginshop.id);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Kcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else {
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  controller: boardcontroller,
                  itemBuilder: ((context, index) => builditem(boarding[index])),
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Kcolor,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5.0,
                      ),
                      controller: boardcontroller,
                      count: boarding.length),
                  SizedBox(
                    height: 30,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Kcolor,
                    onPressed: () {
                      if (islast) {
                        Navigator.pushNamed(context, Loginshop.id);
                      } else {
                        boardcontroller.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget builditem(modelboarding model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset('${model.image}')),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.text}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text('${model.body}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
        ],
      );
}
