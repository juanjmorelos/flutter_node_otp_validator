class VerifyModelProvider {
  bool success;
  String msg;
  bool isLoading;
  String email;
  String name;
  String token;

  VerifyModelProvider({
    this.success = false,
    this.msg = "",
    this.isLoading = false,
    this.email = "",
    this.name = "",
    this.token = ""
  });

  // Método para copiar una instancia de VerifyModelProvider con algunas propiedades actualizadas
  VerifyModelProvider copyWith({
    bool? success,
    String? msg,
    String? email,
    String? name,
    String? token,
    bool? isLoading
  }) {
    return VerifyModelProvider(
      success: success ?? this.success,
      msg: msg ?? this.msg,
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
      name: name ?? this.name,
      token: token ?? this.token
    );
  }
}
