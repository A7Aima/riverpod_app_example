class StateModel {
  final stateId;
  final stateName;
  final city;

  StateModel({
    this.stateId,
    this.stateName,
    this.city,
  });

  factory StateModel.fromJson(Map<String, dynamic> parseJson) {
    return StateModel(
      stateName: parseJson["stateName"],
      stateId: parseJson['stateId'],
    );
  }
}
