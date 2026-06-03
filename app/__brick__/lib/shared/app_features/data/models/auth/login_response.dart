class LoginResponse {
  final String accessToken;
  final String? refreshToken;

  const LoginResponse({
    required this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    if (refreshToken != null) 'refresh_token': refreshToken,
  };
}
