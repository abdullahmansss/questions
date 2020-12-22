class QuestionModel
{
  static Map question;

  QuestionModel(Map data)
  {
    question = data;
  }

  static String getCategory() => question['categories'][0]['name'];

  static String getDate() => question['date'];

  static String getTitle() => question['title_plain'];

  static String getContent() => question['content'];

  static String getAvatar() => question['author']['avatar'];

  static String getName() => question['author']['name'];

  static String getBadgeName() => question['author']['badge']['color'];

  static String getBadgeColor() => question['author']['badge']['name'];

  static bool isVerified() => question['author']['verified'];

  static bool isFavourite() => question['favorite'];
}