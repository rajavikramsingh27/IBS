import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ibs/Widget/imagesilder/DotsIndicator.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<String> imageUrls;
  final BorderRadius imageBorderRadius;
  final double imageHeight;
  final bool isStack;

  ImageSliderWidget({
    Key key,
    @required this.imageUrls,
    this.imageBorderRadius,
    this.imageHeight = 350.0,
    this.isStack,
  }) : super(key: key);

  @override
  ImageSliderWidgetState createState() {
    return new ImageSliderWidgetState();
  }
}

class ImageSliderWidgetState extends State<ImageSliderWidget> {
  List<Widget> _pages = [];

  int page = 0;

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _pages = widget.imageUrls.map((url) {
      return _buildImagePageItem(url);
    }).toList();
    // Timer.periodic(Duration(seconds: 2), (Timer timer) {
    //   if (page < widget.imageUrls.length-1) {
    //     page++;
    //   } else {
    //     page = 0;
    //   }
    //   _controller.animateToPage(
    //     page,
    //     duration: Duration(milliseconds: 350),
    //     curve: Curves.easeInCirc,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return _buildingImageSlider();
  }

  Widget _buildingImageSlider() {
    return Container(
      height: widget.imageHeight,
      padding: EdgeInsets.all(0.0),
      child: Container(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        //  elevation: 0.0,
        child: widget.isStack
            ? Stack(
                children: [
                  _buildPagerViewSlider(),
                  _buildDotsIndicatorOverlay(),
                ],
              )
            : Column(
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.white, child: _buildPagerViewSlider())),
                  Container(
                      color: Colors.white, child: _buildDotsIndicatorOverlay()),
                ],
              ),
      ),
    );
  }

  Widget _buildPagerViewSlider() {
    return widget.isStack
        ? Positioned.fill(
            child: PageView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
              onPageChanged: (int p) {
                setState(() {
                  page = p;
                });
              },
            ),
          )
        : PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
            onPageChanged: (int p) {
              setState(() {
                page = p;
              });
            },
          );
  }

  Widget _buildDotsIndicatorOverlay() {
    return widget.isStack
        ? Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(
                color: widget.isStack ? Colors.white : Colors.black,
                controller: _controller,
                itemCount: _pages.length,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: DotsIndicator(
              color: widget.isStack ? Colors.white : Colors.black,
              controller: _controller,
              itemCount: _pages.length,
              onPageSelected: (int page) {
                _controller.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
          );
  }

  Widget _buildImagePageItem(String imgUrl) {
    return ClipRRect(borderRadius: widget.imageBorderRadius
        // child:
        //Image.asset(imgUrl,fit: BoxFit.fill,)
        // CachedNetworkImage(
        //   imageUrl: imgUrl,
        //   placeholder: (context, url) => Center(
        //     child: Platform.isIOS
        //         ? CupertinoActivityIndicator()
        //         : CircularProgressIndicator(),
        //   ),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        //   fit: widget.isStack?BoxFit.cover:BoxFit.contain,
        // ),
        );
  }
}
