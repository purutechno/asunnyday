import 'package:asunnyday/model/single_city_response.dart';

class MultiCityResponse {
  List<SingleCityResponse> multiCityResponse = [];

  MultiCityResponse(this.multiCityResponse);

  MultiCityResponse.fromJson(List<dynamic> json) {
    multiCityResponse = [];
    for (int a = 0; a < json.length; a++) {
      //Adding City Name, Administrative Area and County for precise selection
      multiCityResponse.add(SingleCityResponse(json[a]['Key'],
          "${json[a]['LocalizedName']}, ${json[a]['AdministrativeArea']['LocalizedName']}, ${json[a]['Country']['LocalizedName']}"));
    }
  }
}
