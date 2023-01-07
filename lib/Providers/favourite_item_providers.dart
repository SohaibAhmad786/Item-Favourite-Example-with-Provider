import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class FavoriteItemProviderClass with ChangeNotifier {

  List<int> _slist=[];
  
  List<int> get selectedList => _slist;


  void addSelectedItem(int index){
    _slist.add(index);
    notifyListeners();
  }

  void removeSelectedItem(int index){
    _slist.remove(index);
    notifyListeners();
  }

}