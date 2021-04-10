import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryViewPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(title: '''You are the one holding the key.''', backgroundColor: Colors.redAccent),
      StoryItem.pageImage(url: "https://images.unsplash.com/photo-1541233349642-6e425fe6190e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80", controller: controller),
      StoryItem.pageVideo("https://www.thisiscolossal.com/wp-content/uploads/2018/08/Isopoly_01.gif", controller: controller, imageFit: BoxFit.contain),
    ];

    return Material(
      child: StoryView(
          storyItems: storyItems,
          controller: controller,
          inline: false,
          repeat: true,
      )
    );
  }
}