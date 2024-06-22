import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_todo_app/controllers/notes_controller.dart';
import 'package:my_notes_todo_app/models/note_model.dart';
import 'package:my_notes_todo_app/utils/app_colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = Get.put(NotesController());
    final updatedNoteArgument = Get.arguments ??
        {
          'isUpdate': false,
          'note': null,
          'index': null,
        };
    final bool isUpdate = updatedNoteArgument['isUpdate'];
    final note = updatedNoteArgument['note'] == null
        ? null
        : updatedNoteArgument['note'] as NoteModel;

    final int? index = updatedNoteArgument['index'] == null
        ? null
        : updatedNoteArgument['index'] as int;

    final titleController = TextEditingController(
      text: isUpdate ? note?.title : null,
    );
    final descriptionController = TextEditingController(
      text: isUpdate ? note?.description : null,
    );

    final createdTimeFormat = note?.createdDate == null
        ? null
        : DateFormat().add_jm().format(note!.createdDate);
    final createdDateFormat = note?.createdDate == null
        ? null
        : DateFormat().add_yMMMMd().format(note!.createdDate);

    final updatedTimeFormat = note?.updatedDate == null
        ? null
        : DateFormat().add_jm().format(note?.updatedDate as DateTime);
    final updatedDateFormat = note?.updatedDate == null
        ? null
        : DateFormat().add_yMMMMd().format(note?.updatedDate as DateTime);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              width: double.infinity,
              height: 2,
              decoration:
                  BoxDecoration(color: AppColors.backgroundSecondaryColor),
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Title",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondaryColor)),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryColor),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: TextFormField(
                        controller: descriptionController,
                        minLines: 1,
                        maxLines: 50,
                        decoration: InputDecoration(
                            hintText: "Enter Your Description",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.backgroundSecondaryColor)),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.backgroundSecondaryColor),
                      ),
                    ),
                  ),
                  isUpdate
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            note?.updatedDate != null
                                ? Text(
                                    'Last Modified: $updatedDateFormat. $updatedTimeFormat')
                                : const SizedBox(),
                            Text(
                                'Created: $createdDateFormat. $createdTimeFormat'),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
            InkWell(
              onTap: () {
                isUpdate
                    ? noteController.updateNotes(
                        index!,
                        NoteModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          createdDate: note!.createdDate,
                          updatedDate: DateTime.now(),
                        ))
                    : noteController.addNotes(NoteModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        createdDate: DateTime.now(),
                      ));
                Get.back();
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  isUpdate ? 'Update Changes' : 'Save Changes',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
