import 'package:http/http.dart' as http;


Future<http.Response> sendImage(String url, String filepath) async {
  var request = http.MultipartRequest('POST',Uri.parse(url))
    ..files.add(await http.MultipartFile.fromPath("file", filepath));
  request.headers.addAll({
    "content-type": "multipart/form-data",
  });
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  return response;
}