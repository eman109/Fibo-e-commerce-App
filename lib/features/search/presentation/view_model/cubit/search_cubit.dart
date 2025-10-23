import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shamel_fibo/features/Home/data/models/product_model.dart';
import 'package:shamel_fibo/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final queryStream =
      BehaviorSubject<
        String
      >();
  SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial()) {
    queryStream.debounceTime(Duration(milliseconds: 500)).listen(_callAPi);
  }

  void searchProduct(String q) {
    queryStream.add(q);
  }

  _callAPi(String query) async {
    emit(SearchLoading());
    final result = await searchRepo.searchproduct(query);
    result.fold(
      (l) => emit(SearchError(l.failuremessage)),
      (r) => emit(SearchSuccess(r.products)),
    );
  }
}
