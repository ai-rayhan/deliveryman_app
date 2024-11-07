class Urls{
  // static const String domain = "http://192.168.0.102:8000";
  static const String domain = "https://sbfashionhouse.com";
  static const String baseApiUrl = "$domain/api";
  static const String baseimageUrl = "$domain/storage/uploads/";
  //location
  static const String getIpInfo = "https://api.ipregistry.co/?key=tryout";

  // authentication
  static const String signUp = "$baseApiUrl/register";
  static const String signIn = "$baseApiUrl/login";
  static const String signUpPhone = "$baseApiUrl/signUpPhoneNumber";
  static const String logout = "$baseApiUrl/logout";

  //verification
  static const String verifyRegistrationPhoneOtp = "$baseApiUrl/otp-verify";
  static const String verifyPhoneOtpAndLogin = "$baseApiUrl/verifyOtp";
  static const String verifyOtp = "$baseApiUrl/verify-otp";


  // forgot password
  static const String sendOtp = "$baseApiUrl/forgotPassword";
  static const String resetPassword = "$baseApiUrl/resetPassword";
  // profile
  static const String profile = "$baseApiUrl/get-profile";
  static const String updateProfile = "$baseApiUrl/update-profile";
  static const String updateAddress = "$baseApiUrl/delivery-address";
  static const String wishList = "$baseApiUrl/get-wishlist";
  static  String addWishList(int productId) => "$baseApiUrl/add-to-wishlist/$productId";
  static  String removeWishList(int productId) => "$baseApiUrl/remove-to-wishlist/$productId";



  static const String updatePassword = "$baseApiUrl/update-password";
  static const String notifications = "$baseApiUrl/notifications";
  static const String notificationsRead = "$baseApiUrl/notifications-read";

  // product list endpoint
  static const String bestSellingProducts = "get-best-selling-products";
  static const String latestProducts = "get-latest-products";
  static const String popularProducts = "get-popular-products";

  static const String brandWiseProduct = "brand-wise-product";
  static const String categoryWiseProduct = "category-wise-product";

  // product details 
  static  String productDetails(int productId) => "$baseApiUrl/product-details/$productId";
  static  String relatedProduct(int productId,int page) => "$baseApiUrl/related-product/$productId?page=$page";

  //product review
  static const String reviewProduct = "$baseApiUrl/get-product-reviews";
  static const String addProductReview = "$baseApiUrl/add-product-review";

  static const String searchSuggestion = "$baseApiUrl/search-suggestions";
  // static  String searchProduct(int page) => "$baseApiUrl/product-search?page=$page";
  static  String filterProduct(int page) => "$baseApiUrl/product-search-and-filter?page=$page";

  // coupon
  static const String coupon = "$baseApiUrl/get-coupons";
  static const String couponDetails = "$baseApiUrl/coupon-details";

  //checkout
  static const String checkout = "$baseApiUrl/check-out";
  static const String payment = "$baseApiUrl/payment";
  static const String shippingMethods = "$baseApiUrl/shipping-methods";

  //order
  static const String runningOrders = "$baseApiUrl/running-orders";
  static const String orderHistory = "$baseApiUrl/order-history";
  static const String orderDetails = "$baseApiUrl/order-details";
  static const String cancelOrder = "$baseApiUrl/order-cancel";

  

  //  sliders
  static const String sliders = "$baseApiUrl/get-slider";

  static const String categories = "$baseApiUrl/get-category";
  static const String brands = "$baseApiUrl/get-brands";
  static const String products = "$baseApiUrl/products";

  //settings
  static const String privacyPolicy = "$baseApiUrl/privacy-policy";
  static const String termsAndConditions = "$baseApiUrl/terms-and-conditions";
  static const String aboutUs = "$baseApiUrl/about-us";
  static const String helpAndSupport = "$baseApiUrl/help-and-support";
  static const String shippingPolicy = "$baseApiUrl/shipping-policy";
  static const String cancellationPolicy = "$baseApiUrl/cancellation-policy";
  static const String refundPolicy = "$baseApiUrl/refund-policy";
  static const String contactUs = "$baseApiUrl/contact-us";
}
