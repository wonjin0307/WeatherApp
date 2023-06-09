import 'package:http/http.dart'as http;
import 'dart:convert';

class Network{
  final String today2amUrl; //최저, 최고 기온
  final String shortTermWeatherUrl;  //단기예보
  final String currentWeatherUrl; //초단기 실황
  final String superShortWeatherUrl; //초단기 예보
  final String airConditionUrl; //대기오염 정보

  Network(this.today2amUrl, this.shortTermWeatherUrl, this.currentWeatherUrl, this.superShortWeatherUrl, this.airConditionUrl);

  // 날씨데이터를 구하는 메서드
  // URL:리소스를 리소스의 경로 기반으로 식별 URL = URI라고 봐도 무방하다 [리소스 : 데이터/자원]
  // fianl:값을 바로 선언하지않고 변수가 사용되었을때 최초 초기값을 1번 부여가능함
  // network() 안에 들어가있는 값을 url을 초기값으로 설정
  // getdata를 비동기식으로 선언후, await를 통해 http.get(데이터를 가져오는 메소드)에 Uri.parse()사용하여
  // 가져온 URL에대한 리소스에 접근할 수 있는 URI 생성을 하고, 해당 URI에서 http.get을 사용하여 데이터를 가져온걸 response에 할당. 
  // http.response는 그 용어 그대로 응답하는 용도. 즉 URI에서  데이터를 가져온거에 대한걸 응답변수? 에 할당.
  // 만약 상태코드의 응답 상태가 성공적이라면 ( 200이면 성공 )
  // 응답 데이터의 알짜배기들을 data에 할당후 jsonDecode()를 통해 디코딩 진행.
  // 성공적이지 않으면 상태코드의 응답 코드를 프린트한다.

  //최저,고 기온 
  Future <dynamic> getToday2amData() async{
    http.Response response = await http.get(
      Uri.parse(today2amUrl),
    );
    if (response.statusCode == 200){
    String data = response.body;
    return jsonDecode(data);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
   }
  }

  //단기예보
  Future <dynamic> shortTermWeatherData() async{
    http.Response response = await http.get(
      Uri.parse(shortTermWeatherUrl),
    );
    if (response.statusCode == 200){
    String data = response.body;
    return jsonDecode(data);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
   }
  }

  //초단기 실황
  Future <dynamic> currentWeatherData() async{
    http.Response response = await http.get(
      Uri.parse(currentWeatherUrl),
    );
    if (response.statusCode == 200){
    String data = response.body;
    return jsonDecode(data);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
   }
  }

  //초단기 예보
  Future <dynamic>  veryShortWeatherData() async{
    http.Response response = await http.get(
      Uri.parse(superShortWeatherUrl),
    );
    if (response.statusCode == 200){
    String data = response.body;
    return jsonDecode(data);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
   }
  }

  //에어코리아 
  Future <dynamic> airConditionData() async{
    http.Response response = await http.get(
      Uri.parse(airConditionUrl),
    );
    if (response.statusCode == 200){
    String data = response.body;
    return jsonDecode(data);
  } else {
    // ignore: avoid_print
    print(response.statusCode);
   }
  }
}