class EndPoint {
  static String baseUrl = "https://expertsystem.pythonanywhere.com/";
  static String signIn = "signin";
  static String signUp = "signup";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKeys {
  static String status = "status";
  static String errorMessage = "message";
  static String email = "patient_email";
  static String password = "patient_password";
  static String token = "token";
  static String message = "message";
  static String name = "patient_name";
  static String phone = "patient_phone";
  static String location = "patient_city";
  static String gender = "patient_gender";
  static String age = "patient_age";
}
