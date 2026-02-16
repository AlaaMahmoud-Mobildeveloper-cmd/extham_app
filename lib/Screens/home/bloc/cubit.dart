import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:extham_app/Screens/home/bloc/state.dart';
import 'package:extham_app/model/model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Dio dio = Dio(
  );
  List<Product> products = [];
  Future<void> getHomeData() async {
    emit(LoadingState());

    try {
      Response response =
      await dio.get('https://www.jsonkeeper.com/b/QXODW');
      print("Response Data: ${response.data}");
      ProductResponse productResponse =
      ProductResponse.fromJson(response.data);

      products = productResponse.products ?? [];
      print(products.length);
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }


}