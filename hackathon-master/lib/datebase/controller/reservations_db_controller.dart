

import '../../model/reservations.dart';
import '../prefs/prefs.dart';
import 'db_operations.dart';

class ReservationsDbController extends DbOperations<Reservations> {
  dynamic userId = SharedPrefController().getValueFor('uId')!;

  @override
  Future<int> create(Reservations model) async {
    // User add new Item for the first time to the cart
    return await database.insert(Reservations.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await database.delete(
      Reservations.tableName,
      where: 'id = ? AND userId = ?',
      whereArgs: [id, userId],
    );
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Reservations>> read() async {

    List<Map<String ,dynamic>> rowsMap =await database.query(Reservations.tableName ,where:'userId = ?',
      whereArgs: [userId], );
    return rowsMap.map((rowMap) => Reservations.fromMap(rowMap)).toList();
  }

  @override
  Future<Reservations?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Reservations model) async {
    int countOfUpdatedRows = await database.update(
      Reservations.tableName,
      model.toMap(),
      where: 'id = ? AND userId = ?',
      whereArgs: [model.id, userId],
    );
    return countOfUpdatedRows == 1;
  }

  @override
  Future<bool> clear() async {
    int countOfDeletedRows = await database.delete(
      Reservations.tableName,
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return countOfDeletedRows > 0;
  }
}