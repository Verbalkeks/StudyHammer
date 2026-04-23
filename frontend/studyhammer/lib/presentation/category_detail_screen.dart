import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/config/injection.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/logic/question_view_model_cubit.dart';
import 'package:studyhammer/logic/question_view_model_state.dart';
import 'package:studyhammer/presentation/question_detail_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<QuestionViewModelCubit>()..onLoadAllQuestionViewModels(category.id!),
      child: BlocBuilder<QuestionViewModelCubit, QuestionViewModelState>(
        builder: (context, state){
          if (state is QuestionViewModelStateLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if (state is QuestionViewModelStateError) {
            return Center(child: Text(state.message));
          }
          if (state is QuestionViewModelStateLoaded) {
            if (state.questionViewModels.isEmpty) {
              return const Center(child: Text('Keine Fragen vorhanden'));
            }            
            return ListView(
              children: state.questionViewModels
                .map(
                  (qvm) => Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) =>
                              QuestionDetailScreen(),
                          )
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          qvm.question.questionText,
                          style :const TextStyle(
                            fontWeight: FontWeight.bold,
                          )
                        )
                      )
                    ),
                  )
                ).toList()
            );
          }
          return const SizedBox();
        }
      )
    );
  }
}