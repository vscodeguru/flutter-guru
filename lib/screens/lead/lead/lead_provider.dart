import 'package:flutter_guru/screens/lead/lead/index.dart';

class LeadProvider {
  final LeadRepository _leadRepository = new LeadRepository();

  LeadProvider();

  void test() {
    this._leadRepository.test();
  }
}
