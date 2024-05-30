class AppLink {
  // static const String server =
  //     'https://megastoreapp.000webhostapp.com/express-corner';
  // static const String server = 'http://express-corner.atwebpages.com';
  static const String server = "https://express-corner.com";
  static const String test = "$server/test.php";
  static const String imageSatatic = '$server/upload';

  // images
  static const String imageCategories = '$imageSatatic/categories';
  static const String imageUser = '$imageSatatic/users';
  static const String imageOrder = '$imageSatatic/ordersImages';
  static const String imageDelivaryVicheles = '$imageSatatic/delivary/vicheles';
  static const String imageDelivaryIds = '$imageSatatic/delivary/ids';
  static const String iamgeDelivaryDrivingLicense =
      '$imageSatatic/delivary/driving_License';

  // auth
  static const String login = "$server/auth/login.php";
  static const String firstLoginUser = "$server/auth/user_first_login.php";
  static const String firstLoginDelivary =
      "$server/auth/delivary_first_login.php";
  static const String signUp = "$server/auth/signup.php";
  static const String signUpVerifyCode = "$server/auth/verifycode.php";
  static const String resendVerifyCode = "$server/auth/resendcode.php";

  //forget password
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycodeforgetpassword.php";

  // govCity
  static const String govAdd = "$server/govCity/addGov.php";
  static const String govView = "$server/govCity/viewGov.php";
  static const String cityAdd = "$server/govCity/addCity.php";
  static const String cityView = "$server/govCity/viewCity.php";
  static const String genderView = "$server/govCity/genderView.php";

  // profile
  static const String profileView = "$server/profile/view.php";
  static const String profileEdit = "$server/profile/edit.php";
  static const String profileEditEmail = "$server/profile/edit_email.php";
  static const String profileVerifyCodeAndEditEmail =
      "$server/profile/verify_code_and_edit_email.php";
  static const String profileEditEmailReSendCode =
      "$server/profile/edit_email_resend_code.php";

  static const String profileEditPassword = "$server/profile/edit_password.php";
  static const String reportAdd = "$server/reports/user/add_report.php";
  static const String reportView = "$server/reports/view.php";

  //home
  static const String homepage = "$server/home.php";
  //items
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  // product Details
  static const String itemsDetails = "$server/items/items.php";

  // favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromMyFavorite =
      "$server/favorite/deletefrommyfevorite.php";

  // cart
  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";

  // address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // coupon
  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  // orders
  static const String ordersAdd = "$server/orders/add.php";
  static const String ordersView = "$server/orders/view.php";
  static const String ordersPinding = "$server/orders/pending.php";
  static const String ordersCurrent = "$server/orders/current.php";
  static const String ordersDelivaryData = "$server/orders/delivary_data.php";
  static const String ordersArchive = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";
  static const String ordersStatus = "$server/orders/orders_status.php";
  static const String ordersGetDelivaryLiveLocation =
      "$server/orders/get_delivary_livelocation.php";
  static const String ordersDelivaryLiveLocation =
      "$server/delivery/orders/update_delivary_liveLocation.php";

  //home
  static const String homeview = "$server/home.php";

  //categories
  static const String categoriesAdd = "$server/categories/add.php";
  static const String categoriesDelete = "$server/categories/delete.php";
  static const String categoriesEdit = "$server/categories/edit.php";
  static const String categoriesView = "$server/categories/view.php";

  // notification
  static const String notification = "$server/notifications/notification.php";
  static const String notificationRead =
      "$server/notifications/notificationRead.php";

  // Offers
  static const String offers = "$server/offers.php";

  // rating
  static const String ratingAdd = "$server/rating/add.php";

  // setting // users
  static const String settings = "$server/users.php";

  ///////////////////////// delivary ///////////////////////
  /// home
  static const String delivaryGetInfo =
      "$server/delivery/delivary_info/get_delivary_data.php";

  /// orders
  static const String delivaryOrdersApprove =
      "$server/delivery/orders/approve.php";
  static const String delivaryOrdersPindingView =
      "$server/delivery/orders/pending_view.php";
  static const String delivaryOrdersAcceptedView =
      "$server/delivery/orders/accepted_view.php";
  static const String delivaryOrdersArchiveView =
      "$server/delivery/orders/archive_view.php";
  static const String delivaryOrdersStatus =
      "$server/delivery/orders/delivary_orders_status.php";
  static const String delivaryOrderFirstDestination =
      "$server/delivery/orders/first_destination.php";
  static const String delivaryOrderOnTheWay =
      "$server/delivery/orders/on_the_way.php";
  static const String delivaryOrderDone = "$server/delivery/orders/done.php";
  static const String delivaryAccepted =
      "$server/delivery/orders/delivary_accepted_orders_view.php";
  static const String delivaryRejectOrder =
      "$server/delivery/orders/reject_order.php";
  static const String delivaryGetAllRejectOrderView =
      "$server/delivery/orders/get_all_reject_orders_view.php";

// profile
  static const String delivaryProfileView = "$server/delivery/profile/view.php";
  static const String delivaryProfileEdit =
      "$server/delivery/profile/edit_profile.php";
  static const String delivaryProfileEditEmail =
      "$server/delivery/profile/edit_email.php";
  static const String delivaryProfileVerifyCodeAndEditEmail =
      "$server/delivery/profile/verify_code_and_edit_email.php";
  static const String delivaryProfileEditEmailReSendCode =
      "$server/delivery/profile/edit_email_resend_code.php";

  static const String delivaryProfileEditPassword =
      "$server/delivery/profile/edit_password.php";
  static const String delivaryGetAllExpertiesData =
      "$server/delivery/delivary_profile_work_info/get_all_delivary_expertise_data.php";
  static const String delivaryGetAllTypeVehicleData =
      "$server/delivery/delivary_profile_work_info/get_all_delivary_type_vehicle.php";
  static const String delivaryEditProfileWorkInfoData =
      "$server/delivery/delivary_profile_work_info/edit_profile_work_info.php";
  static const String delivaryGetDelivaryWorkProfileData =
      "$server/delivery/delivary_profile_work_info/get_delivary_work_info_profile.php";
  static const String delivaryReportAdd = "$server/reports/user/add_report.php";
  static const String delivaryReportView = "$server/reports/view.php";

  // Sitting
  static const String delivaryGetDelivaryStatusType =
      "$server/delivery/delivary_status/get_delivary_status.php";
  static const String delivaryChangeDelivaryStatusType =
      "$server/delivery/delivary_status/modify_status.php";

  // rating
  static const String delivaryGetAllRatings =
      "$server/delivery/delivary_ratings/get_all_ratings.php";
}
