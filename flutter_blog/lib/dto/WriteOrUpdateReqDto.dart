class WriteOrUpdateReqDto {
  final String? title;
  final String? content;

  WriteOrUpdateReqDto(this.title, this.content);

  Map<String, dynamic> toJson() => {"title": title, "content": content};
}
