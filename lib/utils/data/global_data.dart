import 'package:flutter/material.dart';
import '/models/zakat_type.dart';

import 'calculations_functions.dart';
import 'zakat_icons.dart';

final List<ZakatType> zakatTypes = [
  //zakat on cattle
  ZakatType(
    id: 0,
    name: 'name0',
    icon: ZakatIcons.camel,
    about: 'about0',
    //head
    nisab: [
      40,
      30,
      5,
    ],
    types: [
      {'index': 0, 'value': 'type00'}, //ovins
      {'index': 1, 'value': 'type01'}, //bovins
      {'index': 2, 'value': 'type02'} //chameaux
    ],
    function: zakatFunctions[0],
  ),
  //zakat on farm produce
  ZakatType(
    id: 1,
    name: 'name1',
    icon: ZakatIcons.wheat,
    unity: 'unity1',
    //kg
    about: 'about1',
    nisab: [
      675,
      675,
    ],
    types: [
      {'index': 0, 'value': 'type10'}, //naturelle
      {'index': 1, 'value': 'type11'}, //artificielle
    ],
    function: zakatFunctions[1],
  ),
  //zakat on gold and silver
  ZakatType(
    id: 2,
    name: 'name2',
    icon: ZakatIcons.coins,
    unity: 'unity2',
    //g
    about: 'about2',
    nisab: [
      595,
      113,
      97,
      85,
    ],
    types: [
      {'index': 0, 'value': 'type20'}, //silver
      {'index': 1, 'value': 'type21'}, //18 carats
      {'index': 2, 'value': 'type22'}, //21 carats
      {'index': 3, 'value': 'type23'}, //24 carats
    ],
    function: zakatFunctions[2],
  ),

  //zakat on money
  ZakatType(
    id: 3,
    name: 'name3',
    icon: ZakatIcons.money,
    unity: 'unity3',
    about: 'about3',
    nisab: [
      705500,
    ],
    function: zakatFunctions[3],
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
    'value': 'ar',
    'label': 'عربي',
  },
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
