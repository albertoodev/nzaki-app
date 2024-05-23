import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controller/calculation_controller.dart';
import '/utils/data/global_data.dart';
import '/widgets/widgets.dart';
import '/utils/extension.dart';

class CalculationScreen extends StatelessWidget {
  final int id;
  final _formKey = GlobalKey<FormState>();
  final CalculationController _globalController =
      Get.put(CalculationController());

  CalculationScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: _appBarTitle,
          centerTitle: true,
        ),
        body: BackgroundContainer(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _zakatCalculatorCard(context: context),
                const SizedBox(
                  height: 20,
                ),
                _resultCard,
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// get [AppBar] title
  Widget get _appBarTitle => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            zakatTypes[id].icon,
            color: Colors.white.withOpacity(0.2),
            size: (id == 1) ? 20 : 15,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'name$id'.tr,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            zakatTypes[id].icon,
            color: Colors.white.withOpacity(0.2),
            size: (id == 1) ? 20 : 15,
          ),
        ],
      );

  /// get result [Card]
  Card get _resultCard => Card(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
              Text(
                'result'.tr,
                style: Get.theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              GetX<CalculationController>(
                builder: (controller) => Text(
                  controller.result.value,
                  style: Get.theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );

  /// get zakat calculator [Card]
  Card _zakatCalculatorCard({required BuildContext context}) => Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'zakatCalculator'.tr,
                style: Get.theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              _zakatInputs,
              const SizedBox(
                height: 10,
              ),
              if (zakatTypes[id].types != null) _getZakatTypes(),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                label: Text('calculate'.tr),
                backgroundColor: Get.theme.primaryColor,
              )
            ],
          ),
        ),
      );

  /// get [List] of [ListTile] - zakat inputs (Nisab && Value)
  Column get _zakatInputs => Column(
        children: [
          ListTile(
            leading: Text("${'nisab'.tr} :"),
            title: GetX<CalculationController>(builder: (controller) {
              if (id == 3) {
                return Text(
                  '${(zakatTypes[id].nisab[controller.dropDownUnity.value - 1])}',
                  textAlign: TextAlign.center,
                );
              }
              return Text(
                '${(zakatTypes[id].nisab[controller.radioValue.value]).floor()}',
                textAlign: TextAlign.center,
              );
            }),
            trailing: _getUnity,
          ),
          ListTile(
            leading: Text("${'value'.tr} :"),
            title: Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Get.theme.primaryColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Get.theme.primaryColor),
                  ),
                  hintText: '0.0',
                ),
                validator: (value) {
                  try {
                    double input = value!.toDouble();
                    if (id == 0 && input != input.floor()) {
                      _globalController.changeToInitialResult();
                      return 'error1'.tr;
                    }
                    double nisab;
                    if (id == 3) {
                      nisab = zakatTypes[id]
                          .nisab[_globalController.dropDownUnity.value - 1];
                    } else {
                      nisab = zakatTypes[id]
                          .nisab[_globalController.radioValue.value];
                    }
                    if (input < nisab) {
                      _globalController.changeToInitialResult();
                      return 'error2'.tr + nisab.toString();
                    }
                  } catch (_) {
                    _globalController.changeToInitialResult();
                    return 'error3'.tr;
                  }
                  return null;
                },
                onSaved: (value) => _globalController.calculateResult(
                    input: value!.toDouble(), itemId: id),
              ),
            ),
            trailing: _getUnity,
          ),
        ],
      );

  /// get [ListTile] trailing - zakat type unity
  Widget get _getUnity => ConditionBuilder(
        condition: id == 3 || id == 0,
        builder: GetX<CalculationController>(builder: (controller) {
          if (id == 0) {
            return Text('unity0${controller.radioValue}'.tr);
          }
          return Text('unity3${controller.dropDownUnity.value}'.tr);
        }),
        fullback: Text('unity$id'.tr),
      );

  /// get [List] of [RadioListTile] to choose the zakat type
  Column _getZakatTypes() {
    return Column(
      children: zakatTypes[id]
          .types!
          .map(
            (type) => GetX<CalculationController>(
                builder: (controller) => RadioListTile<int>(
                      value: type['index'],
                      groupValue: controller.radioValue.value,
                      onChanged: (value) {
                        _globalController.changeCurrentRadioValue(value!);
                      },
                      activeColor: Get.theme.primaryColor,
                      title: Text(
                        "${type['value']}".tr,
                      ),
                    )),
          )
          .toList(),
    );
  }
}
