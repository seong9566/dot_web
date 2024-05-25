class ChatModel {
  String? avatar;
  final String name;
  final String lastMessage;
  final String time;
  final String unReadCount;

  ChatModel({
    this.avatar,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unReadCount,
  });
}

List<ChatModel> chatList = [
  ChatModel(
      name: 'User 1',
      lastMessage: 'Last message from User 1',
      time: '12:10 PM',
      unReadCount: '1'),
  ChatModel(
      name: 'User 2',
      lastMessage: 'Last message from User 2',
      time: '12:20 PM',
      unReadCount: '2'),
  ChatModel(
      name: 'User 3',
      lastMessage: 'Last message from User 3',
      time: '12:30 PM',
      unReadCount: '3'),
  ChatModel(
      name: 'User 4',
      lastMessage: 'Last message from User 4',
      time: '12:40 PM',
      unReadCount: '4'),
  ChatModel(
      name: 'User 5',
      lastMessage: 'Last message from User 5',
      time: '12:50 PM',
      unReadCount: '5'),
  ChatModel(
      name: 'User 6',
      lastMessage: 'Last message from User 6',
      time: '1:00 PM',
      unReadCount: '6'),
  ChatModel(
      name: 'User 7',
      lastMessage: 'Last message from User 7',
      time: '1:10 PM',
      unReadCount: '7'),
  ChatModel(
      name: 'User 8',
      lastMessage: 'Last message from User 8',
      time: '1:20 PM',
      unReadCount: '8'),
  ChatModel(
      name: 'User 9',
      lastMessage: 'Last message from User 9',
      time: '1:30 PM',
      unReadCount: '9'),
  ChatModel(
      name: 'User 10',
      lastMessage: 'Last message from User 10',
      time: '1:40 PM',
      unReadCount: '10'),
];
