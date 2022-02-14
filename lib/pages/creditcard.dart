import 'package:BusStop/Screens/navBar.dart';
import 'package:BusStop/backends/ccData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:credit_card_validator/credit_card_validator.dart';

class CreditCard extends StatefulWidget {
  @override
  CreditCardState createState() => CreditCardState();
}

class CreditCardState extends State<CreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String errorText = '';
  bool isCvvFocused = false;
  double points = ((CCData.price / 100) * 5) / 100;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreditCardValidator _creditCardValidator = CreditCardValidator();
  bool isValid = false;
  void validateCC() {
    var ccNumResults = _creditCardValidator.validateCCNum(cardNumber);
    var expDateResults = _creditCardValidator.validateExpDate(expiryDate);
    var ccvResults =
        _creditCardValidator.validateCVV(cvvCode, ccNumResults.ccType);

    if (ccNumResults.isValid && expDateResults.isValid && ccvResults.isValid) {
      isValid = true;
      print('valid card');
    } else {
      isValid = false;
      print('invalid card');
    }
  }

  Future<void> _showDialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Successful'),
            content: SingleChildScrollView(
              child: Text(
                  'Your ticket is booked successfully and you have earned ${points.toString()} points.'),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NavBar()));
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Color(0xffbF4511E),
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: const Color(0xffbF4511E),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                        onPressed: () {
                          validateCC();
                          if (formKey.currentState.validate() &&
                              isValid == true) {
                            CCData.getCCData(cardNumber, cvvCode, expiryDate,
                                cardHolderName);

                            print('valid!');
                            _showDialog();
                          } else {
                            print('invalid!');
                            setState(() {
                              errorText = 'Invalid credit card!';
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        errorText,
                        style: TextStyle(color: Color(0xffbF4511E)),
                      )
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

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
