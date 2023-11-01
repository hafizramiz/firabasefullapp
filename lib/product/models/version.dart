import 'package:firebasefullapp/product/models/abstrat_model.dart';
import 'package:equatable/equatable.dart';

class Version extends Equatable with IdRequiredModel, IFirebaseModel<Version> {
  final String? number;

  Version({
    this.number,
  });

  Version copyWith({
    String? number,
  }) {
    return Version(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  Version fromJson(Map<String, dynamic> json) {
    return Version(
      number: json['number'] as String?,
    );
  }

  @override
  // TODO: implement id
  String? id = "";

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
