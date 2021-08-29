class Endpoints {
  Endpoints._();

  static const String baseUrl = "http://151.106.125.200:8888";

  static const String apiUrl = baseUrl + "/api";
//login: authentication

  static const String userLoginUrl = apiUrl + "/authenticate";
  static const String registerUrl = apiUrl + "/register";
  static const String adminUser = apiUrl + "/admin/users";
  static const String userInfo = apiUrl + "/account";
  static const String userChangePasswordUrl = apiUrl + "";
  static const String userGetVerifyCodeUrl = apiUrl + "";
  static const String userResetPasswordUrl = apiUrl + "";
  static const String requestRegisterUrl = apiUrl + "";
  static const String confirmRegisterUrl = "";
  static const String getProductInfo = apiUrl + "/products";
  static const String storeInfo = apiUrl + "/stores";
  static const String order = apiUrl + "/orders";
  static const String getProductType = apiUrl + "/product-types";
  static const String adminShipper = adminUser + "/shippers";
}
