import 'package:flutter/material.dart';
import 'package:flutter_airbnb/size.dart';
import 'package:flutter_airbnb/styles.dart';

class HomeBodyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Stack(
        children: [
          _buildBannerImage(),
          _buildBannerCaption(),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/banner.jpg",
        fit: BoxFit.cover, // 사진은 반드시 BoxFit.cover해줄것 이미지가 꺠지진않음 짤릴뿐
        height: 320,
        width: double.infinity,
      ),
    );
  }

  Widget _buildBannerCaption() {
    return Positioned(
        top: 40,
        left: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//왼쪽정렬
          children: [
            Container(
                constraints: BoxConstraints(//제약조건을 자식에게 전달하는방법. 결과는 같지만, 컨테이너의 넓이를 제한하는것보다 이게 낫다.
                    maxWidth: 250),
                child:
                    Text("이제 , 여행은 가까운 곳에서 ", style: h4(mColor: Colors.white))),
            SizedBox(
              height: gap_m,
            ),
            Container(
              constraints: BoxConstraints(//제약조건을 자식에게 전달하는방법. 결과는 같지만, 컨테이너의 넓이를 제한하는것보다 이게 낫다.
                  maxWidth: 250),
              child: Text(
                "새로운 공간에 머물러 보세요. 살아보기 , 출장, 여행 등 다양한 목적에 맞는 숙소를 찾아보세요",
                style: subtitle1(mColor: Colors.white),
              ),
            ),
            SizedBox(height: gap_m),
            SizedBox(
              height: 35,
              width: 170,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {},
                child: Text(
                  "가까운 여행지 둘러보기",
                  style: subtitle2(),
                ),
              ),
            ),
          ],
        ));
  }
}
