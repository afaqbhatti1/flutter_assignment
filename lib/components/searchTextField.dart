import 'package:flutter/material.dart';

Widget SearchTextField(
    TextEditingController textController, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey,
    ),
    child: TextFormField(
      controller: textController,
      onChanged: (v) {
        v;
        textController.text = v.toLowerCase();
        textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length),
        );
      },
      cursorColor: Colors.black54,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 16,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: 'Search here',
        hintStyle: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.black54,
        ),
      ),
    ),
  );
}
