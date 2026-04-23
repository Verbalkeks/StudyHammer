import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/config/injection.dart';
import 'package:studyhammer/logic/category_cubit.dart';
import 'package:studyhammer/logic/category_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CategoryCubit>()..onLoadAllCategorys(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoryStateError) {
            return Center(child: Text(state.message));
          }
          if (state is CategoryStateLoaded) {
            if (state.categories.isEmpty) {
              return const Center(child: Text('Keine Kategorien vorhanden'));
            }
            return ListView(
              children: state.categories
                  .map(
                    (c) => Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/category_detail',
                            arguments: c,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.categoryName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                c.categoryDescription,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
