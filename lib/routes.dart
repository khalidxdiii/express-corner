import 'package:express_corner/Features/user/profile/presentation/views/profile_view.dart';
import 'package:express_corner/Features/user/profile/presentation/views/sittings_view.dart';
import 'package:get/get.dart';

import 'Features/auth/presentation/views/first_time_login/choose_type_user_view.dart';
import 'Features/auth/presentation/views/first_time_login/location_access_view.dart';
import 'Features/auth/presentation/views/first_time_login/work_as_delivery_info_view.dart';
import 'Features/auth/presentation/views/forgetpassword/forgertpasswordverifycode.dart';
import 'Features/auth/presentation/views/forgetpassword/forgetpassword.dart';
import 'Features/auth/presentation/views/forgetpassword/resetpassword.dart';
import 'Features/auth/presentation/views/forgetpassword/success_resetpassword.dart';
import 'Features/auth/presentation/views/login.dart';
import 'Features/auth/presentation/views/sign_up_secret_qustion.dart';
import 'Features/auth/presentation/views/signup.dart';
import 'Features/auth/presentation/views/signupverifycode.dart';
import 'Features/auth/presentation/views/success_signup.dart';
import 'Features/delivary/delivary_Layout/presentation/views/delivary_home_layout_view.dart';
import 'Features/delivary/delivary_home_page/presentaion/views/delivary_home_page_view.dart';
import 'Features/delivary/delivary_orders/presintaion/views/delivary_orders_details_view.dart';
import 'Features/delivary/delivary_orders/presintaion/views/delivary_orders_status_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/contact_us/delivary_contact_us_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/delivary_edit_profile_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/delivary_profile_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/delivary_sittings_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/delivary_wallet_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/delivary_who_are_we_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/delivary_work_info/delivary_edit_work_info_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/delivary_work_info/delivary_work_info_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/edit_email/delivary_edit_email_verify_code.dart';
import 'Features/delivary/delivary_profile/presentation/views/edit_email/delivary_edit_email_view.dart';
import 'Features/delivary/delivary_profile/presentation/views/edit_password/delivary_edit_password_view.dart';
import 'Features/delivary/delivary_rating/presentation/views/delivary_ratings_view.dart';
import 'Features/empthy status/presentation/views/empty_address_view.dart';
import 'Features/empthy status/presentation/views/notfication_empty_view.dart';
import 'Features/empthy status/presentation/views/saved_empty_view.dart';
import 'Features/language/presentation/views/language.dart';
import 'Features/onbording/presentation/views/onboarding_view.dart';
import 'Features/rating/user/presentation/views/user_rating_view.dart';
import 'Features/splash/presentation/views/splash_view.dart';
import 'Features/user/favorite/presentation/views/favorite_view.dart';
import 'Features/user/home Layout/presentation/views/home_layout_view.dart';
import 'Features/user/home page/presentation/views/show_all_places_view.dart';
import 'Features/user/notifications/presentation/views/notifications_view.dart';
import 'Features/user/orders/presintaion/views/add_order_view.dart';
import 'Features/user/orders/presintaion/views/orders_details_view.dart';
import 'Features/user/orders/presintaion/views/orders_status_view.dart';
import 'Features/rating/user/presentation/views/user_orders_success_deliverd_view.dart';
import 'Features/user/profile/presentation/views/address/add_map.dart';

