Generate Dart models using freezed. Rules:

STRUCTURE:
- @freezed + abstract class + _$ClassName mixin
- part 'name.freezed.dart'; part 'name.g.dart';
- const factory + fromJson factory

FIELDS:
- @JsonKey(name:'snake_case') before @Default when API name differs from camelCase
- Always @Default: String='', int=0, double=0.0, bool=false, List=[], enum=ENUM.UNKNOWN
- Enums: first value UNKNOWN, use @JsonKey(unknownEnumValue: Enum.UNKNOWN)

NAMING:
- API: user_name → Dart: @JsonKey(name:'user_name') @Default('') String userName
- API: status → Dart: @Default('') String status (no JsonKey needed)

REUSE:
- Identical JSON structures = single class

$SELECTION