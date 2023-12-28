class User {
  final String uid;
  final String name;
  final String lastName;
  final String email;
  final DateTime createdAt;

  User({
    required this.uid,
    required this.name,
    required this.lastName,
    required this.email,
    required this.createdAt,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      uid: data['uid'],
      name: data['name'],
      lastName: data['lastName'],
      email: data['email'],
      createdAt: data['createdAt'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'lastName': lastName,
      'email': email,
      'createdAt': createdAt,
    };
  }
}
