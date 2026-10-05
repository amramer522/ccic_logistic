import 'package:ccic_g1_2026_flutter/views/categories/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import 'model.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  void getData() async {
    emit(CategoriesLoadingState());
    final resp = await DioHelper.getData('api/Categories');
    if (resp.isSuccess) {
      final details = CategoriesData.fromJson({'data': resp.data});
      emit(CategoriesSuccessState(list: details.list));
    } else {
      final errorMsg = resp.msg;
      emit(CategoriesFailedState(msg: errorMsg));
    }
  }
}
