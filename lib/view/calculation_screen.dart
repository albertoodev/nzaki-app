import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/calculation_controller.dart';
import '../utils/data/global_data.dart';
import '../view/about.dart';
import '../widgets/widgets.dart';

class CalculationScreen extends StatelessWidget {
  final int id;
  final _formKey = GlobalKey<FormState>();

  CalculationScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculationController globalController = Get.put(CalculationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(zakatTypes[id].name.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(title: zakatTypes[id].name.tr, content: Text('about$id'.tr));
            },
            icon: const Icon(
              Icons.info,
            ),
          ),
        ],
      ),
      body: backgroundContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                          builder: (controller) => Text(
                            '${(zakatTypes[id].nisab[controller.radioValue.value]).floor()}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        trailing: (id == 0)
                            ? const SizedBox()
                            : Text(zakatTypes[id].unity!.tr),
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
                                if(id==0 && input != input.floor()){
                                  return 'value must be a integer positif';
                                }
                                double nisab = zakatTypes[id]
                                    .nisab[globalController.radioValue.value];
                                if (input <= 0) {
                                  return 'value can not be zero or negative ';
                                }
                                if (input < nisab) {
                                  return 'value can note be less than ' +
                                      nisab.toString();
                                }
                              } catch (_) {
                                return 'enter number positive';
                              }
                              ;
                            },
                            onSaved: (value) => globalController.getResult(
                                input: double.parse(value!), itemId: id),
                          ),
                        ),
                        trailing: (id == 0)
                            ? const SizedBox()
                            : Text((zakatTypes[id].unity!).tr),
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
                                title: Text(
                                  "${type['value']}".tr,
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                        },
                        label: Text('check'.tr),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                              )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
