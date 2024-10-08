import 'package:flutter/material.dart';
import '../widgets/story.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Instagram Clone',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Story(),
          PostWidget(
            username: 'Sarah Jones',
            timeAgo: '30min ago',
            caption:
                'Summer is almost finish, looking forward to next summer and meet new people again.',
            imageUrls: [
              'https://picsum.photos/500/300?random=1',
              'https://picsum.photos/200/300?random=2',
              'https://picsum.photos/200/300?random=3',
            ],
            likes: 2066,
            comments: 648,
          ),
          PostWidget(
            username: 'Emma Rodrigues',
            timeAgo: '2h ago',
            caption:
                'I am really looking for a time in the future where People and Nature Thrive.',
            imageUrls: ['https://picsum.photos/500/300?random=4'],
            likes: 1234,
            comments: 567,
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String caption;
  final List<String> imageUrls;
  final int likes;
  final int comments;

  const PostWidget({
    Key? key,
    required this.username,
    required this.timeAgo,
    required this.caption,
    required this.imageUrls,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://picsum.photos/50/50?random=${username.hashCode}')),
          title: Text(username,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(timeAgo),
          trailing: const Icon(Icons.more_horiz),
        ),
        if (imageUrls.length == 1)
          Image.network(imageUrls[0], fit: BoxFit.cover)
        else
          SizedBox(
            height: 300,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Image.network(imageUrls[0], fit: BoxFit.cover)),
                const SizedBox(width: 2),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child:
                              Image.network(imageUrls[1], fit: BoxFit.cover)),
                      const SizedBox(height: 2),
                      Expanded(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(imageUrls[2], fit: BoxFit.cover),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              child: const Center(
                                child: Text(
                                  '5+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.chat_bubble_outline),
                      onPressed: () {}),
                  IconButton(icon: const Icon(Icons.send), onPressed: () {}),
                ],
              ),
              IconButton(
                  icon: const Icon(Icons.bookmark_border), onPressed: () {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$likes likes',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: username,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' '),
                    TextSpan(text: caption),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text('View all $comments comments',
                  style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
