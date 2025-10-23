import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shamel_fibo/core/network/apiConsumer.dart';
import 'package:shamel_fibo/core/network/dioService.dart';
import 'package:shamel_fibo/features/Auth/data/repository/auth_repository.dart';
import 'package:shamel_fibo/features/Auth/data/repository/authrepo_implemen.dart';
import 'package:shamel_fibo/features/Auth/presentation/view_model/login_cubit/logincubit_cubit.dart';
import 'package:shamel_fibo/features/Auth/presentation/view_model/register_cubit/cubit/register_cubit.dart';
import 'package:shamel_fibo/features/Home/data/repo/home_repo.dart';
import 'package:shamel_fibo/features/Home/presentation/cubit/home_cubit.dart';
import 'package:shamel_fibo/features/cart/data/repo/cartRepo.dart';
import 'package:shamel_fibo/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:shamel_fibo/features/payments/data/repo/pay_repo.dart';
import 'package:shamel_fibo/features/payments/data/repo/payment_stripe.dart';
import 'package:shamel_fibo/features/search/data/repo/search_repo.dart';
import 'package:shamel_fibo/features/search/presentation/view_model/cubit/search_cubit.dart';

GetIt getit = GetIt.instance;

void setUpServiceLocator() {
  getit.registerSingleton<Dio>(Dio());
  getit.registerSingleton<Apiconsumer>(
    Dioservice(
      getit<Dio>(),
    ),
  ); 

  getit.registerLazySingleton<Authrepository>(
    () => AuthrepoImplemen(getit<Apiconsumer>()),
  );
  getit.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getit<Apiconsumer>()),
  );
  getit.registerFactory<LogincubitCubit>(
    () => LogincubitCubit(getit<Authrepository>()),
  );
  getit.registerFactory<RegisterCubit>(
    () => RegisterCubit(getit<Authrepository>()),
  );
  getit.registerLazySingleton<Cartrepo>(
    () => CartRepoImpl(getit<Apiconsumer>()),
  );
  getit.registerLazySingleton<PayRepo>(
    () => PaymentStripeImpl(getit<Apiconsumer>()),
  );
  getit.registerLazySingleton<SearchRepo>(
    () => SearchrepoImp(getit<Apiconsumer>()),
  );
  getit.registerFactory<HomeCubit>(() => HomeCubit(getit<HomeRepo>()));
  getit.registerFactory<CartCubit>(() => CartCubit(getit<Cartrepo>()));
  getit.registerFactory<SearchCubit>(() => SearchCubit(getit<SearchRepo>()));
}

