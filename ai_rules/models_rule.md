Generate Dart models using freezed. Rules:

STRUCTURE:
- @freezed + abstract class + _$ClassName mixin
- part 'name.freezed.dart'; part 'name.g.dart';
- const factory + fromJson factory

FIELDS:
- Always @Default: String='', int=0, double=0.0, bool=false, List=[], enum=ENUM.UNKNOWN
- @JsonKey(name:'snake_case') only when API name differs from camelCase
- Enums: first value UNKNOWN, use @JsonKey(unknownEnumValue: Enum.UNKNOWN)

NAMING:
- API: user_name → Dart: userName + @JsonKey(name:'user_name')
- API: status → Dart: status (no JsonKey needed)

REUSE:
- Identical JSON structures = single class (e.g., region/district with same fields → one class named by first occurrence)

$SELECTION