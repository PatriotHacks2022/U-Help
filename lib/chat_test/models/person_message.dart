import 'package:swipe_shop_flutter/chat_test/models/person_model.dart';
class Message {
  final User sender;
  final String
  time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=870&amp;q=80',
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'https://picsum.photos/seed/image003/500/800',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'https://picsum.photos/seed/image003/500/800',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'https://picsum.photos/seed/image003/500/800',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'https://picsum.photos/seed/image003/500/800',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'https://picsum.photos/seed/image003/500/800',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'https://picsum.photos/seed/image003/500/800',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? I\'m Hungry',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, whats up',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What is your location?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, Let\'s meet at the shelter?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, have you seen mom?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my dog. We picked up food, we miss you',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s father?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];