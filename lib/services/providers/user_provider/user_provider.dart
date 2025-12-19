import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart';

List<User> allUsers = [
  User(id: '1', firstName: 'Hoang', lastName: 'Hieu', email: 'hieu123@gmail.com', password: 'hieu123456', phone: '0123456789'),
  User(id: '2', firstName: 'Nguyen', lastName: 'Hieu', email: 'hieu123@gmail.com', password: 'hieu123456', phone: '0123456789'),
];

final userProvider = Provider((ref) {
  return allUsers;
});
