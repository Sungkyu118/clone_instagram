import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            List.generate(10, (index) => UserStory(userName: 'User $index')),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(30)),
          ),
          Text(userName)
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDatalist = [
  FeedData(userName: 'User 1', likeCount: 50, content: '오늘 점심은 맛있었다'),
  FeedData(userName: 'User 2', likeCount: 50, content: '오늘 아침은 맛있었다'),
  FeedData(userName: 'User 3', likeCount: 50, content: '오늘 저녁은 맛있었다'),
  FeedData(userName: 'User 4', likeCount: 50, content: '어제 점심은 맛있었다'),
  FeedData(userName: 'User 5', likeCount: 50, content: '어제 아침은 맛있었다'),
  FeedData(userName: 'User 6', likeCount: 50, content: '어제 저녁은 맛있었다'),
  FeedData(userName: 'User 7', likeCount: 50, content: '오늘 점심은 맛있었다'),
  FeedData(userName: 'User 8', likeCount: 50, content: '오늘 아침은 맛있었다'),
  FeedData(userName: 'User 9', likeCount: 50, content: '오늘 저녁은 맛있었다'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDatalist.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDatalist[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade300,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName)
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                IconButton(
                    onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
                IconButton(
                    onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: feedData.userName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: feedData.content),
              ],
              style: const TextStyle(color: Colors.black)
            ),
          ),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
