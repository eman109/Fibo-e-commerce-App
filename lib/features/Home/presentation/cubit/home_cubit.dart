import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shamel_fibo/features/Home/data/models/response_products_model.dart';
import 'package:shamel_fibo/features/Home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homerepo;
  HomeCubit(this.homerepo) : super(HomeInitial());
  getproduct() async {
    emit(HomeLoading());
    final result = await homerepo.getAllProducts();
    result.fold(
      (l) => emit(HomeError(l.failuremessage)),
      (r) => emit(HomeSuccess(r)),
    );
  }
}

