import 'package:ccic_g1_2026_flutter/views/categories/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getData(),
      child: Builder(
        builder: (ctx) {
          final cubit = BlocProvider.of<CategoriesCubit>(ctx);
          return Scaffold(
            body: Center(
              child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is CategoriesLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is CategoriesSuccessState) {
                    return ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(state.list[index].iconUrl),
                        ),
                        title: Text(
                          state.list[index].nameAr,
                          style: TextStyle(fontSize: 30),
                        ),
                        subtitle: Text(
                          state.list[index].nameEn,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      itemCount: state.list.length,
                    );
                  } else if (state is CategoriesFailedState) {
                    return Text(state.msg);
                  }
                  return Text("Please call the method");
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
