abstract class BaseApiService {

  final String baseUrl = "https://run.mocky.io/v3/8d353ba3-739f-4724-9ce3-6fdc8de3af20";

  Future<dynamic> getResponse(String url);

}