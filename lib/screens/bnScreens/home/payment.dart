import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:lowbill/widgets/custom_button.dart';

import 'package:lowbill/widgets/custom_text_feild.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  @override
  void initState() {
    // TODO: implement initState
     
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar:   AppBar(
    
    iconTheme: IconThemeData(),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Payment Page' , style: TextStyle(color: Colors.teal, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
      ),

      body: ListView(
        children: [
          CreditCardWidget(
                cardBgColor: Colors.blue,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true, onCreditCardWidgetChange: (CreditCardBrand ) {  },
              ),
          CreditCardForm(
          formKey: formKey, // Required 
          onCreditCardModelChange: (CreditCardModel data) {}, // Required
          themeColor: Colors.red,
          obscureCvv: true, 
          obscureNumber: true,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
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
          ), cardHolderName: '', cardNumber: '', cvvCode: '', expiryDate: '',
    ),

    Padding(
      padding: const EdgeInsets.all(40.0),
      child: CustomButton(onPress: (){

        Navigator.pushNamed(context, '/confirm');
      }, text: 'Confirm', color: Color(0xffF59A23)),
    )
        ],
      ),
    );
  }
}