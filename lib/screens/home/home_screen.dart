import 'package:calculadora_app/screens/home/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 46, 55, 1),
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: const Column(
              children: [CalculatorScreen(), CalculatorKeyboard()],
            )),
      ),
    );
  }
}

class CalculatorKeyboard extends ConsumerWidget {
  const CalculatorKeyboard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Function setScreenValue = ref.read(homeProvider).setScreenValue;
    Function clear = ref.read(homeProvider).clear;
    Function sum = ref.read(homeProvider).sum;
    Function calculate = ref.read(homeProvider).calculate;
    Function substraction = ref.read(homeProvider).substraction;
    Function multiplication = ref.read(homeProvider).multiplication;
    Function division = ref.read(homeProvider).division;
    Function percent = ref.read(homeProvider).percent;

    return Flexible(
        flex: 8,
        child: Container(
          width: double.infinity,
          child: Column(children: [
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: CalculatorButton(
                    action: clear,
                    textButton: "C",
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: CalculatorButton(
                    action: percent,
                    textButton: "%",
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: CalculatorButton(
                      action: division,
                      textButton: "/",
                      backgroundColor: Colors.orange[700]),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "7",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "8",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "9",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                      action: multiplication,
                      textButton: "X",
                      backgroundColor: Colors.orange[700]),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "4",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "5",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "6",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                      action: substraction,
                      textButton: "-",
                      backgroundColor: Colors.orange[700]),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "1",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "2",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                    textButton: "3",
                    isNumber: true,
                    action: setScreenValue,
                    backgroundColor: Color.fromARGB(255, 98, 98, 99),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CalculatorButton(
                      action: sum,
                      textButton: "+",
                      backgroundColor: Colors.orange[700]),
                )
              ],
            ),
            Row(children: [
              Flexible(
                flex: 2,
                child: CalculatorButton(
                  textButton: "0",
                  isNumber: true,
                  action: setScreenValue,
                  backgroundColor: Color.fromARGB(255, 98, 98, 99),
                ),
              ),
              Flexible(
                flex: 1,
                child: CalculatorButton(
                  textButton: ".",
                  action: () {},
                  backgroundColor: Color.fromARGB(255, 98, 98, 99),
                ),
              ),
              Flexible(
                flex: 1,
                child: CalculatorButton(
                    action: calculate,
                    textButton: "=",
                    backgroundColor: Colors.orange[700]),
              )
            ])
          ]),
        ));
  }
}

class CalculatorButton extends ConsumerWidget {
  String textButton;
  Color? backgroundColor;
  bool isNumber;
  Function action;
  CalculatorButton(
      {super.key,
      required this.textButton,
      required this.backgroundColor,
      this.isNumber = false,
      required this.action});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeumorphicButton(
      width: double.infinity,
      height: 80,
      child: Center(
          child: Text(
        this.textButton!,
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
      borderRadius: 20,
      bottomRightShadowBlurRadius: 15,
      bottomRightShadowSpreadRadius: 1,
      borderWidth: 5,
      backgroundColor: this.backgroundColor!,
      topLeftShadowBlurRadius: 10,
      topLeftShadowSpreadRadius: 1,
      topLeftShadowColor: Color.fromARGB(143, 32, 32, 32),
      bottomRightShadowColor: Color.fromARGB(115, 34, 34, 34),
      padding: EdgeInsets.all(10),
      bottomRightOffset: Offset(0, 0),
      topLeftOffset: Offset(0, 0),
      onTap: () => {
        if (this.isNumber) {action(textButton)} else {action()}
      },
    );
  }
}

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String screenValue = ref.watch(homeProvider).screenValue;

    double total = ref.watch(homeProvider).total;
    bool totalZero = ref.watch(homeProvider).totalZero;

    return Flexible(
        flex: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.width * 0.08),
                child: SingleChildScrollView(
                  child: totalZero
                      ? Text(screenValue,
                          style: TextStyle(
                            color: const Color.fromARGB(171, 255, 255, 255),
                            fontSize: 20,
                          ))
                      : total != 0
                          ? Text(screenValue,
                              style: TextStyle(
                                color: const Color.fromARGB(171, 255, 255, 255),
                                fontSize: 20,
                              ))
                          : Text(total.toString(),
                              style: TextStyle(
                                color: const Color.fromARGB(171, 255, 255, 255),
                                fontSize: 20,
                              )),
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.05,
                            right: MediaQuery.of(context).size.width * 0.08),
                        child: totalZero && total == 0 && screenValue.length > 0
                            ? Text(
                                total.toString(),
                                style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            : total == 0 && screenValue.length > 0
                                ? Text(
                                    screenValue,
                                    style: TextStyle(
                                        fontSize: 45,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    total.toString(),
                                    style: TextStyle(
                                        fontSize: 45,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))))
          ],
        ));
  }
}
