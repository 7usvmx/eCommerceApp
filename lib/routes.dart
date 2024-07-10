import 'package:get/get.dart';
import 'package:shop/core/constants/app_routes.dart';
import 'package:shop/view/screens/address/add_address.dart';
import 'package:shop/view/screens/address/address_screen.dart';
import 'package:shop/view/screens/auth/confirm_email_screen.dart';
import 'package:shop/view/screens/auth/forget/forget_password_screen.dart';
import 'package:shop/view/screens/auth/forget/reset_password_screen.dart';
import 'package:shop/view/screens/auth/forget/verify_reset_code_screen.dart';
import 'package:shop/view/screens/auth/signin_screen.dart';
import 'package:shop/view/screens/auth/signup_screen.dart';
import 'package:shop/view/screens/auth/forget/success_reset_password_screen.dart';
import 'package:shop/view/screens/auth/success_signed_up_screen.dart';
import 'package:shop/view/screens/cart/cart_screen.dart';
import 'package:shop/view/screens/favorites/favorites_screen.dart';
import 'package:shop/view/screens/home/main_home.dart';
import 'package:shop/view/screens/pages/change_lang_screen.dart';
import 'package:shop/view/screens/pages/no_internet_screen.dart';
import 'package:shop/view/screens/pages/onboarding.dart';
import 'package:shop/view/screens/product/product_details_screen.dart';
import 'package:shop/view/screens/product/products_screen.dart';
import 'core/middlewares/signin_middle_ware.dart';
import 'core/middlewares/starter_middle_ware.dart';

List<GetPage<dynamic>> routes = [
  //! Just for test
  // GetPage(name: "/", page: () => const ProductDetailsScreen()),

  //! Home Screen
  GetPage(name: AppRoutes.home, page: () => const MainHome()),
  //! Chose language screen
  GetPage(
      name: AppRoutes.languages,
      page: () => const ChangeLangScreen(),
      middlewares: [
        StarterMiddleWare(),
        SigninMiddleWare(),
      ]),
  //! Onboarding Screen
  GetPage(
    name: AppRoutes.onboarding,
    page: () => const OnboardingScreen(),
  ),
  //! Auth Screens
  // signin
  GetPage(name: AppRoutes.signin, page: () => const SigninScreen()),
  // signup
  GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
  // Confirm Email
  GetPage(name: AppRoutes.confirmEmail, page: () => const ConfirmEmailScreen()),
  // success signup
  GetPage(
    name: AppRoutes.successSignedUp,
    page: () => const SuccessSignedUp(),
  ),
  // forget password
  GetPage(
      name: AppRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
  // confirm code
  GetPage(
      name: AppRoutes.verifyResetCode,
      page: () => const VerifyResetCodeScreen()),
  // reset password
  GetPage(
      name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),
  // success reset password
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  //! Error screens
  GetPage(
    name: AppRoutes.noInternetConnection,
    page: () => const NoInternetScreen(),
  ),

  //! Product screen
  GetPage(
    name: AppRoutes.productDetails,
    page: () => const ProductDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.products,
    page: () => const ProductsScreen(),
  ),
  //! favorites screen
  GetPage(
    name: AppRoutes.favorites,
    page: () => const FavoritesScreen(),
  ),
  //! cart screen
  GetPage(
    name: AppRoutes.cart,
    page: () => const CartScreen(),
  ),
  //! address screen
  GetPage(
    name: AppRoutes.address,
    page: () => const AddressScreen(),
  ),
  GetPage(
    name: AppRoutes.addAddress,
    page: () => AddAddress(),
  ),
];
