import 'dart:convert';
import 'package:http/http.dart';
import 'location_page.dart';
import 'package:intl/intl.dart';

class ApiCarte {

  Future<void> makePostRequest() async {
    String username = '9a596bfe-ceb4-42e4-a64f-c03be692c8f8';
    String password = '318c4b8de827bb169c8c95169bf8228bf2892b30d3222417becaed1f195443dc5d6d3c3ed4337270f0907ed6c748fd13daef17a1f75b91d8ca1616bd38b371cdf854427757936e32cec5a92e7b2d652ded7684c761763d119c6f9cdb6b77050ee20208ad6ee9e914b83860c6417d4e71';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
    locationPage locationInstance = new locationPage();
    locationInstance.GetLST();
    final url = Uri.parse('https://api.astronomyapi.com/api/v2/studio/star-chart');

    double long = await locationInstance.GetLongitude();
    double lat = await locationInstance.GetLatitude();

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate); // 2016-01-25
    final headers = {"Content-type": "application/json"};
    //declination = observer's latitude et right ascension = local sidereal time
    final json = {
      "observer": {
        "latitude": lat,
        "longitude": long,
        "date": formattedDate
      },
      "view": {
        "type": "area",
        "parameters": {
          "position": {
            "equatorial": {
              "rightAscension": 10.1821,
              "declination": lat
            }
          },
          "zoom": 2 //optional
        }
      }
    };
    print(json);
    final response = await post(url, headers: <String, String>{'authorization': basicAuth}, body: JsonEncoder().convert(json));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  /*void CallApi() async {
    String username = '9a596bfe-ceb4-42e4-a64f-c03be692c8f8';
    String password = '318c4b8de827bb169c8c95169bf8228bf2892b30d3222417becaed1f195443dc5d6d3c3ed4337270f0907ed6c748fd13daef17a1f75b91d8ca1616bd38b371cdf854427757936e32cec5a92e7b2d652ded7684c761763d119c6f9cdb6b77050ee20208ad6ee9e914b83860c6417d4e71';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    Response r = await get(
        Uri.parse('https://api.astronomyapi.com/api/v2/studio/star-chart'),
        headers: <String, String>{'authorization': basicAuth});
    print(r.statusCode);
    print(r.body);
  }
   */
}
