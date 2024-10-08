import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _StoryItem(
              name: 'Your Story',
              imageUrl: 'https://picsum.photos/200?random=0',
              isYourStory: true),
          _StoryItem(
              name: 'Kate Mery',
              imageUrl: 'https://picsum.photos/200?random=1'),
          _StoryItem(
              name: 'Jordi Hall',
              imageUrl: 'https://picsum.photos/200?random=2'),
          _StoryItem(
              name: 'Amy Adam', imageUrl: 'https://picsum.photos/200?random=3'),
          _StoryItem(
              name: 'Jennie Love',
              imageUrl: 'https://picsum.photos/200?random=4'),
          _StoryItem(
              name: 'Jennie Love',
              imageUrl: 'https://picsum.photos/200?random=8'),
          _StoryItem(
              name: 'Jennie Love',
              imageUrl: 'https://picsum.photos/200?random=9'),
        ],
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isYourStory;

  const _StoryItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.isYourStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.purple,
                      Colors.orange,
                    ],
                  ),
                ),
              ),
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isYourStory)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 15),
                  ),
                ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            name,
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
