import 'package:get/get.dart';

import '../../../data/model/patient.dart';
import '../../../data/services/patient_service.dart';

class ProfileController extends GetxController {
  bool isLoading = true;
  Patient? patient = Patient();
  @override
  void onInit() {
    super.onInit();
  
    getPatientData();
  }
  void getPatientData() async {
    patient = await PatientService().listOfPatient();
    isLoading = false;
    update();
  }
}
