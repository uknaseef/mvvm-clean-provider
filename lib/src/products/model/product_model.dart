class ProductsModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsModel({this.products, this.total, this.skip, this.limit});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      products:
          (json['products'] as List<dynamic>?)
              ?.map((item) => Product.fromJson(item as Map<String, dynamic>))
              .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  double? discountPercentage;
  int? stock;
  String? brand;
  String? sku;
  int? weight;
  List<String>? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.stock,
    this.brand,
    this.sku,
    this.weight,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: double.tryParse(
        json['discountPercentage'].toString(),
      ),
      stock: json['stock'],
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      images:
          (json['images'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList(),
    );
  }
}
