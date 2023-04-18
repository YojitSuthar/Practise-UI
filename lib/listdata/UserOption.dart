import '../resources/assets_manager.dart';


class OptionButton {
  static final List userAccountOptions_1 = [
    {
      "label_1": "Personal details",
      "iconAsset": IconsAssets.userLogo,
      "Navigation": "/UserProfile"
    },
    {
      "label_1": "My order",
      "iconAsset": IconsAssets.shoppingBagLogo,
      "Navigation": "ProfileShoppingCart"
    },
    {
      "label_1": "My Favorites",
      "iconAsset": IconsAssets.wishListLogo,
      "Navigation": "/ProfileWishListScreen"
    },
    {
      "label_1": "Shipping address",
      "iconAsset": IconsAssets.shippingLogo,
      "Navigation": "none"
    },
    {
      "label_1": "Discount Offers",
      "iconAsset": IconsAssets.couponsFilledLogo,
      "Navigation": "/DiscountScreen"
    },
    {
      "label_1": "Setting",
      "iconAsset": IconsAssets.settingLogo,
      "Navigation": "none"
    },
  ];

  static final List userAccountOptions_2 = [
    {
      "label_1": "FAQs",
      "iconAsset": IconsAssets.faqsLogo,
      "Navigation": "none"
    },
    {
      "label_1": "Privacy Policy",
      "iconAsset": IconsAssets.privacyPolicyLogo,
      "Navigation": "none"
    },
    {
      "label_1": "Terms and Conditions",
      "iconAsset": IconsAssets.termsLogo,
      "Navigation": "none"
    },
    {
      "label_1": "About Us",
      "iconAsset": IconsAssets.aboutUsLogo,
      "Navigation": "none"
    },
  ];


}
