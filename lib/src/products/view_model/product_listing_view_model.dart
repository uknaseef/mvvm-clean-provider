import 'package:either_dart/either.dart';
import 'package:mvvm_clean_provider/src/products/model/product_model.dart';
import 'package:mvvm_clean_provider/src/products/repo/product_repo.dart';
import 'package:mvvm_clean_provider/utils/helpers/auto_dispose_view_model.dart';
import '../../../res/enums/enums.dart';
import '../../../utils/helpers/common_functions.dart';

class ProductListingViewModel extends AutoDisposeViewModel
    with ProductListingViewModelHelpers {
  late final ProductRepo productRepo;
  ProductListingViewModel({required this.productRepo});

  List<Product>? productList;

  Future<bool> getProductList() async {
    updateProductListingLoaderState(LoaderState.loading);
    return await productRepo
        .getProducts()
        .fold(
          (left) {
            String? errorMessage;
            if (left.response != null) {
              if (left.response['message'] != null) {
                errorMessage = left.response['message'];
              } else {
                errorMessage = left.response;
              }
            }
            if (errorMessage != null) {
              showCustomToast(message: errorMessage, isSuccess: false);
            }
            LoaderState state = handleResponseError(left.key);
            updateProductListingLoaderState(state);
            return false;
          },
          (right) {
            if (right != null) {
              productList = right.products;
              updateProductListingLoaderState(LoaderState.loaded);
              return false;
            }
            updateProductListingLoaderState(LoaderState.error);
            return false;
          },
        )
        .catchError((e) {
          showCustomToast(message: e.toString(), isSuccess: false);
          updateProductListingLoaderState(LoaderState.error);
          return false;
        });
  }

  @override
  void updateProductListingLoaderState(LoaderState value) {
    productListingLoaderState = value;
    notifyListeners();
  }
}

mixin ProductListingViewModelHelpers {
  LoaderState productListingLoaderState = LoaderState.loading;
  updateProductListingLoaderState(LoaderState value);
}
