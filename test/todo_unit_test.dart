import 'package:flutter_test/flutter_test.dart';
import 'package:uwtests/form_validate.dart';

void main() {
  group("Todo validate", () {
    test("TodoName validate", () {
      expect(FormValidate.todoValidate("Cook Meat"), isNull);
    });

    test("TodoName validate", () {
      expect(FormValidate.todoValidate(""), "Todo is not empty!");
    });
  });
}
