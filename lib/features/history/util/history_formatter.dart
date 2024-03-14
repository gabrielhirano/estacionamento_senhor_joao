import 'package:intl/intl.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';

enum Log { checkIn, checkOut }

mixin HistoryFormatter {
  static String log(Log log,
      {required ParkingSpaceModel parkingSpace,
      required String ParkingSpaceModel}) {
    final now = DateTime.now();
    final dateTime = DateFormat('dd/MM/yyyy HH:mm').format(now);

    return '[$dateTime]: Placa ${parkingSpace.licensePlate} ${log == Log.checkIn ? 'Entrou' : 'Saiu'}';
  }
}
