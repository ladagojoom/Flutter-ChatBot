import 'package:flutter/material.dart';
import 'message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
    Message(text: "Hi", isUser: true),
    Message(text: "Hello, What's up?", isUser: false),
    Message(text: "Great and you?", isUser: true),
    Message(text: "I'm excellent", isUser: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

            //ONLY ONE ERROR: Shadow of the Box
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,

        // FIXED: Keep only the left-side Row (logo + text) inside title
        title: Row(
          children: [
            Image.asset(
              'assets/gpt-robot.png',
              height: 50, // added height to avoid large image overflow
            ),
            const SizedBox(width: 10),
            Text(
              'Gemini Gpt',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
                    
        // FIXED: Move the right-side volume icon to AppBar actions (prevents overflow)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/volume-high.png',
              color: Colors.blue[800],
              height: 30,
            ),
          ),
        ],
      ),



      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            message.isUser ? Theme.of(context).colorScheme.primary :
                                              Theme.of(context).colorScheme.secondary ,
                        borderRadius: message.isUser
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                            : const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                      ),
                      child: Text(
                        message.text,
                        style: message.isUser ? Theme.of(context).textTheme.bodyMedium :
                        Theme.of(context).textTheme.bodySmall
                            
                         
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          



          // Input field
          Padding(
            padding: const EdgeInsets.only(
                bottom: 32, top: 16.0, left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Type a message",
                        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: Image.asset(
                        'assets/send.png'),
                        onTap: (){},
                    ),
                  )
                      
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
