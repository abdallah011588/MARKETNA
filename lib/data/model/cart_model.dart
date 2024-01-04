
class CartModel {
  double? countPrice;
  int? countProducts;
  int? cartId;
  int? cartUserId;
  int? cartProductId;
  int? productId;
  String? productName;
  String? productNameAr;
  String? productDescription;
  String? productDescriptionAr;
  String? productImage;
  int? productCount;
  int? productActive;
  int? productPrice;
  int? productDiscount;
  String? productDatetime;
  int? productCategory;

  CartModel(
      {this.countPrice,
        this.countProducts,
        this.cartId,
        this.cartUserId,
        this.cartProductId,
        this.productId,
        this.productName,
        this.productNameAr,
        this.productDescription,
        this.productDescriptionAr,
        this.productImage,
        this.productCount,
        this.productActive,
        this.productPrice,
        this.productDiscount,
        this.productDatetime,
        this.productCategory});

  CartModel.fromJson(Map<String, dynamic> json) {
    countPrice = double.parse(json['count_price'].toString());
    countProducts = json['count_products'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartProductId = json['cart_product_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDescription = json['product_description'];
    productDescriptionAr = json['product_description_ar'];
    productImage = json['product_image'];
    productCount = json['product_count'];
    productActive = json['product_active'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productDatetime = json['product_datetime'];
    productCategory = json['product_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_price'] = this.countPrice;
    data['count_products'] = this.countProducts;
    data['cart_id'] = this.cartId;
    data['cart_user_id'] = this.cartUserId;
    data['cart_product_id'] = this.cartProductId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_description'] = this.productDescription;
    data['product_description_ar'] = this.productDescriptionAr;
    data['product_image'] = this.productImage;
    data['product_count'] = this.productCount;
    data['product_active'] = this.productActive;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_datetime'] = this.productDatetime;
    data['product_category'] = this.productCategory;
    return data;
  }
}