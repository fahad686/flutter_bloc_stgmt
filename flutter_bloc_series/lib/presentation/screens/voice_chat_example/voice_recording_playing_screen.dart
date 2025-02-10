import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecordingPlayingScreen extends StatefulWidget {
  const VoiceRecordingPlayingScreen({super.key});

  @override
  _VoiceRecordingPlayingScreenState createState() => _VoiceRecordingPlayingScreenState();
}

class _VoiceRecordingPlayingScreenState extends State<VoiceRecordingPlayingScreen> {
  FlutterSoundRecorder? _recorder;
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _filePath;
  List<Map<String, dynamic>> messages = []; // Store messages (text & voice)

  @override
  void initState() {
    super.initState();
    _initRecorder();
    _initPlayer();
  }

  Future<void> _initRecorder() async {
    _recorder = FlutterSoundRecorder();
    await _recorder!.openRecorder();
    await Permission.microphone.request();
  }

  Future<void> _initPlayer() async {
    await _player.openPlayer();
  }

  Future<void> _startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    _filePath = "${directory.path}/recording.aac";
    await _recorder!.startRecorder(toFile: _filePath);
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder!.stopRecorder();
    setState(() {
      _isRecording = false;
    });

    if (_filePath != null) {
      messages.add({"type": "voice", "filePath": _filePath});
      setState(() {});
    }
  }

  Future<void> _playPauseAudio(String filePath) async {
    if (_isPlaying) {
      await _player.pausePlayer().runtimeType;
    } else {
      await _player.startPlayer(fromURI: filePath);
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _player.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                if (message["type"] == "text") {
                  return _buildTextMessage(message["text"]);
                } else {
                  return _buildVoiceMessage(message["filePath"]);
                }
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildTextMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildVoiceMessage(String filePath) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () => _playPauseAudio(filePath),
            ),
            Lottie.asset(
              'assets/lottie_animation/Animation - 1739213373248.json',
              width: 100,
              height: 50,
              animate: _isPlaying,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    TextEditingController _textController = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GestureDetector(
            onLongPress: _startRecording,
            onLongPressUp: _stopRecording,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.mic, color: Colors.white),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                messages.add({"type": "text", "text": _textController.text});
                _textController.clear();
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
