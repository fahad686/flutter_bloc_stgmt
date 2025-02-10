import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';



class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen for duration updates
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen for position updates
    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // Listen for completion
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero; // Reset progress bar
      });
    });
  }

  void _playAudio() async {
    if (!isPlaying) {
      await _audioPlayer.play(UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    } else {
      await _audioPlayer.pause();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose player when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildTextMessage("Hi Kawsar, I am a cardio patient. I need help immediately.", false),
                _buildVoiceMessage(),
                _buildTextMessage("Hi, don't worry! I'm here. Let me know your situation.", true),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildTextMessage(String text, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSender ? Colors.amber : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }


  Widget _buildVoiceMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _playAudio,
            ),
            SizedBox(
              width: 100,
              height: 40, // Adjust based on your animation
              child: Lottie.asset(
                'assets/lottie_animation/Animation - 1739213373248.json',
                animate: isPlaying, // Play animation only when audio is playing
              ),
            ),
            SizedBox(width: 10),
            Text(
              "${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message",
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.mic, color: Colors.amber),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
