import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

extension EnumExtensions<T extends Enum> on T {
  String get humanizeName => this.name.replaceAll("_", " ").capitalize();
}
