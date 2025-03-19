import 'package:asispoint/models/attendance_model.dart';
import 'package:asispoint/services/attendance_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:simple_month_year_picker/simple_month_year_picker.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {

    final attendanceService = Provider.of<AttendanceService>(context);

    String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20, top: 60, bottom: 10),
          child: const Text(
            'Mi Asistencia',
            style: TextStyle(
              fontSize: 25
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              capitalizeFirstLetter(attendanceService.attendanceHistoryMonth),
              style: const TextStyle(
                fontSize: 25
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                DateTime? selectedDate = await showMonthPicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now(),
                  locale: Locale('es'), // Configura el idioma a español
                );
                if (selectedDate != null) {
                  String pickedMonth = DateFormat('MMMM yyyy', 'es').format(selectedDate);
                  attendanceService.attendanceHistoryMonth = pickedMonth;
                }
              },
              child: const Text('Elige un mes'),
            )
          ],
        ),
        Expanded(
          child: FutureBuilder(
            future: attendanceService.getAttendanceHistory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      AttendanceModel attendanceData = snapshot.data[index];
                      return Container(
                        margin: const EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 10),
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent,
                              blurRadius: 10,
                              offset: Offset(2, 2)
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        capitalizeFirstLetter(DateFormat('EEEE', 'es').format(attendanceData.createAt)),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        DateFormat('dd', 'es').format(attendanceData.createAt),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Entrada',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54
                                    ),
                                  ),
                                  const SizedBox(width: 80, child: Divider(),),
                                  Text(
                                    attendanceData.checkIn,
                                    style: TextStyle(
                                      fontSize: 25
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Salida',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54
                                    ),
                                  ),
                                  const SizedBox(width: 80, child: Divider(),),
                                  Text(
                                    attendanceData.checkOut?.toString() ?? '--/--',
                                    style: TextStyle(
                                      fontSize: 25
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 15,)
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No hay datos disponibles',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  );
                }
              }
              return const LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.grey,
              );
            },
          ),
        )
      ],
    );
  }
}
