class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;

  //<editor-fold desc="Data Methods">
  const User({required this.id, required this.firstName, required this.lastName, required this.email, required this.password, required this.phone});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          password == other.password &&
          phone == other.phone);

  @override
  int get hashCode => id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ password.hashCode ^ phone.hashCode;

  @override
  String toString() {
    return 'User{' + ' id: $id,' + ' firstName: $firstName,' + ' lastName: $lastName,' + ' email: $email,' + ' password: $password,' + ' phone: $phone,' + '}';
  }

  User copyWith({String? id, String? firstName, String? lastName, String? email, String? password, String? phone}) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': this.id, 'firstName': this.firstName, 'lastName': this.lastName, 'email': this.email, 'password': this.password, 'phone': this.phone};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
    );
  }

  //</editor-fold>
}
