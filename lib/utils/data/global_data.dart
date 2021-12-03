import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '/models/zakat_type.dart';

import 'calculations_functions.dart';

final List<ZakatType> zakatTypes = [
  //zakat on money
  ZakatType(
    id: 0,
    name: 'name0',
    icon: Icons.home,
    unity: 'unity0',
    about: 'about0',
    nisab: 0,
      functions: zakatFunctions[0]
  ),
  //zakat on cattle
  ZakatType(
    id: 1,
    name: 'name1',
    icon: Icons.home,
    about: 'about1',
    unity: 'unity',
    nisab: 0,
    list: [
      {'index': 0, 'value': 'chameaux'},//chameaux
      {'index': 1, 'value': 'bovins'},//bovins
      {'index': 2, 'value': 'ovins'}//ovins
    ],
      functions: zakatFunctions[1]
  ),
  //zakat on gold
  ZakatType(
    id: 2,
    name: 'name2',
    icon: Icons.home,
    unity: 'unity2',
    about: 'about2',
    nisab: 0,
      functions: zakatFunctions[2]
  ),
  //zakat on silver
  ZakatType(
    id: 3,
    name: 'name3',
    icon: Icons.home,
    unity: 'unity3',
    about: 'about3',
    nisab: 0,
      functions: zakatFunctions[3]
  ),
  //zakat on farm produce
  ZakatType(
    id: 4,
    name: 'name4',
    icon: Icons.home,
    unity: 'unity4',
    about: 'about4'.tr,
    nisab: 0,
    list: [
      {'index': 0, 'value': 'type1'},
      {'index': 2, 'value': 'type2'},
    ], functions: zakatFunctions[4],
  ),
];
const List<Map<String, dynamic>> themes = [
  {
    'index': 0,
    'value': ThemeMode.light,
    'label': 'lightMode',
  },
  {
    'index': 1,
    'value': ThemeMode.dark,
    'label': 'darkMode',
  },
  {
    'index': 2,
    'value': ThemeMode.system,
    'label': 'systemMode',
  }
];

const List languages = [
  {
    'value': 'en',
    'label': 'English',
  },
  {
    'value': 'fr',
    'label': 'Français',
  },
  {
    'value': 'ar',
    'label': 'عربي',
  }
];



const String ayatText = 'قوله تعالى\n' +
    '{كُلُّ نَفْسٍ بِمَا كَسَبَتْ رَهِينَةٌ، إِلاَّ أَصْحَابَ الْيَمِينِ، فِي جَنَّاتٍ يَتَسَاءَلُونَ، عَنْ الْمُجْرِمِينَ، مَا سَلَكَكُمْ فِي سَقَرَ، قَالُوا لَمْ نَكُ مِنَ الْمُصَلِّينَ، وَلَمْ نَكُ نُطْعِمُ الْمِسْكِينَ، وَكُنَّا نَخُوضُ مَعَ الْخَائِضِينَ، وَكُنَّا نُكَذِّبُ بِيَوْمِ الدِّينِ، حَتَّى أَتَانَا الْيَقِينُ}\n'
        '[المدثر:38-46]' +
    '\n\n قوله تعالى\n' +
    '{وَأَمَّا مَنْ أُوتِيَ كِتَابَهُ بِشِمَالِه فَيَقُولُ يَا لَيْتَنِي لَمْ أُوتَ كِتَابِيهْ، وَلَمْ أَدْرِ مَا حِسَابِيهْ، يَا لَيْتَهَا كَانَتِ الْقَاضِيَةَ ، مَا أَغْنَى عَنِّي مَالِيهْ، هَلَكَ عَنِّي سُلْطَانِيهْ، خُذُوهُ فَغُلُّوهُ، ثُمَّ الْجَحِيمَ صَلُّوهُ، ثمَّ فِي سِلْسِلَةٍ ذَرْعُهَا سَبْعُونَ ذِرَاعاً فَاسْلُكُوه، إِنَّهُ كَانَ لا يُؤْمِنُ بِاللَّهِ الْعَظِيمِ، وَلا يَحُضُّ عَلَى طَعَامِ الْمِسْكِينِ}\n'
        '[الحاقة: 25 – 34]' +
    '\n\n قوله تعالى\n' +
    '{كَلَّا بَل لَّا تُكْرِمُونَ الْيَتِيمَ، وَلَا تَحَاضُّونَ عَلَى طَعَامِ الْمِسْكِينِ}\n'
        '[الفجر: 17-18]' +
    '\n\n قوله تعالى\n' +
    '{إِنَّ الإِنْسَانَ خُلِقَ هَلُوعاً، إِذَا مَسَّهُ الشَّرُّ جَزُوعاً . وَإِذَا مَسَّهُ الْخَيْرُ مَنُوعاً، إِلَّا الْمُصَلِّينَ، الَّذِينَ هُمْ عَلَى صَلَاتِهِمْ دَائِمُونَ، وَالَّذِينَ فِي أَمْوَالِهِمْ حَقٌّ مَعْلُومٌ، لِلسَّائِلِ وَالْمَحْرُومِ}\n '
        '[المعارج: 19:20]' +
    '\n\n قوله تعالى\n' +
    '{وَهُوَ الَّذِي أَنشَأَ جَنَّاتٍ مَعْرُ‌وشَاتٍ وَغَيْرَ‌ مَعْرُ‌وشَاتٍ وَالنَّخْلَ وَالزَّرْ‌عَ مُخْتَلِفًا أُكُلُهُ وَالزَّيْتُونَ وَالرُّ‌مَّانَ مُتَشَابِهًا وَغَيْرَ‌ مُتَشَابِهٍ كُلُوا مِن ثَمَرِ‌ه إِذَا أَثْمَرَ‌ وَآتُوا حَقَّهُ يَوْمَ حَصَادِهِ وَلَا تُسْرِ‌فُوا إِنَّهُ لَا يُحِبُّ الْمُسْرِ‌فِينَ}\n'
        '[الأنعام: 141]';
