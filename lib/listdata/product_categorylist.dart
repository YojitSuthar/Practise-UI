// This class Contain the list of category,sorted by and cloth Size(if you want to add new data you can easily add with out any writing more code)

import '../resources/resources.dart';

class ProductCategory {
  static final List category = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "furniture",
    "tops",
    "mens-shirts",
    "mens-shoes",
    "automotive",
    "mens-watches",
    "women's-watches",
    "women's-bags",
    "women's-jewellery",
    "sunglasses",
    "motorcycle",
    "lighting",
    "home-decoration",
    "women's-dresses",
    "women's-shoes",
  ];

  static final List sortBy = [
    "New Today",
    "Discount",
    "Popularity",
  ];

  static final List clothSize = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  static final List<String> images = [
    ProjectNetworkImage.randomImage1,
    ProjectNetworkImage.randomImage2,
    ProjectNetworkImage.randomImage3,
    ProjectNetworkImage.randomImage4,
    ProjectNetworkImage.randomImage5,
  ];

}