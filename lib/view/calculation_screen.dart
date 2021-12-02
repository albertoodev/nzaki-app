import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzakiapplication/controller/calculation_controller.dart';
import 'package:nzakiapplication/models/zakat_type.dart';
import '../config.dart';

class CalculationScreen extends StatelessWidget {
  final ZakatType item;
  final _formKey=GlobalKey<FormState>();
   CalculationScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculationController globalController = Get.put(CalculationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: item.name,
                middleText: 'about text',
              );
            },
            icon: const Icon(
              Icons.info_outlined,
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: backgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Text("${'nisab'.tr} :"),
                        title: Text(
                          '${item.nisab}',
                          textAlign: TextAlign.center,
                        ),
                        trailing: Text(item.unity!),
                      ),
                      ListTile(
                        leading: Text("${'value'.tr} :"),
                        title: Form(
                          key: _formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '0.0',
                            ),
                            validator: (value){
                              try{
                                calculationFunctions[item.id]['validate'](value,globalController.radioValue.value);
                              } catch(e){
                                print('mzl mahatitch kaml validate functions xD');
                              }
                            },
                            onSaved: (value){
                              try{
                                globalController.getResult(input: double.parse(value!), itemId: item.id);
                              } catch(e){
                                print('mzl mahatitch kaml save functions xD');
                              }

                            },
                          ),
                        ),
                        trailing: Text(item.unity!),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if(item.list!=null)...item.list!.map(
                        (type) => ListTile(
                          leading: GetX<CalculationController>(
                            builder: (controller) => Radio<int>(
                              activeColor: Get.theme.primaryColor,
                              value: type['index'],
                              groupValue: controller.radioValue.value,
                              onChanged: (value) {
                                globalController.changeCurrentRadioValue(value!);
                              },
                            ),
                          ),
                          onTap: ()=>globalController.changeCurrentRadioValue(type['index']),
                          title: Text(type['value']),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                          }
                        },
                        label: const Text('check'),
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
                  child: ListTile(
                    leading:const Text("result:"),
                    title:GetX<CalculationController>(builder: (controller)=> Text(
                      controller.result.value,
                      style: Get.theme.textTheme.headline5,
                      textAlign: TextAlign.center,
                    )),
                    trailing: Text(item.unity!),
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
