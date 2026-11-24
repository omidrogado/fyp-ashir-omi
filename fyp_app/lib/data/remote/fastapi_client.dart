class FastApiClient {
  final String baseUrl;
  FastApiClient({this.baseUrl = 'http://10.0.2.2:8000'});

  Future<String?> transcribeAudio(List<int> audioBytes) async {
    // Call FastAPI /api/v1/transcribe
    return null;
  }

  Future<List<String>> mapTextToSigns(String text) async {
    // Call FastAPI /api/v1/map-sign
    return [];
  }
}
