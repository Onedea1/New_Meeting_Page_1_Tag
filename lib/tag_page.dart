import 'package:flutter/material.dart';

import 'const/colors.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  List<String> _displayTexts = [];
  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(
          '모임 만들기',
          style: TextStyle(
              height: 1.66,
              color: MIXIN_BLACK_1,
              fontFamily: 'SUIT',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: ImageIcon(
            AssetImage('assets/images/Back.png'),
            size: 26,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24,0,24,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text('태그',style: TextStyle(
                  fontWeight: FontWeight.w600,fontFamily:'SUIT', fontSize: 14, color: MIXIN_BLACK_1
                ),),
                SizedBox(height: 16,),
                TextField(
                  controller: _textEditingController,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: '사람들이 모임을 더 찾기 쉽게 태그를 걸어주세요',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: MIXIN_BLACK_5, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: MIXIN_BLACK_5, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SUIT',
                      fontWeight: FontWeight.w500,
                      color: MIXIN_BLACK_4,
                    ),
                    filled: true,
                    fillColor: MIXIN_BLACK_5,
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      _displayTexts.add(value);
                      _textEditingController.clear();
                    });
                  },
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _displayTexts
                      .asMap()
                      .entries
                      .map((entry) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _displayTexts.removeAt(entry.key);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: MIXIN_BLACK_5,
                        border: Border.all(color: MIXIN_BLACK_5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '#${entry.value}',
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'SUIT',color: Color(0xFF51B49F)),
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
