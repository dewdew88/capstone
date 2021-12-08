import 'package:capstone/data/db/database_helper.dart';
import 'package:capstone/data/models/registration_history.dart';
import 'package:capstone/provider/response_state.dart';
import 'package:flutter/material.dart';

class HistoryProvider extends ChangeNotifier {
  List<History> _historyList = [];
  late DbHelper _dbHelper;

  List<History> get histories => _historyList;

  HistoryProvider() {
    _dbHelper = DbHelper();
    _getHistory();
  }

  late ResponseState _historyState;

  ResponseState get state => _historyState;

  void _getHistory() async {
    try{
      _historyState = ResponseState.loading;
      _historyList = await _dbHelper.getHistory();
      if (_historyList.isEmpty) {
        _historyState = ResponseState.noData;
        notifyListeners();
      } else {
        _historyState = ResponseState.hasData;
        notifyListeners();
      }
    } catch (e) {
      _historyState = ResponseState.error;
      notifyListeners();
    }
  }

  Future<void> addHistory(History history) async {
    await _dbHelper.insertHistory(history);
    _getHistory();
  }
}