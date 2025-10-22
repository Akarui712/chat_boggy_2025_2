import 'package:chat_boggy/domain/entities/message.dart';
import 'package:chat_boggy/infrastructure/datasource/dto/yes_no_answer.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer
{
  final _dio = Dio(BaseOptions(baseUrl: 'http://yesno.wtf'));

  Future<Message> getAnswer() async
  {
    final response = await _dio.get('/api');
    print(response.data);
    final YesNoAnswer yesNoAnswer = YesNoAnswer.fromJson(response.data);
    return Message
    (
      text: yesNoAnswer.answer == 'Yes' ? 'Si' : 'No',
      imageUrl: yesNoAnswer.image,
      fromWho: FromWho.hers
    );
  }
}