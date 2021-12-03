
final List<Map<String,Function>> zakatFunctions = [
  // zakat on money
  {},


  //zakat on cattle
  {
    'result': ({
      required int radioValue,
      required double input,
    }){
      return '00';
    },
    'validate': (String? value, int radioValue) {
      try {
        double input = double.parse(value!);
        if (input <= 0) {
          return 'value can not be zero or negative ';
        } else {
          if (radioValue == 2) {
            if (input < 400) {
              return 'value can note be less than ' + 400.toString();
            }
          } else {
            if (input < 120) {
              return 'value can note be less than ' + 120.toString();
            }
          }
        }
      } catch (e) {
        return 'enter number positive';
      }
      ;
    },
    'getNisab': (int radioValue) {
      if (radioValue == 2) {
        return '400.0';
      }
      return '120';
    }
  },



  // zakat on gold
  {},


  // zakat on silver
  {},


  // zakat on Farm Produce
  {},
];
