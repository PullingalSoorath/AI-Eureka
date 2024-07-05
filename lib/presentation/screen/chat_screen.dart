import 'package:animated_background/animated_background.dart';
import 'package:eureka/widgets/chat_text_form_field.dart';
import 'package:eureka/widgets/loading_widget.dart';
import 'package:eureka/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:eureka/util/app_const.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final GenerativeModel _model;
  late final ScrollController _scrollController;
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  late ChatSession _chatSession;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _textController = TextEditingController();
    _focusNode = FocusNode();
    _isLoading = false;

    // Set up the model
    _model = GenerativeModel(
      model: geminiModel,
      apiKey: apikey,
    );

    // Start the chat
    _chatSession = _model.startChat();
  }

  void _setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit Chat',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'Ki_Extra_Bold',
              ),
            ),
            content: Text(
              'Are you sure you want to exit the chat?\nIt will lose your last chat',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'InputSerifNarrow',
              ),
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                onPressed: () =>
                    Navigator.pop(context, true), // close the application
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'InputSerifNarrow',
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                onPressed: () => Navigator.pop(context, false), // Cancel pop
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: 'InputSerifNarrow',
                  ),
                ),
              ),
            ],
          ),
        );
        return shouldPop ?? false; // Default to not popping
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          forceMaterialTransparency: true,
          centerTitle: true,
          title: Text(
            appName,
            style: TextStyle(
              fontFamily: 'Ki_Extra_Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Exit Chat',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'Ki_Extra_Bold',
                    ),
                  ),
                  content: Text(
                    'Are you sure you want to exit the chat?\nIt will lose your last chat',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'InputSerifNarrow',
                    ),
                  ),
                  actions: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                        Navigator.pop(context, true);
                      },
                      // close the application
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: 'InputSerifNarrow',
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pop(context, false), // Cancel pop
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: 'InputSerifNarrow',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              spawnMaxSpeed: 50.0,
              spawnMinSpeed: 10.0,
              spawnMaxRadius: 10.0,
              spawnMinRadius: 10.0,
              particleCount: 40,
              spawnOpacity: 0.1,
              minOpacity: 0.5,
              maxOpacity: 0.5,
              baseColor: Colors.blue,
            ),
          ),
          vsync: this,
          child: Column(
            children: [
              // ignore: unnecessary_null_comparison
              _chatSession.history.isEmpty
                  ? Expanded(
                      flex: 50,
                      child: Center(
                        child: Text(
                          'How can I help you now?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            fontFamily: 'Ki_Extra_Bold',
                          ),
                        ),
                      ),
                    )
                  : Visibility(
                      visible: _isLoading,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Fetching data',
                            style: TextStyle(
                              fontFamily: 'Ki_Extra_Bold',
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ThreeDotLoading(),
                        ],
                      ),
                    ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _chatSession.history.length,
                    itemBuilder: ((context, index) {
                      var content = _chatSession.history.toList()[index];
                      final message = _getMesageFromContent(content);
                      return MessageWidget(
                        message: message,
                        isFromUser: content.role == "user",
                      );
                    }),
                  ),
                ),
              ),
              // Visibility(
              //   visible: _chatSession.history.isEmpty,
              //   child: Row(
              //     children: [
              //       TextButton(
              //         onPressed: () {
              //           _textController.text = "Change your language to English";
              //           _onSentChatMessage(_textController.text);
              //         },
              //         child: const Text(
              //           'English',
              //         ),
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           _textController.text =
              //               "Set default language to Malayalam";
              //           _onSentChatMessage(_textController.text);
              //         },
              //         child: const Text(
              //           'Malayalam',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Form(
                        key: _formKey,
                        child: ChatTextFormField(
                          onchanged: (value) => _formKey.currentState!.validate,
                          controller: _textController,
                          focusNode: _focusNode,
                          isReadOnly: _isLoading,
                          onFieldSubmitted: _onSentChatMessage,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (!_isLoading) ...{
                      IconButton(
                        onPressed: () {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                          _onSentChatMessage(_textController.text);
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                      )
                    } else
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ThreeDotLoading(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMesageFromContent(Content content) {
    return content.parts.whereType<TextPart>().map((e) => e.text).join('');
  }

  void _onSentChatMessage(String message) async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    //Circular progress indicator
    _setLoading(true);

    try {
      final response = await _chatSession.sendMessage(
        Content.text(message),
      );

      final text = response.text;
      if (text == null) {
        _showError("No Response was found! Please try again.");
        _setLoading(false);
      } else {
        _setLoading(false);
        // Scroll to the bottom
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    } catch (e) {
      _showError(e.toString());
      _setLoading(false);
    } finally {
      _textController.clear();
      _focusNode.requestFocus();
      _setLoading(false);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          scrollable: true,
          content: SingleChildScrollView(child: Text(message)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
