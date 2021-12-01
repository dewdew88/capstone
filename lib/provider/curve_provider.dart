import 'package:capstone/data/api/api_service.dart';
import 'package:capstone/data/api_models/vaccination.dart';
import 'package:flutter/material.dart';

enum CurveState {loading, hasData, noData, error}

class CurveProvider extends ChangeNotifier {
  final ApiService apiService;

  CurveProvider({required this.apiService}) {
    _fetchVaccinationData();
  }

  late Vaccination _vaccinationData;
  late CurveState _vaccinationState;
  String _message = '';

  String get message => _message;

  Vaccination get vaccinationData => _vaccinationData;
  CurveState get vaccinationState => _vaccinationState;

  Future<dynamic> _fetchVaccinationData() async {
    try {
      _vaccinationState = CurveState.loading;
      notifyListeners();
      final vaccination = await apiService.fetchVaccination();
      if (vaccination.harian.isEmpty) {
        _vaccinationState = CurveState.noData;
        notifyListeners();
        return _message = 'Data is Empty';
      } else {
        _vaccinationState = CurveState.hasData;
        notifyListeners();
        return _vaccinationData = vaccination;
      }
    } catch (e) {
      _vaccinationState = CurveState.error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}