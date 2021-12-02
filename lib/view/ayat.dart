import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../widgets/app_bar.dart';

import '../config.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({Key? key}) : super(key: key);
  final String ayatText =
        'قوله تعالى\n' +
      '{كُلُّ نَفْسٍ بِمَا كَسَبَتْ رَهِينَةٌ، إِلاَّ أَصْحَابَ الْيَمِينِ، فِي جَنَّاتٍ يَتَسَاءَلُونَ، عَنْ الْمُجْرِمِينَ، مَا سَلَكَكُمْ فِي سَقَرَ، قَالُوا لَمْ نَكُ مِنَ الْمُصَلِّينَ، وَلَمْ نَكُ نُطْعِمُ الْمِسْكِينَ، وَكُنَّا نَخُوضُ مَعَ الْخَائِضِينَ، وَكُنَّا نُكَذِّبُ بِيَوْمِ الدِّينِ، حَتَّى أَتَانَا الْيَقِينُ} [المدثر:38-46]' +
          '\n\n قوله تعالى\n' +
          '{وَأَمَّا مَنْ أُوتِيَ كِتَابَهُ بِشِمَالِه فَيَقُولُ يَا لَيْتَنِي لَمْ أُوتَ كِتَابِيهْ، وَلَمْ أَدْرِ مَا حِسَابِيهْ، يَا لَيْتَهَا كَانَتِ الْقَاضِيَةَ ، مَا أَغْنَى عَنِّي مَالِيهْ، هَلَكَ عَنِّي سُلْطَانِيهْ، خُذُوهُ فَغُلُّوهُ، ثُمَّ الْجَحِيمَ صَلُّوهُ، ثمَّ فِي سِلْسِلَةٍ ذَرْعُهَا سَبْعُونَ ذِرَاعاً فَاسْلُكُوه، إِنَّهُ كَانَ لا يُؤْمِنُ بِاللَّهِ الْعَظِيمِ، وَلا يَحُضُّ عَلَى طَعَامِ الْمِسْكِينِ} [الحاقة: 25 – 34] ' +
            '\n\n قوله تعالى\n' +
          '{كَلَّا بَل لَّا تُكْرِمُونَ الْيَتِيمَ، وَلَا تَحَاضُّونَ عَلَى طَعَامِ الْمِسْكِينِ} [الفجر: 17-18]' +
            '\n\n قوله تعالى\n' +
          '{إِنَّ الإِنْسَانَ خُلِقَ هَلُوعاً، إِذَا مَسَّهُ الشَّرُّ جَزُوعاً . وَإِذَا مَسَّهُ الْخَيْرُ مَنُوعاً، إِلَّا الْمُصَلِّينَ، الَّذِينَ هُمْ عَلَى صَلَاتِهِمْ دَائِمُونَ، وَالَّذِينَ فِي أَمْوَالِهِمْ حَقٌّ مَعْلُومٌ، لِلسَّائِلِ وَالْمَحْرُومِ} [المعارج: 19:20]' +
            '\n\n قوله تعالى\n' +
          '{وَهُوَ الَّذِي أَنشَأَ جَنَّاتٍ مَعْرُ‌وشَاتٍ وَغَيْرَ‌ مَعْرُ‌وشَاتٍ وَالنَّخْلَ وَالزَّرْ‌عَ مُخْتَلِفًا أُكُلُهُ وَالزَّيْتُونَ وَالرُّ‌مَّانَ مُتَشَابِهًا وَغَيْرَ‌ مُتَشَابِهٍ كُلُوا مِن ثَمَرِ‌ه إِذَا أَثْمَرَ‌ وَآتُوا حَقَّهُ يَوْمَ حَصَادِهِ وَلَا تُسْرِ‌فُوا إِنَّهُ لَا يُحِبُّ الْمُسْرِ‌فِينَ} [الأنعام: 141]';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: defaultAppBar(label: 'ayatDrawer'.tr),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundDecoration,
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  ayatText,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
