import 'dart:convert';

class User {
  int? id;
  String? name;
  String? token;
  String? email;
  String? email_verified_at;
  String? is_admin;
  String? created_at;
  String? updated_at;
  User({
    this.id,
    this.name,
    this.email,
    this.token,
    this.email_verified_at,
    this.is_admin,
    this.created_at,
    this.updated_at,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? token,
    String? email_verified_at,
    String? is_admin,
    String? created_at,
    String? updated_at,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      is_admin: is_admin ?? this.is_admin,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': email_verified_at,
      'is_admin': is_admin,
      'token': token,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      token: map['token'] as String,
      email: map['email'] as String,
      email_verified_at: map['email_verified_at'] as String,
      is_admin: map['is_admin'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  setUser(User user) {
    this.id = user.id;
    this.email = user.email;
    this.name = user.name;
    this.created_at = user.created_at;
    this.updated_at = user.updated_at;
    this.email_verified_at = user.email_verified_at;
    this.is_admin = user.is_admin;
    this.token = user.token;
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, email_verified_at: $email_verified_at, is_admin: $is_admin, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.email_verified_at == email_verified_at &&
        other.is_admin == is_admin &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        email_verified_at.hashCode ^
        is_admin.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
