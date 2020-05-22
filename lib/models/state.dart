class StateResponse {
  String objectId;
  String nameMmUni;

  StateResponse(this.objectId, this.nameMmUni);

  StateResponse.fromJson(Map<String, dynamic> json)
      : objectId = json['objectId'],
        nameMmUni = json['nameMmUni'];

  static List<StateResponse> fromJsonToList(Map<String, dynamic> json) {
    final data = json['data'];
    final states = data['states'];
    final List<dynamic> stateData = states['data'];
    final List<StateResponse> result = [];
    for (var some in stateData) {
      final StateResponse state = StateResponse.fromJson(some);
      result.add(state);
    }

    return result;
  }
}
