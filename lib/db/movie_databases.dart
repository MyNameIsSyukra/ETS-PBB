import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:etspbb/model/moviedb.dart';
import 'package:synchronized/synchronized.dart';


class MovieDatabase {
  static final MovieDatabase instance = MovieDatabase._init();
  static Database? _database;

  MovieDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('movies.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableMovies (
        ${MovieFields.id} $idType, 
        ${MovieFields.title} $textType,
        ${MovieFields.director} $textType,
        ${MovieFields.description} $textType
      )''');
      }

  Future<Movie> create(Movie movie) async {
    final db = await instance.database;
    final id = await db.insert(tableMovies, movie.toJson());
    return movie.copy(id: id);
  }


  Future<Movie>readMovie(int id) async{
    final db = await instance.database;
    final maps = await db.query(
      tableMovies,
      columns: MovieFields.values,
      where: '${MovieFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty){
      return Movie.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
  Future<int>update(Movie movie)async{
    final db = await instance.database;
    return db.update(
      tableMovies,
      movie.toJson(),
      where: '${MovieFields.id} = ?',
      whereArgs: [movie.id],
    );
  }
  Future<int>delete(int id)async {
    final db = await instance.database;
    return await db.delete(
      tableMovies,
      where: '${MovieFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Movie>>readAllMovies() async {
    final db = await instance.database;
    final result = await db.query(tableMovies);
    return result.map((json) => Movie.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

}