import 'package:equatable/equatable.dart';

class AuthUser extends Equatable{
  final String id;
  final String? email;
  final String? name;
  final bool emailVerified;
  const AuthUser({
    required this.id,
    this.email,
    this.name,
    this.emailVerified=false
});

  static const empty= AuthUser(id: "");
  bool get isEmpty =>this == AuthUser.empty;

  @override
  // TODO: implement props
  List<Object?> get props => [
    emailVerified,
    id,
    name,
    email
  ];

}