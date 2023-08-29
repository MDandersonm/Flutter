import 'package:flutter/material.dart';
import 'package:flutter_airbnb/components/home/home_body_popular_item.dart';
import 'package:flutter_airbnb/size.dart';
import 'package:flutter_airbnb/styles.dart';

class HomeBodyPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m,bottom: gap_l),
      child: Column(

        children: [
          _buildPopularTitle(),
          _buildPopularList(),
        ],
      ),
    );
  }

  Widget _buildPopularTitle() {
    return SizedBox(
      width: double.infinity,//sizedBox로 너비를 늘려줘야 왼쪽정렬이 적용된다.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,//왼쪽 정렬
        children: [
          Text(
            "한국 숙소에 직접 다녀간 게스트의 후기",
            style: h5(),
          ),
          Text(
            "게스트 후기 2,500,000개 이상, 평균 평점 4.7(5점 만점)",
            style: body1(),
          ),
          SizedBox(height: gap_m,)
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    //HomeBodyPopularItem 3개를 여기에 넣는다.
    return Wrap(
      // spacing: 7.5,  // 수평 간격
      // runSpacing: 30,  // 수직 간격
      children: [
        HomeBodyPopularItem(id: 0),
        SizedBox(
          width: 7.5,
        ),
        HomeBodyPopularItem(id: 1),
        SizedBox(
          width: 7.5,
        ),
        HomeBodyPopularItem(id: 2),
      ],
    );
  }
}
