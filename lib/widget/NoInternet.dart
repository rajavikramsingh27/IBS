import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';

class NoInternet extends StatelessWidget {
  final VoidCallback? onRetry;

  NoInternet({Key? key, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Image.asset(Assets.noInternet),
          ),
          Text(
            "Oops!",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "There is no Internet connection\nPlease check your Internet connection",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: AppColors.primaryColor)),
                ),
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor)),
            child: FittedBox(
              child: Text(
                "RETRY",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: FontSize.s12,
                ),
              ),
            ),
            onPressed: onRetry,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
