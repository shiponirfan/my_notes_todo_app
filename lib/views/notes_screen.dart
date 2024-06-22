import 'package:flutter/material.dart';
import 'package:my_notes_todo_app/utils/app_colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Last Modified: 10 Aug 2014. 12:35 am'),
                      Text('Created: 08 Aug 2014. 11:35 am'),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
