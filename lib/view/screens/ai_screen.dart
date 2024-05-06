import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:dawaay/controller/ai_controller.dart';
import 'package:dawaay/view/widgets/gap_widget.dart';
import 'package:dawaay/view/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiScreen extends GetWidget<AiController> {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Ai'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.history.length,
                controller: controller.scrollController,
                itemBuilder: (context, index) {
                  final content =
                      controller.chatSession.value.history.toList()[index];
                  final text = content.parts
                      .whereType<TextPart>()
                      .map<String>((e) => e.text)
                      .join('');
                  return MessageWidget(
                      text: text, isFromUser: content.role == 'user');
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: controller.focusNode,
                    controller: controller.textController,
                    //onSubmitted: sendMessage,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: DawaayColors.kprimaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: DawaayColors.kprimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const GapWidget(15),
                Obx(
                  () => IconButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => sendMessage(controller.textController.text),
                    icon: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendMessage(String message) async {
    controller.isLoading.value = true;
    try {
      var newChat = await controller.sendMessage(message);
      controller.chatSession.value = newChat;
      controller.history.add(newChat.history.last);
      controller.history.add(newChat.history.last);
      controller.isLoading.value = false;
      scrollDown();
    } catch (e) {
      showError(e.toString());
      controller.isLoading.value = false;
    } finally {
      controller.textController.clear();
      controller.isLoading.value = false;
      controller.focusNode.requestFocus();
    }
  }

  void scrollDown() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => controller.scrollController.animateTo(
              controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 750),
              curve: Curves.easeOutCirc,
            ));
  }

  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
