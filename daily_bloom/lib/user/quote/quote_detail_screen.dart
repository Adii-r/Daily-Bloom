import 'package:flutter/material.dart';
import '../../models/quote.dart';
import '../../services/favorite_service.dart';
import 'package:just_audio/just_audio.dart';

class QuoteDetailScreen extends StatefulWidget {
  final Quote quote;
  const QuoteDetailScreen({
    super.key,
    required this.quote,
  });
  @override
  State<QuoteDetailScreen> createState() =>
      _QuoteDetailScreenState();

}


class _QuoteDetailScreenState extends State<QuoteDetailScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.playingStream.listen((playing) {
      setState(() {
        isPlaying = playing;
      });
    });

    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _duration = duration ?? Duration.zero;
      });
    });

    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _position = position;
      });
    });
    _initAudio();
  }

  void _initAudio() async {
    try {
      await _audioPlayer.setAsset("assets/audio/audio.mp3");
    } catch (e) {
      debugPrint("Error loading audio asset: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void playQuoteAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      if (_position >= _duration) {
        await _audioPlayer.seek(Duration.zero);
      }
      await _audioPlayer.play();
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final totalMs = _duration.inMilliseconds;
    final currentMs = _position.inMilliseconds;
    double sliderValue = (totalMs > 0) ? (currentMs / totalMs) : 0.0;
    sliderValue = sliderValue.clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(
          height: 900,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
                SizedBox(
                  height: 330,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "assets/images/background.png",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.black.withValues(alpha: 0.15),
                      ),
                      SafeArea(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 2,
                  right: 2,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 35, 24, 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6FCF97),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            widget.quote.author,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          '"${widget.quote.text}"',
                          style: const TextStyle(
                            fontFamily: "CormorantGaramond",
                            fontSize: 34,
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF8EF),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.quote.category,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  height: 1.7,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                          GestureDetector(
                          onTap: playQuoteAudio,

                            child: Container(
                              width:48,
                              height:48,
                              decoration: const BoxDecoration(
                                      color: Color(0xFF6FCF97),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      splashRadius: 30,

                                      onPressed: () {
                                        playQuoteAudio();
                                      },

                                      icon: Icon(
                                        isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                          ),
                                  const SizedBox(width: 15),
                                  const Expanded(
                                    child: Text(
                                      "Narrated Quote",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 4,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 7,
                                  ),
                                  overlayShape: SliderComponentShape.noOverlay,
                                  activeTrackColor: const Color(0xFF6FCF97),
                                  inactiveTrackColor: Colors.grey.shade300,
                                  thumbColor: const Color(0xFF6FCF97),
                                ),
                                child: Slider(
                                  value: sliderValue,
                                  onChanged: (newValue) async {
                                    final targetPosition = Duration(
                                      milliseconds: (newValue * totalMs).round(),
                                    );
                                    await _audioPlayer.seek(targetPosition);
                                  },
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _formatDuration(_position),
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      _formatDuration(_duration),
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  FavoriteService.toggleSave(widget.quote);
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFF6FCF97),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        FavoriteService.isSaved(widget.quote)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: const Color(0xFF6FCF97),
                                        size: 22,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        FavoriteService.isSaved(widget.quote)
                                            ? "Saved"
                                            : "Save",
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFF6FCF97),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.share_outlined,
                                        color: const Color(0xFF6FCF97),
                                        size: 22,
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Share",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
          ),
            ),
          ],
        ),
      ),
    );
  }
}