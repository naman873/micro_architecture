import 'package:get/get.dart';

import 'en_us.dart';
import 'fr_fr.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_Us': enUs, 'fr_Fr': frFR};
}
