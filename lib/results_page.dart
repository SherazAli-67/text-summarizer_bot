import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget{
  const ResultsPage({super.key, required String introduction, required List<dynamic> keyPoints, required String conclusion}) : _introduction = introduction, _keyPoints = keyPoints, _conclusion = conclusion;
  final String _introduction;
  final List<dynamic> _keyPoints;
  final String _conclusion;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          spacing: 20,
          children: [
            _buildResultItemWidget(title: 'Introduction', content: _introduction),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  'Key Points',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(_keyPoints.length, (index){
                   return Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10.0),
                     child: RichText(text: TextSpan(
                       children: [
                         TextSpan(
                           text: '${index+1}. ',
                           style: TextStyle(fontSize: 14,  fontWeight: FontWeight.w600, fontFamily: 'Montserrat', color: Colors.black),
                         ),
                         TextSpan(
                           text: _keyPoints[index],
                           style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', color: Colors.black),
                         )
                       ]
                     )),
                   );
                  }),
                ),
              ],
            ),
            _buildResultItemWidget(title: 'Conclusion', content: _conclusion),
          ],
        ),
      )),
    );
  }


  Widget _buildResultItemWidget({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(content, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
