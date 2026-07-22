class CategoryEditorState {}

class CategoryEditorInitialState extends CategoryEditorState {}

class CategoryEditorSavingState extends CategoryEditorState {}

class CategoryEditorSavedState extends CategoryEditorState {}

class CategoryEditorErrorState extends CategoryEditorState {
  final String message;

  CategoryEditorErrorState(this.message);
}
