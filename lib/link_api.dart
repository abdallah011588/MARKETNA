
class AppLink
{
  static const String server= "http://192.168.247.5/ecommerce";
  static const String image = "http://192.168.247.5/ecommerce/upload";

  /// AUTH
  static const String test= "$server/test.php";
  static const String signup= "$server/auth/signup.php";
  static const String verifyCodeSignup= "$server/auth/verifycode.php";
  static const String login= "$server/auth/login.php";

  /// Forget Password
  static const String checkEmail= "$server/forgetPassword/checkEmail.php";
  static const String verifyCodeForgetPassword= "$server/forgetPassword/verifycode.php";
  static const String resetPassword= "$server/forgetPassword/resetPassword.php";

  /// Home
  static const String homePage= "$server/home.php";

  static const String viewFavoriteProduct= "$server/products/getOneProduct.php";

  static const String categoryImage= "$image/categories";
  static const String productImage= "$image/products";

  static const String products= "$server/products/products.php";

  /// Favorite

  static const String addFavorite= "$server/favorite/addFavorite.php";
  static const String removeFavorite= "$server/favorite/removeFavorite.php";
  static const String favoriteView= "$server/favorite/view.php";
  static const String deleteFavorite= "$server/favorite/deleteFavorite.php";

  /// CART

  static const String addCart= "$server/cart/addCart.php";
  static const String removeCart= "$server/cart/deleteCart.php";
  static const String cartView= "$server/cart/view.php";
  static const String deleteAllCount= "$server/cart/deleteAllCountCart.php";
  static const String getCount= "$server/cart/getCount.php";

  /// SEARCH

  static const String search= "$server/products/search.php";

  /// ADDRESS

  static const String addAddress= "$server/address/add.php";
  static const String deleteAddress= "$server/address/delete.php";
  static const String addressView= "$server/address/view.php";
  static const String addressEdit= "$server/address/edit.php";

  ///Coupon
  static const String coupon= "$server/coupon/checkCoupon.php";

  /// Orders
  static const String checkout= "$server/orders/checkout.php";
  static const String pending= "$server/orders/pending.php";
  static const String archived= "$server/orders/archived.php";
  static const String ordersDetails= "$server/orders/details.php";
  static const String deleteOrder= "$server/orders/delete.php";
  static const String rating= "$server/orders/rating.php";


  static const String offers= "$server/offers.php";


  static const String notification= "$server/notification.php";

}


