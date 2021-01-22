import 'package:flutter/material.dart';

import 'package:sbucks/src/models/payment_bank_model.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/screens/payment_virtual_account_screen/payment_virtual_account_screen/payment_virtual_account_detail.dart';

final _banks = List<ModelBank>()
  ..add(ModelBank(
    'assets/img/bank BCA.JPG',
    'BCA',
    List<ModelBankMethod>()
      ..add(ModelBankMethod(
          'ATM BCA',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'Klik BCA',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'BCA Mobile',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit')))),
  ))
  ..add(ModelBank(
    'assets/img/bank BNI.JPG',
    'BNI',
    List<ModelBankMethod>()
      ..add(ModelBankMethod(
          'ATM BNI',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'Klik BNI',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'BNI Mobile',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit')))),
  ))
  ..add(ModelBank(
    'assets/img/bank MANDIRI.JPG',
    'MANDIRI',
    List<ModelBankMethod>()
      ..add(ModelBankMethod(
          'ATM MANDIRI',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'Klik MANDIRI',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'MANDIRI Mobile',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit')))),
  ))
  ..add(ModelBank(
    'assets/img/bank BRI.JPG',
    'BRI',
    List<ModelBankMethod>()
      ..add(ModelBankMethod(
          'ATM BRI',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'Klik BRI',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit'))))
      ..add(ModelBankMethod(
          'BRI Mobile',
          List<ModelBankMethodStep>()
            ..add(ModelBankMethodStep('', '1.  Ambil Kartu'))
            ..add(ModelBankMethodStep('', '2.  Masukan Kartu'))
            ..add(ModelBankMethodStep('', '2.  Ambil Duit')))),
  ));

class PaymentVirtualAccountScreen extends StatefulWidget {
  static const kRouteName = '/PaymentVirtualAccountScreen';
  @override
  _PaymentVirtualAccountScreenState createState() =>
      _PaymentVirtualAccountScreenState();
}

class _PaymentVirtualAccountScreenState
    extends State<PaymentVirtualAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _banks != null || _banks.length > 0
            ? Container(
                child: ListView.builder(
                itemCount: _banks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(_banks[index].imageUri),
                    title: Text(
                      '${_banks[index].bankName}',
                      style: TextStyle(
                        fontSize: 15.scs,
                      ),
                    ),
                    subtitle: Text(
                      'Pay from ${_banks[index].bankName} ATM or Internet Banking.',
                      style: TextStyle(
                        fontSize: 12.scs,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {
                        // Navigator.pushNamed(context, PaymentBank.kRouteName,
                        //     arguments: _banks[index]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PaymentVirtualAccounDetail()));
                      },
                    ),
                  );
                },
              ))
            : Center(
                child: Padding(
                  padding: EdgeInsets.all(10.scs),
                  child: Text(
                    'Please click "TOP UP" in the Pay Tab to create your first Virtual Account',
                    style: TextStyle(
                      fontSize: 15.scs,
                    ),
                  ),
                ),
              ));
  }
}
