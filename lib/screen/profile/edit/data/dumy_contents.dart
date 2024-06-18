import 'contents_type.dart';

class DumyContents {
  bool isChecked;
  ContentsType type;
  String widgetName;
  String title;
  String content;
  List<String> tags;
  String date;

  DumyContents({
    required this.isChecked,
    required this.type,
    required this.widgetName,
    required this.title,
    required this.content,
    required this.tags,
    required this.date,
  });
}

List<DumyContents> contentsList = [
  DumyContents(
    isChecked: false,
    type: ContentsType(type: "Type", content: "assets/edit_image/default.png"),
    widgetName: "All Widgets",
    title: "Contents Title",
    content: "Contents",
    tags: ["여행", "홍콩", "쌈뽕"],
    date: "1997-02-11",
  ),
  DumyContents(
    isChecked: false,
    type: ContentsType(type: "img", content: "assets/edit_image/content1.png"),
    widgetName: "Travel Gallery Widget",
    title: "홍콩여행 쌈뽕하게 다녀온날",
    content: "홍콩 여행을 쌈뽕하게 다녀 왔는데 여기서 있던 나날이 너무도 행복했다. 여자친구는 못잊었다..그녀를..",
    tags: ["여행", "홍콩", "쌈뽕"],
    date: "2024-05-17",
  ),
  DumyContents(
    isChecked: false,
    type: ContentsType(type: "img", content: "assets/edit_image/content2.png"),
    widgetName: "Travel Gallery Widget",
    title: "홍콩에서 죽을 뻔 한 날",
    content: "쌈뽕하게 놀이기구 어마무시하게 타는데 ㄹㅇ 뼈도 못추스릴 뻔 했다. 무사히 한국으로 돌아왔나?안왔나?잘 모르겠담",
    tags: ["여행", "홍콩", "놀이기구"],
    date: "2024-05-15",
  ),
  DumyContents(
    isChecked: false,
    type: ContentsType(type: "img", content: "assets/edit_image/content1.png"),
    widgetName: "Diary",
    title: "여행을 앞둔 나",
    content: "세상 촌놈으로만 살아오던 내가 드디어 떳다떳다 비행기를 타 볼 기회가 생기었다 이는 샬라샬라 어쩌구저쩌구~~~~",
    tags: ["여행", "비행기", "추억"],
    date: "2024-05-12",
  ),
];
