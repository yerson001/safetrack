import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharePref{
  Future<void> save(String key, dynamic value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));   
  }
/*
  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(key) != null){
      return json.decode(prefs.getString(key)!);
    }
    return null;
  }
*/
  Future<dynamic> read(String key) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final storedValue = prefs.getString(key);
    if (storedValue != null) {
      return json.decode(storedValue); // Decodifica si existe
    }
    return null; // Retorna null si no existe el valor
  } catch (e) {
    print("Error leyendo la clave $key: $e");
    return null; // Maneja errores devolviendo null
  }
}

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

}