import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pmsn_p6/models/products_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductsDatabase {
  static final NAMEDB = 'DESPENSADB';
  static final VERSIONDB = 1;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, NAMEDB);

    return openDatabase(
      pathDB,
      version: VERSIONDB,
      onCreate: (db, version) {
        String query = '''CREATE TABLE tblProductos(
          idProducto INTEGER PRIMARY KEY,
          nomProducto VARCHAR(30),
          desProductos VARCHAR(300),
          precioProducto INTEGER,
        )''';
        db.execute(query);
      },
    );
  }

  Future<int> INSERTAR(Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.insert('tblProductos', data);
  }

  Future<int> ACTUALIZAR(Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.update(
      'tblProductos',
      data,
      where: 'idProducto = ?',
      whereArgs: [data['idProducto']],
    );
  }

  Future<int> ELIMINAR(int idProducto) async {
    var conexion = await database;
    return conexion.delete(
      'tblProductos',
      where: 'idProducto = ?',
      whereArgs: [idProducto],
    );
  }

  Future<List<ProductosModel>> CONSULTAR() async {
    var conexion = await database;
    var products = await conexion.query('tblProductos');
    return products.map((product) => ProductosModel.fromMap(product)).toList();
  }
}
