import 'package:either_dart/either.dart';
import 'package:get_it/get_it.dart';
import '../../../data/remote/network_base_services.dart';
import '../../../res/constants/app_constants.dart';
import '../model/product_model.dart';

abstract class ProductRepo {
  Future<Either<ResponseError, ProductsModel?>> getProducts();
}

class ProductRepoImpl implements ProductRepo {
  final dio = GetIt.instance<NetWorkBaseServices>();
  @override
  Future<Either<ResponseError, ProductsModel?>> getProducts() {
    return dio
        .safe(dio.getRequest(endPoint: AppConstants.products))
        .thenRight(dio.checkHttpStatus)
        .thenRight(dio.parseJson)
        .mapRight((right) => ProductsModel.fromJson(right));
  }
}
