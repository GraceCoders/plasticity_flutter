import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:plasticity/components/default_button.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:plasticity/config/colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          'Payment',
          style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w700),
        ),
        actions: [

        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.8,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffF2F4F5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0 , right: 20 , top: 20 , bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Selected Plan',
                      style: AppTextStyle.poppins(fontSize: 16 ,fontColor: kDarkBlack, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Change',
                      style: AppTextStyle.poppins(fontSize: 14 ,fontColor: kColorPrimary, fontWeight: FontWeight.w400),

                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(left: 10 , right: 10 , top: 20),
                decoration: BoxDecoration(

                    border: Border.all(color: kColorPrimary , width: 1 ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: [
                    Text(
                      'Advance',
                      style: AppTextStyle.poppins(fontSize: 18 ,fontColor: kDarkBlack, fontWeight: FontWeight.w700),

                    ),
                    SizedBox(height: 10,),
                    Text(
                      '\$8.99/month',
                      style: AppTextStyle.poppins(fontSize: 18 ,fontColor: kColorPrimary, fontWeight: FontWeight.w500),

                    ),
                  ],
                ),
              )
            ],
          ),
        ),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 3 , top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15 , top: 10),
                      child: Text(
                        'Card Details',
                        style: AppTextStyle.poppins(fontSize: 16 ,fontColor: kDarkBlack, fontWeight: FontWeight.w700),

                      ),
                    ),
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.black,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Card number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'MM/YY',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: border,
                        enabledBorder: border,
                        hintText: 'Enter your name on card',
                        labelText: 'Name',
                      ),
                     // onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    DefaultButton(
                      title: 'Pay',
                      press: (){
                        if (formKey.currentState.validate()) {
                          print('valid!');
                        } else {
                          print('invalid!');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
