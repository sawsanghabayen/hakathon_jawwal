import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../datebase/controller/reservations_db_controller.dart';
import '../model/api_response.dart';
import '../model/reservations.dart';


class ReservationsGetxController extends GetxController {
  RxList<Reservations> reservationsItem = <Reservations>[].obs;
  RxBool loading = false.obs;

  static ReservationsGetxController get to => Get.find<ReservationsGetxController>();

  @override
  void onInit() {
    read();
    super.onInit();
  } // List<Product> products = <Product>[];



  final ReservationsDbController _dbController = ReservationsDbController();



  Future<ProcessResponse> create(Reservations reservations) async {
    int index =
    reservationsItem.indexWhere((element) => element.productId == reservations.productId);
    if (index == -1) {
      int newRowId = await _dbController.create(reservations);
      if (newRowId != 0) {
        reservations.id = newRowId;
        reservationsItem.add(reservations);
      }
      return getResponse(newRowId != 0,'تم حجز التذكرة بنجاح');
    }
    return getResponse(false,'');
  }
  Future<ProcessResponse> deleteItem(int index) async {
    // loading = true.obs;
    Reservations reservations = reservationsItem[index];
    bool deleted = await _dbController.delete(reservations.id);
    if (deleted) {
      reservationsItem.removeAt(index);
    }
    return getResponse(deleted,'تم حذف التذكرة بنجاح');

  }

  void read() async {
    loading.value = true;
    reservationsItem.value = await _dbController.read();
    loading.value = false;
  }

  // Future<ProcessResponse> changeQuantity(int index, int count) async {
  //   bool isDelete = count == 0;
  //   Reservations reservations = reservationsItem[index];
  //   bool result = isDelete
  //       ? await _dbController.delete(reservations.id)
  //       : await _dbController.update(reservations);
  //
  //   if (result) {
  //     if (isDelete) {
  //       total -= reservations.total;
  //       quantity -= 1;
  //       reservationsItem.removeAt(index);
  //     } else {
  //       reservations.count = count;
  //       reservations.total = reservations.price * reservations.count;
  //       print(reservations.total);
  //       total = reservations.total;
  //       quantity += 1;
  //       reservationsItem[index] = reservations;
  //     }
  //   }
  //
  //   return getResponse(result,message: SharedPrefController().getValueFor<String>(PrefKeys.language.name)=='en'? 'Product has been increased successfully':'تمت الزيادة بنجاح');
  // }

  Future<ProcessResponse> clear() async {
    bool cleared = await _dbController.clear();
    if (cleared) {
      reservationsItem.clear();
    }
    return getResponse(cleared,'');
  }

  ProcessResponse getResponse(bool success, String message) {
    return ProcessResponse(
      message:message,
      success: success,
    );
  }
}