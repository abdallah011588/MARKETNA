class FavoriteModel {
  int? favoriteId;
  int? favoriteUserId;
  int? favoriteProductId;
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
  int? userId;

  FavoriteModel(
      {this.favoriteId,
        this.favoriteUserId,
        this.favoriteProductId,
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
        this.productCategory,
        this.userId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserId = json['favorite_user_id'];
    favoriteProductId = json['favorite_product_id'];
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
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_user_id'] = this.favoriteUserId;
    data['favorite_product_id'] = this.favoriteProductId;
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
    data['user_id'] = this.userId;
    return data;
  }
}