// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:crypto/crypto.dart';
import 'dart:async';

late Db db;
late DbCollection userCollection;

Future<void> connectToDatabase() async {
  db = await Db.create(
      'mongodb+srv://johngastone11:7Yj1sKo7kWPNEq08@alamacluster.ge9hu.mongodb.net/auth_app_db?retryWrites=true&w=majority');
  await db.open();
  userCollection = db.collection('users');
}

String hashPassword(String password, String salt) {
  var bytes = utf8.encode(password + salt);
  var digest = sha256.convert(bytes);
  return digest.toString();
}

Future<Response> signupHandler(Request request) async {
  try {
    var body = await request.readAsString();
    var data = jsonDecode(body);

    String email = data['email'];
    String phoneNumber = data['phoneNumber'];
    String password = data['password'];

    var existingUser = await userCollection.findOne(
        where.eq('email', email).or(where.eq('phoneNumber', phoneNumber)));
    if (existingUser != null) {
      return Response(400,
          body: jsonEncode({'message': 'User already exists'}));
    }

    String salt = DateTime.now().millisecondsSinceEpoch.toString();
    String hashedPassword = hashPassword(password, salt);

    await userCollection.insert({
      'email': email,
      'phoneNumber': phoneNumber,
      'password': hashedPassword,
      'salt': salt,
    });

    return Response(201,
        body: jsonEncode({'message': 'User created successfully'}));
  } catch (e) {
    return Response(500,
        body: jsonEncode(
            {'message': 'Error creating user', 'error': e.toString()}));
  }
}

void main() async {
  await connectToDatabase();

  final router = Router()..post('/signup', signupHandler);

  final handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(router.call);
  var port = int.parse(Platform.environment['PORT'] ?? '3000 ');
  var server = await io.serve(handler, 'localhost', port);
  print('Server running on port ${server.port}');
}
