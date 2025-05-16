import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GoogleGeminiIntegration extends StatefulWidget {
  const GoogleGeminiIntegration({super.key});

  @override
  State<GoogleGeminiIntegration> createState() =>
      _GoogleGeminiIntegrationState();
}

class _GoogleGeminiIntegrationState extends State<GoogleGeminiIntegration> {
  final TextEditingController controller = TextEditingController();
  final Map<String, String> chat = {};
  final ScrollController _scrollController = ScrollController();

  Future<dynamic> geminiIntegrationPractical(String question) async {
    final gemini = Gemini.instance;
    gemini.info(model: 'gemini-2.0-flash-exp');
    final response = await gemini.text(question);
    try {
      return response;
    } catch (e) {
      return e;
    }
  }

  void sendQuestion() async {
    final question = controller.text;
    FocusManager.instance.primaryFocus?.unfocus();
    if (question.isNotEmpty) {
      setState(() {
        chat[question] = '...'; // Indicate loading response
      });
      final response = await geminiIntegrationPractical(question);
      setState(() {
        chat[question] = response.content.parts[0].text;
      });
      controller.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent -
            _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  final entry = chat.entries.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6A0DAD),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.question_mark_outlined,
                                  color: Color(0xFFE2D3F5)),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  entry.key,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFFE2D3F5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE2D3F5),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.chat_outlined,
                                  color: Color(0xFF6A0DAD)),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  entry.value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF6A0DAD),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.send,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter your question',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(color: Color(0xFFE2D3F5)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(color: Color(0xFFE2D3F5)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: sendQuestion,
                          icon:
                              const Icon(Icons.send, color: Color(0xFFE2D3F5)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
