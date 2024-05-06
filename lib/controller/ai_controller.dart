import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiController extends GetxController {
  final TextEditingController textController = TextEditingController();
  late final GenerativeModel _model;
  late final Rx<ChatSession> chatSession;
  RxList history = [].obs;
  final FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    _model = GenerativeModel(
        model: 'gemini-pro', apiKey: 'AIzaSyAEqcD0i8XPGCJhMn9R2mRgY1qjGE790ro');
    chatSession = _model.startChat().obs;
    super.onInit();
  }

  Future<ChatSession> sendMessage(String message) async {
    final response = await chatSession.value.sendMessage(Content.text(
      message,
    ));
    return chatSession.value;
  }
}
