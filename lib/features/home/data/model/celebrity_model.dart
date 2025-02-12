class CelebrityModel {
  final String name;
  final int netWorth;
  final String gender;
  final String nationality;
  final List<String> occupation;
  final double height;
  final String birthday;

  CelebrityModel({
    required this.name,
    required this.netWorth,
    required this.gender,
    required this.nationality,
    required this.occupation,
    required this.height,
    required this.birthday,
  });

  factory CelebrityModel.fromJson(Map<String, dynamic> json) {
    return CelebrityModel(
      name: json['name'],
      netWorth: json['net_worth'],
      gender: json['gender'],
      nationality: json['nationality'],
      occupation: List<String>.from(json['occupation']),
      height: json['height'],
      birthday: json['birthday'],
    );
  }
}