import 'Features/user/profile/presentation/views/edit_email/edit_email_verify_code.dart';
import 'Features/user/profile/presentation/views/edit_email/edit_email_view.dart';
import 'Features/user/profile/presentation/views/edit_password/edit_password_view.dart';
import 'Features/user/profile/presentation/views/qna/qna_view.dart';
import 'Features/user/profile/presentation/views/report/add_report_view.dart';
import 'Features/user/profile/presentation/views/address/add_address_view.dart';
import 'Features/user/profile/presentation/views/address/address_view.dart';
import 'Features/user/profile/presentation/views/contact_us/contact_us_view.dart';
import 'Features/user/profile/presentation/views/edit_profile_view.dart';
import 'Features/user/profile/presentation/views/payment_method_view.dart';
import 'Features/user/profile/presentation/views/who_are_we_view.dart';
import 'core/constant/approutes.dart';
import 'core/middleware/mymiddelware.dart';
import 'core/shared/custom_open_image.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const Language(),
  ),
  // GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(
      name: "/", page: () => const SplashView(), middlewares: [MyMiddleWare()]),
  // splash screen
  GetPage(name: AppRoute.splash, page: () => const SplashView()),
  GetPage(name: AppRoute.openImage, page: () => const CustomDefultOpenImage()),

  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoardingView()),

  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.forgetPasswordVerfiyCode,
      page: () => const ForgetPasswordVerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.signUpVerifyCode, page: () => const SignUpVerifyCode()),
  GetPage(
      name: AppRoute.signUpSecretQuestion,
      page: () => const SignUpSecretQuestion()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),

  //empty status
  GetPage(
      name: AppRoute.notificationsEmpty,
      page: () => const NotificationEmptyView()),
  GetPage(name: AppRoute.savedEmpty, page: () => const SavedEmptyView()),
  GetPage(name: AppRoute.emptyAddress, page: () => const EmptyAddressView()),

  //first login
  GetPage(
      name: AppRoute.chooseUserType, page: () => const ChooseUserTypeView()),
  GetPage(
      name: AppRoute.locationAccess, page: () => const LocationAccessView()),
  GetPage(
      name: AppRoute.workAsDelivary,
      page: () => const WorkAsDelivaryInfoView()),

  /////// user ///////
  // home
  GetPage(name: AppRoute.homeLayoutView, page: () => const HomeLayoutView()),
  GetPage(name: AppRoute.pharmaciesView, page: () => const ShowAllPlacesView()),
  // profile
  GetPage(name: AppRoute.profile, page: () => const ProfileView()),
  GetPage(name: AppRoute.sittings, page: () => const SittingsView()),
  GetPage(name: AppRoute.contactUs, page: () => const ContactUsView()),
  GetPage(name: AppRoute.whoAreWe, page: () => const WhoAreWeView()),
  GetPage(name: AppRoute.editProfile, page: () => const EditProfileView()),
  GetPage(name: AppRoute.profileEditEmail, page: () => const EditEmailView()),
  GetPage(
      name: AppRoute.profileEditEmailVerifyCode,
      page: () => const EditEmailVerifyCode()),
  GetPage(
      name: AppRoute.profileEditPasswordView,
      page: () => const EditPasswordView()),

  //address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAddMap, page: () => const AddressAddMapView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddAddressView()),
  // payment Method
  GetPage(name: AppRoute.paymentMethod, page: () => const PaymentMethodView()),
  //add report view
  GetPage(name: AppRoute.addReport, page: () => const AddReportView()),
  GetPage(name: AppRoute.qna, page: () => const QnAView()),

  //orders
  GetPage(name: AppRoute.addOrder, page: () => const AddOrderView()),
  GetPage(
      name: AppRoute.ordersDetailsView, page: () => const OrdersDetailsView()),
  GetPage(name: AppRoute.ordersStatus, page: () => const OrdersStatusView()),

// rating
  GetPage(
      name: AppRoute.successDeliverdOrderView,
      page: () => const UserSuccessDeliverdOrderView()),
  GetPage(name: AppRoute.userRatingView, page: () => const UserRatingView()),

  // notifications
  GetPage(
      name: AppRoute.notificationsView, page: () => const NotificationsView()),

  // favorite
  GetPage(name: AppRoute.favoriteView, page: () => const FavoriteView()),

  ///////////////////////////// delivary ///////////////////////////////////
  // home
  GetPage(
      name: AppRoute.delivaryHomeLayoutView,
      page: () => const DelivaryHomeLayoutView()),

  GetPage(
      name: AppRoute.delivaryHomeView,
      page: () => const DelivaryHomePageView()),
  // profile
  GetPage(
      name: AppRoute.delivaryProfile, page: () => const DelivaryProfileView()),
  GetPage(
      name: AppRoute.delivaryWallet, page: () => const DelivaryWalletView()),
  GetPage(
      name: AppRoute.delivarySittings,
      page: () => const DelivarySittingsView()),
  GetPage(
      name: AppRoute.delivaryContactUs,
      page: () => const DelivaryContactUsView()),
  GetPage(
      name: AppRoute.delivaryWhoAreWe,
      page: () => const DelivaryWhoAreWeView()),
  GetPage(
      name: AppRoute.delivaryEditProfile,
      page: () => const DelivaryEditProfileView()),
  GetPage(
      name: AppRoute.delivaryProfileEditEmail,
      page: () => const DelivaryEditEmailView()),
  GetPage(
      name: AppRoute.delivaryProfileEditEmailVerifyCode,
      page: () => const DelivaryEditEmailVerifyCode()),
  GetPage(
      name: AppRoute.delivaryProfileEditPasswordView,
      page: () => const DelivaryEditPasswordView()),
  GetPage(
      name: AppRoute.delivaryWorkInfoView,
      page: () => const DelivaryWorkInfoView()),
  GetPage(
      name: AppRoute.delivaryEditWorkInfoView,
      page: () => const DelivaryEditWorkInfoView()),
// ratings
  GetPage(
      name: AppRoute.delivaryRatingsView,
      page: () => const DelivaryRatingsView()),

  // orders
  GetPage(
      name: AppRoute.delivaryOrdersDetailsView,
      page: () => const DelivaryOrdersDetailsView()),
  GetPage(
      name: AppRoute.delivaryOrdersStatusView,
      page: () => const DelivaryOrdersStatusView()),
];
