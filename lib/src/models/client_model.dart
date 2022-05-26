class Client {
  final String clientName;
  final String clientNumber;
  final String lastCalledDate;
  final String callType;
  final String? clintAvatar;
  final String? audio;
  bool? isSelected;

  Client({
    this.clientName = 'Неизвестный',
    required this.clientNumber,
    required this.lastCalledDate,
    required this.callType,
    this.clintAvatar = 'assets/images/avatar.jpeg',
    this.audio = 'assets/audios/1.mp3',
    this.isSelected = false,
  });
}
