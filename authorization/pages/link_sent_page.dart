import 'package:flutter/material.dart';
import 'package:ntv3_cluster/design/widgets/texts.dart';

class LinkSentPage extends StatelessWidget {
  const LinkSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomTitleText(text: 'Ссылка отправленна', size: 30),
            ],
          ),
        ),
      ),
    );
  }
}