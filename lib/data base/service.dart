import 'repository.dart';
import 'package:asbeza/data/model/model.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveUser(Item item) async {
    return await _repository!.insertData('item', item.toJson());
  }

  readUser() async {
    return await _repository!.readData('item');
  }

  updateUser(Item item) async {
    return await _repository!.updateData('item', item.toJson());
  }

  deleteUser(dispatchId) async {
    return await _repository!.deleteData('item', dispatchId);
  }
}