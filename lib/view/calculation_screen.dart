import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controller/settings_controller.dart';
import '/controller/calculation_controller.dart';
import '/utils/data/global_data.dart';
import '/widgets/widgets.dart';

class CalculationScreen extends StatelessWidget {
  final int id;
  final _formKey = GlobalKey<FormState>();

  CalculationScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculationController globalController = Get.put(CalculationController());
    SettingsController settingsController = Get.find<SettingsController>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
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
          ),
          centerTitle: true,
        ),
        body: backgroundContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'zakatCalculator'.tr,
                          style: Get.theme.textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        const Divider(
                          height: 15,
                          thickness: 2,
                        ),
                        ListTile(
                          leading: Text("${'nisab'.tr} :"),
                          title: GetX<CalculationController>(
                              builder: (controller) {
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
                          trailing: (id == 3 || id == 0)
                              ? GetX<CalculationController>(
                                  builder: (controller) {
                                  if (id == 0) {
                                    return Text(
                                        'unity0${controller.radioValue}'.tr);
                                  }
                                  return Text(
                                      'unity3${controller.dropDownUnity.value}'
                                          .tr);
                                })
                              : Text('unity$id'.tr),
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
                                  borderSide:
                                      BorderSide(color: Get.theme.primaryColor),
                                ),
                                hintText: '0.0',
                              ),
                              validator: (value) {
                                try {
                                  double input = double.parse(value!);
                                  if (id == 0 && input != input.floor()) {
                                    globalController.changeToInitialResult();
                                    return 'error1'.tr;
                                  }
                                  double nisab = zakatTypes[id].nisab[(id != 3)
                                      ? globalController.radioValue.value
                                      : globalController.dropDownUnity.value -
                                          1];
                                  if (input < nisab) {
                                    globalController.changeToInitialResult();
                                    return 'error2'.tr + nisab.toString();
                                  }
                                } catch (_) {
                                  globalController.changeToInitialResult();
                                  return 'error3'.tr;
                                }
                              },
                              onSaved: (value) => globalController.getResult(
                                  input: double.parse(value!), itemId: id),
                            ),
                          ),
                          trailing: (id == 3 || id == 0)
                              ? GetX<CalculationController>(
                                  builder: (controller) {
                                  if (id == 3) {
                                    return DropdownButton<int>(
                                      value: controller.dropDownUnity.value,
                                      icon: const Icon(Icons.arrow_downward),
                                      iconSize: 12,
                                      elevation: 16,
                                      alignment: Alignment.center,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'ElMessiri',
                                          color: Colors.black),
                                      onChanged: (int? value) => controller
                                          .changeDropDownUnity(value: value!),
                                      items: dropDownItems
                                          .map<DropdownMenuItem<int>>(
                                              (int value) {
                                        return DropdownMenuItem<int>(
                                          alignment: Alignment.center,
                                          value: value,
                                          child: Text(
                                            'unity3$value'.tr,
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  }
                                  return Text(
                                      'unity0${controller.radioValue}'.tr);
                                })
                              : Text('unity$id'.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (zakatTypes[id].types != null)
                          ...zakatTypes[id].types!.map(
                                (type) => ListTile(
                                    leading: GetX<CalculationController>(
                                      builder: (controller) => Radio<int>(
                                        activeColor: Get.theme.primaryColor,
                                        value: type['index'],
                                        groupValue: controller.radioValue.value,
                                        onChanged: (value) {
                                          globalController
                                              .changeCurrentRadioValue(value!);
                                        },
                                      ),
                                    ),
                                    onTap: () => globalController
                                        .changeCurrentRadioValue(type['index']),
                                    title: Row(
                                      children: [
                                        (id == 0)
                                            ? SizedBox(
                                                child: Icon(
                                                  cattleIcons[type['index']],
                                                  size: (type['index'] == 2)
                                                      ? 17
                                                      : 20,
                                                  color: Get.theme.primaryColor
                                                      .withOpacity(0.4),
                                                ),
                                                width: 40,
                                              )
                                            : const SizedBox(),
                                        Text(
                                          "${type['value']}".tr,
                                        ),
                                      ],
                                    )),
                              ),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          'result'.tr,
                          style: Get.theme.textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        const Divider(
                          height: 15,
                          thickness: 2,
                        ),
                        GetX<CalculationController>(
                          builder: (controller) => Text(
                            controller.result.value,
                            style: Get.theme.textTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
