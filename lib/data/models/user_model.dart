class User {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;
  String? accessToken;
  String? refreshToken;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.accessToken,
    required this.refreshToken,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        role = json['role'],
        avatar = json['avatar'],
        id = json['id'],
        accessToken = json['accessToken'],
        refreshToken = json['refreshToken'];

  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'avatar': avatar,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  void setTokens(String accessToken, String refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }
}
