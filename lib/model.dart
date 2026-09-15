
import 'dart:convert';

class Model {
  int a;
  int b;
  Model({required this.a, required this.b});

  Model copyWith({int? a, int? b}) {
    return Model(a: a ?? this.a, b: b ?? this.b);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'a': a, 'b': b};
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(a: map['a'] as int, b: map['b'] as int);
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) =>
      Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Model(a: $a, b: $b)';

  @override
  bool operator ==(covariant Model other) {
    if (identical(this, other)) return true;

    return other.a == a && other.b == b;
  }

  @override
  int get hashCode => a.hashCode ^ b.hashCode;
}
