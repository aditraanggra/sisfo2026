import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SisaSaldoPendis = prefs.getInt('ff_SisaSaldoPendis') ?? _SisaSaldoPendis;
    });
    _safeInit(() {
      _ListSekolahSD = prefs
              .getStringList('ff_ListSekolahSD')
              ?.map((x) {
                try {
                  return SekolahSdStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ListSekolahSD;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_profileUPZ')) {
        try {
          final serializedData = prefs.getString('ff_profileUPZ') ?? '{}';
          _profileUPZ =
              UpzStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _SisaSaldoPendis = 0;
  int get SisaSaldoPendis => _SisaSaldoPendis;
  set SisaSaldoPendis(int value) {
    _SisaSaldoPendis = value;
    prefs.setInt('ff_SisaSaldoPendis', value);
  }

  List<SekolahSdStruct> _ListSekolahSD = [];
  List<SekolahSdStruct> get ListSekolahSD => _ListSekolahSD;
  set ListSekolahSD(List<SekolahSdStruct> value) {
    _ListSekolahSD = value;
    prefs.setStringList(
        'ff_ListSekolahSD', value.map((x) => x.serialize()).toList());
  }

  void addToListSekolahSD(SekolahSdStruct value) {
    ListSekolahSD.add(value);
    prefs.setStringList(
        'ff_ListSekolahSD', _ListSekolahSD.map((x) => x.serialize()).toList());
  }

  void removeFromListSekolahSD(SekolahSdStruct value) {
    ListSekolahSD.remove(value);
    prefs.setStringList(
        'ff_ListSekolahSD', _ListSekolahSD.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListSekolahSD(int index) {
    ListSekolahSD.removeAt(index);
    prefs.setStringList(
        'ff_ListSekolahSD', _ListSekolahSD.map((x) => x.serialize()).toList());
  }

  void updateListSekolahSDAtIndex(
    int index,
    SekolahSdStruct Function(SekolahSdStruct) updateFn,
  ) {
    ListSekolahSD[index] = updateFn(_ListSekolahSD[index]);
    prefs.setStringList(
        'ff_ListSekolahSD', _ListSekolahSD.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListSekolahSD(int index, SekolahSdStruct value) {
    ListSekolahSD.insert(index, value);
    prefs.setStringList(
        'ff_ListSekolahSD', _ListSekolahSD.map((x) => x.serialize()).toList());
  }

  UpzStruct _profileUPZ = UpzStruct.fromSerializableMap(jsonDecode('{}'));
  UpzStruct get profileUPZ => _profileUPZ;
  set profileUPZ(UpzStruct value) {
    _profileUPZ = value;
    prefs.setString('ff_profileUPZ', value.serialize());
  }

  void updateProfileUPZStruct(Function(UpzStruct) updateFn) {
    updateFn(_profileUPZ);
    prefs.setString('ff_profileUPZ', _profileUPZ.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
