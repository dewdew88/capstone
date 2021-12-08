import 'package:capstone/data/api/api_service.dart';
import 'package:capstone/data/api_models/vaccination.dart';
import 'package:capstone/provider/response_state.dart';
import 'package:flutter/material.dart';

class CurveProvider extends ChangeNotifier {
  final ApiService apiService;

  CurveProvider({required this.apiService}) {
    _fetchVaccinationData();
  }

  late Vaccination _vaccinationData;
  late ResponseState _vaccinationState;
  String _message = '';

  String get message => _message;

  Vaccination get vaccinationData => _vaccinationData;
  ResponseState get vaccinationState => _vaccinationState;

  Future<dynamic> _fetchVaccinationData() async {
    try {
      _vaccinationState = ResponseState.loading;
      notifyListeners();
      final vaccination = await apiService.fetchVaccination();
      if (vaccination.harian.isEmpty) {
        _vaccinationState = ResponseState.noData;
        notifyListeners();
        return _message = 'Data is Empty';
      } else {
        _vaccinationState = ResponseState.hasData;
        notifyListeners();
        return _vaccinationData = vaccination;
      }
    } catch (e) {
      _vaccinationState = ResponseState.error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}