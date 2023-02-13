abstract class MainScreenEvents{}

class GetData extends MainScreenEvents{}
class Deleteitem extends MainScreenEvents{
  String delteItemName;
  Deleteitem({
    required this.delteItemName
  });
}

class UpdateData extends MainScreenEvents{
  int index;
  String name;
  
  UpdateData({
    required this.index,
    required this.name,
  });
}