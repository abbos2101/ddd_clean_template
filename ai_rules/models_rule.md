Generate Dart models using freezed. Rules:

STRUCTURE:
- @freezed + abstract class + _$ClassName mixin
- part 'name.freezed.dart'; part 'name.g.dart';
- const factory + fromJson factory

FIELDS:
- Always @Default: String='', int=0, double=0.0, bool=false, List=[], enum=ENUM.UNKNOWN
- Enums: first value UNKNOWN, use @JsonKey(unknownEnumValue: Enum.UNKNOWN)

@JsonKey RULE:
- ONLY when API name ≠ Dart name (snake_case → camelCase)
- user_name → @JsonKey(name:'user_name') @Default('') String userName ✓
- userId → @Default(0) int userId ✓ (no @JsonKey - already camelCase)

REUSE:
- Identical JSON structures = single class

$SELECTION