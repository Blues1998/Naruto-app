import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        QuoteCard(
          icon: 'assets/images/itachi.png',
          title: 'Itachi Uchiha',
          subtitle: 'The True Shinobi',
        )
      ],
    );
  }
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    Key key,
    this.icon,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image(
        image: AssetImage(icon),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
