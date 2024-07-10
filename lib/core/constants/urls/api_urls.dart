class ApiUrls {
  //! ======================= Auth Links ===================== !//

  // static const serverName = "http://192.168.1.117/shop";

  static const serverName = "https://husamabdallah.com/api/shop";
  static const signupUrl = "$serverName/auth/signup.php";
  static const signinUrl = "$serverName/auth/signin.php";
  static const verifyAccount = "$serverName/auth/verifyAccount.php";
  static const resendVerifyCode = "$serverName/auth/resendVerifyCode.php";
  static const forgetPassword = "$serverName/auth/forgetPassword.php";
  static const checkVerifyCode = "$serverName/auth/checkVerifyCode.php";
  static const setNewPassword = "$serverName/auth/setNewPassword.php";

  //! ======================= Home Links ===================== !//
  static const home = "$serverName/home/home.php";
  //! ======================= products Links ===================== !//
  static const products = "$serverName/products/productsView.php";
  static const addToFavorites = "$serverName/favorites/addToFavorites.php";
  static const deleteFromFavorites =
      "$serverName/favorites/delFromFavorites.php";
  static const favorites = "$serverName/favorites/favorites.php";

  //! ======================= Cart Links ===================== !//
  static const deleteFromCart = "$serverName/cart/delFromCart.php";
  static const addToCart = "$serverName/cart/addToCart.php";
  static const quantityCounter = "$serverName/cart/inCartCounter.php";
  static const cartView = "$serverName/cart/cartView.php";

  //! ======================= Cart Links ===================== !//
  static const search = "$serverName/search/search.php";
  //! ======================= Address Links ===================== !//
  static const addressData = "$serverName/address/viewAddress.php";
}
