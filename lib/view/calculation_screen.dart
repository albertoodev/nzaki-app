import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/calculation_controller.dart';
import '../utils/data/global_data.dart';
import '../view/about.dart';
import '../widgets/widgets.dart';

class CalculationScreen extends StatelessWidget {
  final int id;
  final _formKey=GlobalKey<FormState>();
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
              Get.to(()=>About(title: zakatTypes[id].name.tr, content: 'aboutText1'));
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
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Text("${'nisab'.tr} :"),
                        title: Text(
                          '${zakatTypes[id].nisab}',
                          textAlign: TextAlign.center,
                        ),
                        trailing: Text(zakatTypes[id].unity!.tr),
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
                                return zakatTypes[id].functions['validate']!(value,globalController.radioValue.value);
                              } catch(e){
                                print('mzl mahatitch kaml validate functions xD');
                              }
                            },
                            onSaved: (value){
                              try{
                                globalController.getResult(input: double.parse(value!), itemId: id);
                              } catch(e){
                                print('mzl mahatitch kaml save functions xD');
                              }

                            },
                          ),
                        ),
                        trailing: Text(zakatTypes[id].unity!),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if(zakatTypes[id].list!=null)...zakatTypes[id].list!.map(
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
                  child: ListTile(
                    leading:Text(
                        '${'result'.tr} :'
                    ),
                    title:GetX<CalculationController>(builder: (controller)=> Text(
                      controller.result.value,
                      style: Get.theme.textTheme.headline5,
                      textAlign: TextAlign.center,
                    )),
                    trailing: Text(zakatTypes[id].unity!.tr),
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
