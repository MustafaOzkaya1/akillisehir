import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'chatbot_api.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  // Flutter TTS instance
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initializeTts();
  }

  // TTS motorunu başlatma ve dil ayarlarını yapma
  Future<void> _initializeTts() async {
    try {
      bool isLanguageAvailable = await flutterTts.isLanguageAvailable("tr-TR");
      if (isLanguageAvailable) {
        await flutterTts.setLanguage("tr-TR");
      } else {
        print("Seçilen dil bu cihazda desteklenmiyor, varsayılan dili kullanıyor.");
        await flutterTts.setLanguage("en-GB"); // Alternatif dil ayarı yapabilirsiniz
      }

      await flutterTts.setPitch(1.0);
      flutterTts.awaitSpeakCompletion(true);

      var engines = await flutterTts.getEngines;
      if (engines != null && engines.isNotEmpty) {
        print("TTS motoru başarıyla başlatıldı: $engines");
      } else {
        print("Cihazda TTS motoru mevcut değil veya başlatılamadı.");
      }
    } catch (e) {
      print("TTS motoru başlatılamadı: $e");
    }
  }

  void _sendMessage() async {
    String userMessage = _controller.text;

    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "message": userMessage});
      _isLoading = true;
    });

    _controller.clear();

    try {
      String response = await ApiService.getChatResponse(userMessage);
      String decodedMessage = utf8.decode(response.runes.toList());
      setState(() {
        _messages.add({"sender": "bot", "message": decodedMessage});
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _messages.add({
          "sender": "bot",
          "message": "Bir hata oluştu, lütfen daha sonra tekrar deneyin."
        });
        _isLoading = false;
      });
    }
  }

  Future<void> _speak(String message) async {
    try {
      await flutterTts.speak(message);
    } catch (e) {
      print("TTS konuşma hatası: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CHATBOT',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isLoading && index == _messages.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: Icon(FontAwesomeIcons.robot),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Text(
                                'Typing...',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                String sender = _messages[index]["sender"]!;
                String message = _messages[index]["message"]!;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Align(
                    alignment: sender == "user"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: sender == "user"
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sender == "user"
                          ? [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16.0),
                                  margin: const EdgeInsets.only(right: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    message,
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                              
                              
                                
                                backgroundColor: Colors.purple,
                              
                              
                                
                                child: ClipRRect(
                                 
                                  borderRadius: BorderRadius.circular(60),
                          
                                  child: Image.asset("images/prof.png")),
                              ),
                            ]
                          : [
                              CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                child: Image.asset("images/s.png"),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green[50],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        message,
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.volume_up,
                                            color: Colors.black54,
                                          ),
                                          onPressed: () => _speak(message),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                    ),
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
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Mesajınızı yazınız...',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
