import 'package:flutter/material.dart';
import 'package:text_summarizer_app/res/api_constant.dart';
import 'package:text_summarizer_app/service/api_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: size.width*0.5,
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 40,
                  children: [
                    Text("Text Summarizer Bot ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text("Your text here"),
                        TextField(
                          controller: _textEditingController,
                          maxLines: 10,
                          style: TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            hintStyle: TextStyle(fontSize: 13),
                            hintText: "Paste your text here ....",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        )
                      ],
                    ),
                    
                    ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber
                    ), child: Text("Generate Summary", style: TextStyle(fontSize: 15, color: Colors.white),),)

              ]),
            )),
          ),
        ),
      ),
    );
  }

  Future<void> onSubmitTap()async{
    String largeText = _textEditingController.text.trim();
    if(largeText.isEmpty){
      return;
    }
    try{
      final data = {
        "text" : largeText
      };

      final apiService = ApiService();
      final response = apiService.postRequest(endpoint: ApiConstants.summarizeTextEndPoint, data: data);
    }catch(e){
      debugPrint("Error message: ${e.toString()}");
    }

  }
}
