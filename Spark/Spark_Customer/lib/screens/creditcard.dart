import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:gsu_park/Transitions/ScaleTransition.dart';
import 'package:gsu_park/screens/userInfo.dart';
class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  String cardNumber ="";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused =  false;

  void onModelChange(CreditCardModel model ) {
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Kredi Kartınızı Kaydedin"),
      ),
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
              height: 200,
              width: MediaQuery.of(context).size.width,
              animationDuration: Duration(milliseconds: 1000),

            ),
            new OutlineButton(
              child: Text(
                "Kartınızı kaydetmek için ilerleyin",
                style: TextStyle(
                    color: Colors.blue[700]
                ),
              ),
              onPressed: null,
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
                )
              ),

            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onModelChange,
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  onPressed: (){
                    Navigator.push(context, ScaleRoute(page: UserInfo()));
                  },
                  color: Colors.blue[900],
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Kredi Kartını Kaydet',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        wordSpacing: 4,
                        letterSpacing: 0.3
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

      }

}
