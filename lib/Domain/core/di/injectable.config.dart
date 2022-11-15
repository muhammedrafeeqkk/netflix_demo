// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../Application/downloads/downloads_bloc.dart' as _i10;
import '../../../Application/fastlaugh/fastlaugh_bloc.dart' as _i11;
import '../../../Application/home/home_bloc.dart' as _i12;
import '../../../Application/New&Hot/newandhot_bloc.dart' as _i7;
import '../../../Application/search/search_bloc.dart' as _i13;
import '../../../Infrastructure/downloads/downloads_repository.dart' as _i4;
import '../../../Infrastructure/New&Hot/new_and_hot_impl.dart' as _i6;
import '../../../Infrastructure/search/search_imp.dart' as _i9;
import '../../downloads/i_downloads_repo.dart' as _i3;
import '../../new_and_hot/new_and_hot_service.dart' as _i5;
import '../../search/search_service.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadsRepository());
  gh.lazySingleton<_i5.NewAndHotService>(() => _i6.NewAndHotImplimentation());
  gh.factory<_i7.NewandhotBloc>(
      () => _i7.NewandhotBloc(get<_i5.NewAndHotService>()));
  gh.lazySingleton<_i8.SearchService>(() => _i9.searchImpl());
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i3.IDownloadsRepo>()));
  gh.factory<_i11.FastlaughBloc>(
      () => _i11.FastlaughBloc(get<_i3.IDownloadsRepo>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(get<_i5.NewAndHotService>()));
  gh.factory<_i13.SearchBloc>(() => _i13.SearchBloc(
        get<_i3.IDownloadsRepo>(),
        get<_i8.SearchService>(),
      ));
  return get;
}
