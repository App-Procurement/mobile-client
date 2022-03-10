import 'package:get/get.dart';
import 'package:procurementapp/Controller/CommiteeController.dart';
import 'package:procurementapp/Controller/P.OController.dart';
import 'package:procurementapp/Controller/ReceivedRFPController.dart';
import 'package:procurementapp/Controller/RequisitionsController.dart';
import 'package:procurementapp/Controller/rfqController.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => CommiteeController());
    Get.lazyPut(() => ReceivedRFPController());
    Get.lazyPut(() => RequisitionsController());
    Get.lazyPut(() => POController());
    Get.lazyPut(() => rfqController());
  }
}
