import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shamel_fibo/features/cart/data/model/cart_model.dart';
import 'package:shamel_fibo/features/cart/data/repo/cartRepo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  Cartrepo cartrepo;

  CartCubit(this.cartrepo) : super(CartInitial());
  getCart() async {
    emit(CartLoading());
    final result = await cartrepo.getCart();
    result.fold(
      (l) => emit(CartError(l.failuremessage)),
      (r) => emit(CartSuccess(r)),
    );
  }

  addtomyCart(int id, int quantity) async {
    emit(cartAdding());

      final result = await cartrepo.addProduct(id, quantity);
      return result.fold(
        (l) => emit(cartAddingFailure(l.failuremessage)),
        (r) => emit(cartAddingSuccess(r)),
      );
    }
}
