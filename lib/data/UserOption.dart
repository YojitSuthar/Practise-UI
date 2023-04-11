import '../resources/assets_manager.dart';
import '../screens/reuse_widget/box_widget.dart';

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
      "Navigation": "null"
    },
    {
      "label_1": "My Favorites",
      "iconAsset": IconsAssets.wishListLogo,
      "Navigation": "none"
    },
    {
      "label_1": "Shipping address",
      "iconAsset": IconsAssets.shippingLogo,
      "Navigation": "none"
    },
    {
      "label_1": "My Card",
      "iconAsset": IconsAssets.cardLogo,
      "Navigation": "none"
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

  static final List<Map<String,dynamic>> userAccountOptions_3 = [
    {
      "label_1": "FAQs",
      "iconAsset":  DesignLabel(
        sizeBoxWidth: 200,
        label_1: "Help Center",
        iconAsset: IconsAssets.helpCenterLogo,
      ),
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
