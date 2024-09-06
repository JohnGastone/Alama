// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:crypto/crypto.dart';
import 'dart:async';

// MongoDB connection
late Db db;
late DbCollection userCollection;

Future<void> connectToDatabase() async {
  db = await Db.create(
      'mongodb+srv://johngastone11:7Yj1sKo7kWPNEq08@alamacluster.ge9hu.mongodb.net/auth_app_db?retryWrites=true&w=majority');
  await db.open();
  userCollection = db.collection('users');
}

// Hash password using SHA-256 (Dart doesn't have bcrypt out of the box)
String hashPassword(String password, String salt) {
  var bytes = utf8.encode(password + salt); // Combine password and salt
  var digest = sha256.convert(bytes);
  return digest.toString();
}

// Signup handler
Future<Response> signupHandler(Request request) async {
  try {
    var body = await request.readAsString();
    var data = jsonDecode(body);

    String email = data['email'];
    String phoneNumber = data['phoneNumber'];
    String password = data['password'];

    // Check if user already exists
    var existingUser = await userCollection.findOne(
        where.eq('email', email).or(where.eq('phoneNumber', phoneNumber)));
    if (existingUser != null) {
      return Response(400,
          body: jsonEncode({'message': 'User already exists'}));
    }

    // Create salt and hash password
    String salt = DateTime.now()
        .millisecondsSinceEpoch
        .toString(); // Simple salt generation
    String hashedPassword = hashPassword(password, salt);

    // Create new user
    await userCollection.insert({
      'email': email,
      'phoneNumber': phoneNumber,
      'password': hashedPassword,
      'salt': salt, // Store salt to validate passwords later
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
  // Connect to MongoDB
  await connectToDatabase();

  // Create router for handling routes
  final router = Router()..post('/signup', signupHandler);

  // Start the server
  final handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(router.call);
  var port = int.parse(Platform.environment['PORT'] ?? '55522 ');
  var server = await io.serve(handler, 'localhost', port);
  print('Server running on port ${server.port}');
}
