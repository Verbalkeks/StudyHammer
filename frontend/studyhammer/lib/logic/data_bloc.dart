import 'dart:async';

import 'package:studyhammer/data/models/question.dart';
import 'package:studyhammer/data/repositories/supabase_category_repository.dart';
import 'package:studyhammer/logic/data_event.dart';
import 'package:studyhammer/logic/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:get_it/get_it.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final QuestionRepository _repository;
  DataBloc(this._repository) : super(DataLoading()) {
    on<LoadData>(_onLoadData);
    on<AddQuestion>(_onAddQuestion);
  }

  FutureOr<void> _onLoadData(LoadData event, Emitter<DataState> emit) {
    // TODO
  }

  FutureOr<void> _onAddQuestion(AddQuestion event, Emitter<DataState> emit) {
    // TODO
  }
}