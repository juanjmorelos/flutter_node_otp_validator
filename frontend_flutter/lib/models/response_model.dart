class ResponseModel {
  final bool success;
  final String msg;
  final List<String>? emptyFields;

  const ResponseModel({
    this.success = false,
    this.msg = "",
    this.emptyFields,
  });

  // Constructor para crear una instancia de ResponseModel desde un mapa (JSON)
  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'],
      msg: json['msg'],
      emptyFields: json['emptyFields'] != null
          ? List<String>.from(json['emptyFields'])
          : null,
    );
  }

  // Método para convertir una instancia de ResponseModel a un mapa (JSON)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['msg'] = msg;
    data['emptyFields'] = emptyFields;
    return data;
  }

  // Método para copiar una instancia de ResponseModel con algunas propiedades actualizadas
  ResponseModel copyWith({
    bool? success,
    String? msg,
    List<String>? emptyFields,
  }) {
    return ResponseModel(
      success: success ?? this.success,
      msg: msg ?? this.msg,
      emptyFields: emptyFields ?? this.emptyFields,
    );
  }
}
