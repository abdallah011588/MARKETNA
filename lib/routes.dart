import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/middleware/middleware.dart';
import 'package:e_commerce_app/view/address/add.dart';
import 'package:e_commerce_app/view/address/details.dart';
import 'package:e_commerce_app/view/address/edit.dart';
import 'package:e_commerce_app/view/address/edit_details.dart';
import 'package:e_commerce_app/view/address/view.dart';
import 'package:e_commerce_app/view/address/view_latlng.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/forget_password.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/verify_code.dart';
import 'package:e_commerce_app/view/screen/auth/login.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/reset_password.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/reset_password_success.dart';
import 'package:e_commerce_app/view/screen/auth/login_success.dart';
import 'package:e_commerce_app/view/screen/auth/signup.dart';
import 'package:e_commerce_app/view/screen/auth/signup_success.dart';
import 'package:e_commerce_app/view/screen/auth/verify_code_signup.dart';
import 'package:e_commerce_app/view/screen/cart.dart';
import 'package:e_commerce_app/view/screen/cart_screen.dart';
import 'package:e_commerce_app/view/screen/checkout.dart';
import 'package:e_commerce_app/view/screen/favorites.dart';
import 'package:e_commerce_app/view/screen/language.dart';
import 'package:e_commerce_app/view/screen/main_home_page.dart';
import 'package:e_commerce_app/view/screen/notifications.dart';
import 'package:e_commerce_app/view/screen/offers_screen.dart';
import 'package:e_commerce_app/view/screen/onboarding.dart';
import 'package:e_commerce_app/view/screen/orders/details.dart';
import 'package:e_commerce_app/view/screen/orders/orders.dart';
import 'package:e_commerce_app/view/screen/orders/tracking.dart';
import 'package:e_commerce_app/view/screen/product_details.dart';
import 'package:e_commerce_app/view/screen/products.dart';
import 'package:e_commerce_app/view/screen/search_screen.dart';
import 'package:e_commerce_app/view/screen/splash.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.splash, page: () => const Splash(),),
  GetPage(name: AppRoutes.onboarding, page: () => OnBoarding(),),
  GetPage(
    name: AppRoutes.language,
    page: () => const Language(),
    middlewares: [
      MyMiddleWare(),
    ],
  ),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.resetPasswordSuccess, page: () => const ResetPasswordSuccess()),
  GetPage(name: AppRoutes.loginSuccess, page: () => const LoginSuccess()),
  GetPage(name: AppRoutes.signupSuccess, page: () => const SignUpSuccess()),
  GetPage(name: AppRoutes.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoutes.homePage, page: () => const MainHomePage()),
  GetPage(name: AppRoutes.products, page: () => const Products()),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoutes.favorites, page: () => const Favorites()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  GetPage(name: AppRoutes.cartScreen, page: () =>  const CartScreen()),
  GetPage(name: AppRoutes.addressView, page: () =>  AddressView()),
  GetPage(name: AppRoutes.addressAdd, page: () =>  const AddAddress()),
  GetPage(name: AppRoutes.addressEdit, page: () =>  const EditAddress()),
  GetPage(name: AppRoutes.addressDetails, page: () =>  const AddressDetails()),
  GetPage(name: AppRoutes.addressEditDetails, page: () =>  const AddressEditDetails()),
  GetPage(name: AppRoutes.addressViewLatLng, page: () =>  AddressViewLatLng()),
  GetPage(name: AppRoutes.checkout, page: () =>  const CheckOut()),
  GetPage(name: AppRoutes.orders, page: () =>  const Orders()),
  GetPage(name: AppRoutes.notifications, page: () =>  const Notifications()),
  GetPage(name: AppRoutes.orderDetails, page: () =>  const OrderDetails()),
  GetPage(name: AppRoutes.offers, page: () =>  const Offers()),
  GetPage(name: AppRoutes.search, page: () =>  SearchScreen()),
  GetPage(name: AppRoutes.tracking, page: () =>  const TrackingScreen()),

];
