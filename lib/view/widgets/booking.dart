import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../controllers/user_controller/category_controller/appointment_controller.dart';

class ModalItem extends StatelessWidget {
  const ModalItem({Key? key}) : super(key: key);

  // DateTime d = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final bookingcontoller = Provider.of<AppointmentController>(
      context,
    );
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(8),
      color: Colors.black,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          final result = await showBoardDateTimePicker(
            context: context,
            pickerType: DateTimePickerType.datetime,
            options: const BoardDateTimeOptions(
              languages: BoardPickerLanguages.en(),
              startDayOfWeek: DateTime.sunday,
              pickerFormat: PickerFormat.ymd,
              boardTitle: 'Board Picker',
              pickerSubTitles: BoardDateTimeItemTitles(year: 'year'),
            ),
            onResult: (val) {},
          );
          if (result != null) {
            print(
                'flkgjdfjghdfghkdjghkjdfghkdhjhhhhhhhhhhhhhhsssssssssssssssssssssssssss$result');
            bookingcontoller.dateChecker(result);
            // setState(() => d = result);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              Material(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: Icon(
                      IconlyBold.calendar,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  BoardDateFormat('yyyy/MM/dd HH:mm')
                      .format(bookingcontoller.date),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                'selected date',
                style: GoogleFonts.nunito(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
