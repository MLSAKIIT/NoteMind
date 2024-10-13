import 'package:flutter/cupertino.dart';

class UserProfileProvider extends ChangeNotifier{
  
  String _imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnDNmpgYnTP4ELmIob69uKE1O0Rbrotna00g&s';
  String _name = "MLSA";
  String _email = "mlsa@gmail.com";
  String _roll = "12345";

  String get name => _name;
  String get email => _email;
  String get roll => _roll;
  String get image => _imageUrl;

  void updateProfile(String newImage){
    _imageUrl = newImage;
    notifyListeners();
  }
  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updateRoll(String newRoll) {
    _roll = newRoll;
    notifyListeners();
  }
}