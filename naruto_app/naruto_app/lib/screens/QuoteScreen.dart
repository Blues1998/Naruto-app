import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuoteScreen extends StatefulWidget {
  final Color primaryColor;
  final Color containerColor;

  const QuoteScreen({
    Key? key,
    required this.primaryColor,
    required this.containerColor,
  }) : super(key: key);

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<CharacterQuote> characterQuotes = [
    CharacterQuote(
      character: 'Minato Namikaze (Fourth Hokage, Yellow Flash)',
      imagePath: 'assets/images/minato.jpg',
      quotes: [
        "When a man learns to love, he must bear the risk of hatred.",
        "I will stop the masked man's Moon's Eye Plan! And I will protect the shinobi world!",
        "I'm going to tell you something about me that you don't know... I love you, Kushina.",
      ],
    ),
    // Add more character quotes as needed
  ];

  List<CharacterQuote> filteredQuotes = [];

  @override
  void initState() {
    super.initState();
    filteredQuotes = characterQuotes;
  }

  void searchCharacters(String query) {
    setState(() {
      filteredQuotes = characterQuotes.where((quote) {
        final characterLower = quote.character.toLowerCase();
        final queryLower = query.toLowerCase();
        return characterLower.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.containerColor, // Use the provided container color
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchCharacters,
              decoration: const InputDecoration(
                labelText: 'Search Characters',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredQuotes.length,
              itemBuilder: (context, index) {
                return QuoteCard(characterQuote: filteredQuotes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuoteCard extends StatefulWidget {
  final CharacterQuote characterQuote;

  const QuoteCard({
    Key? key,
    required this.characterQuote,
  }) : super(key: key);

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  bool isExpanded = false;

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.characterQuote.imagePath),
      ),
      title: Text(widget.characterQuote.character),
      trailing: IconButton(
        icon: const Icon(Icons.content_copy),
        onPressed: () {
          _copyToClipboard(context, widget.characterQuote.character);
        },
      ),
      onExpansionChanged: (expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      children: isExpanded
          ? [
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.characterQuote.quotes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.characterQuote.quotes[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.content_copy),
                      onPressed: () {
                        _copyToClipboard(
                          context,
                          widget.characterQuote.quotes[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ]
          : [],
    );
  }
}

class CharacterQuote {
  final String character;
  final String imagePath;
  final List<String> quotes;

  CharacterQuote({
    required this.character,
    required this.imagePath,
    required this.quotes,
  });
}
