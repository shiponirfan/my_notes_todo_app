import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_todo_app/controllers/notes_controller.dart';
import 'package:my_notes_todo_app/utils/app_colors.dart';
import 'package:my_notes_todo_app/views/notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesController = Get.put(NotesController());
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () => Get.to(() => const NotesScreen()),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        style: IconButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'My Notes',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notesController.notes.length,
                    itemBuilder: (context, index) {
                      final note = notesController.notes[index];

                      final createdTimeFormat =
                          DateFormat().add_jm().format(note.createdDate);
                      final createdDateFormat =
                          DateFormat().add_yMMMMd().format(note.createdDate);

                      final updatedTimeFormat = note.updatedDate == null
                          ? null
                          : DateFormat()
                              .add_jm()
                              .format(note.updatedDate as DateTime);
                      final updatedDateFormat = note.updatedDate == null
                          ? null
                          : DateFormat()
                              .add_yMMMMd()
                              .format(note.updatedDate as DateTime);

                      return InkWell(
                        onTap: () =>
                            Get.to(() => const NotesScreen(), arguments: {
                          'isUpdate': true,
                          'note': note,
                          'index': index,
                        }),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5),
                            minVerticalPadding: 0,
                            titleAlignment: ListTileTitleAlignment.titleHeight,
                            leading: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  shape: BoxShape.circle),
                            ),
                            title: Text(
                              note.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  note.description,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.backgroundSecondaryColor,
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        note.updatedDate == null
                                            ? 'Created: $createdDateFormat. $createdTimeFormat'
                                            : 'Last Modified: $updatedDateFormat. $updatedTimeFormat',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors
                                              .backgroundSecondaryColor,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Get.snackbar('Deleted',
                                                'Note Deleted Successfully');
                                            notesController.deleteNotes(index);
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
