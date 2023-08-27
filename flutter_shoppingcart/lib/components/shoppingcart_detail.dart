import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingCartDetail extends StatelessWidget {
  const ShoppingCartDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              _buildDetailNameAndPrice(),
              _buildDetailRatingAndReviewCount(),
              _buildDetailColorOptions(),
              _buildDetailButton(context),
            ],
          ),
        ));
  }

  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Urban Soft AL 10.0",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("\$699",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Spacer(),
          Text("review "),
          Text("(26)", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildDetailColorOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Color Options"),
            SizedBox(height: 10),
            Row(
              children: [
                _buildDetailIcon(Colors.black),
                _buildDetailIcon(Colors.green),
                _buildDetailIcon(Colors.orange),
                _buildDetailIcon(Colors.grey),
                _buildDetailIcon(Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Stack위젯
  Widget _buildDetailIcon(Color mColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Stack(
        //자식들이 겹쳐진다.
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                shape: BoxShape.circle //아래처럼 해도된다.
                // borderRadius: BorderRadius.circular(25)
                ),
          ),
          Positioned( //위에 쌓일 모형에 positioned적용
            // 가운데 규칙: (외부크기 -내부크기)/2
            left: 5,
            top: 5,
            child: ClipOval(  //ClipOver는 위젯이 모양이 잡을 수 있는 속성이 없을때 사용한다.
              child: Container(
                width: 40,
                height: 40,
                color: mColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoDialog(//이 함수는 대화상자를 화면에 표시하는 역할을 합니다. 대화상자를 화면에 나타내기 위해서는 배경 화면 뒤로의 모든 것을 가리는 모달 오버레이(modal overlay)와 함께 해당 대화상자를 화면의 최상단에 표시하는 로직이 필요합니다
            context: context,//어느화면에 띄워줄지 현재위치결정.  위젯의 현재 위치나 앱의 상태에 액세스하는 데 사용됩니다.
            builder: (context) =>
                CupertinoAlertDialog(title: Text("장바구니에 담으시겠습니까?"), actions: [ // actions는 CupertinoAlertDialog 위젯에서 사용되는 속성 중 하나로, 대화상자의 하단에 위치하는 일련의 버튼들을 정의합니다.
                  CupertinoDialogAction(
                    child: Text("확인"),
                    onPressed: () {
                      print("장바구니에 담김");
                      Navigator.pop(context);
                    },
                  )
                ]));
      },
      child: Text("Add to cart", style: TextStyle(color: Colors.white)),
      style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder(
            // 꼭 기억하기.
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}
