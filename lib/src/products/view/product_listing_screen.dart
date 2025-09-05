import 'package:flutter/material.dart';
import 'package:mvvm_clean_provider/src/products/view_model/product_listing_view_model.dart';
import '../../../services/dipendancy_injection/get_it.dart';
import '../repo/product_repo.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  late ProductListingViewModel viewModel;
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    viewModel = ProductListingViewModel(productRepo: getIt<ProductRepo>());
    viewModel.getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Product Listing'),
      ),
      body: const Center(child: Text('Product Listing Screen')),
    );
  }
}
