import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyhammer/data/models/category.dart';
import 'package:studyhammer/logic/category_editor_cubit.dart';
import 'package:studyhammer/logic/category_editor_state.dart';
import 'package:studyhammer/logic/manage_repository_cubit.dart';
import 'package:studyhammer/logic/manage_repository_state.dart';

class CategoryEditorScreen extends StatefulWidget {
  const CategoryEditorScreen({super.key});

  @override
  State<CategoryEditorScreen> createState() => _CategoryEditorScreenState();
}

class _CategoryEditorScreenState extends State<CategoryEditorScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  Category? selectedCategory;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void selectCategory(Category category) {
    setState(() {
      selectedCategory = category;
      nameController.text = category.name;
      descriptionController.text = category.description;
    });
  }

  void clearSelection() {
    setState(() {
      selectedCategory = null;
      nameController.clear();
      descriptionController.clear();
    });
  }

  void saveCategory() {
    final name = nameController.text.trim();
    final description = descriptionController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Name darf nicht leer sein.")),
      );
      return;
    }

    final category = Category(
      id: selectedCategory?.id,
      name: name,
      description: description,
    );

    if (selectedCategory == null) {
      context.read<CategoryEditorCubit>().createCategory(category);
    } else {
      context.read<CategoryEditorCubit>().updateCategory(category);
    }
  }

  Future<void> deleteSelectedCategory() async {
    final category = selectedCategory;
    final categoryId = category?.id;
    if (category == null || categoryId == null) return;

    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Kategorie löschen?"),
          content: Text(category.name),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Abbrechen"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Löschen"),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true) return;
    if (!mounted) return;

    context.read<CategoryEditorCubit>().deleteCategory(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ManageRepositoryCubit>().state;

    if (state is! ManageRepositoryLoadedState) {
      return const SizedBox.shrink();
    }

    final categories = state.repository.categories;

    return BlocListener<CategoryEditorCubit, CategoryEditorState>(
      listener: (context, state) {
        if (state is CategoryEditorSavedState) {
          clearSelection();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Kategorie gespeichert.")),
          );
        }
        if (state is CategoryEditorErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<CategoryEditorCubit, CategoryEditorState>(
        builder: (context, editorState) {
          final isSaving = editorState is CategoryEditorSavingState;

          return Column(
            children: [categories.isNotEmpty
                ? DropdownButtonFormField<Category>(
                    key: ValueKey(selectedCategory?.id),
                    initialValue: selectedCategory,
                    decoration: const InputDecoration(
                      labelText: "Kategorie auswählen",
                    ),
                    items: categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: isSaving
                        ? null
                        : (category) {
                            if (category == null) return;
                            selectCategory(category);
                          },
                  )
                : const SizedBox.shrink(),
              const SizedBox(height: 12),
              TextField(
                controller: nameController,
                enabled: !isSaving,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                enabled: !isSaving,
                decoration: const InputDecoration(labelText: "Beschreibung"),
                minLines: 2,
                maxLines: 4,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  TextButton(
                    onPressed: isSaving ? null : clearSelection,
                    child: const Text("Neu"),
                  ),
                  ElevatedButton(
                    onPressed: isSaving ? null : saveCategory,
                    child: Text(
                      selectedCategory == null ? "Erstellen" : "Speichern",
                    ),
                  ),
                  const Spacer(),
                  selectedCategory != null ?
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: isSaving || selectedCategory == null
                        ? null
                        : deleteSelectedCategory,
                    child: const Text("Löschen"),
                  ) : const SizedBox.shrink(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
