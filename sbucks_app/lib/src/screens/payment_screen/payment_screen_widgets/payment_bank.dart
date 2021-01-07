import 'package:flutter/material.dart';
import 'package:sbucks/src/models/payment_bank_model.dart';

class PaymentBank extends StatefulWidget {
  static const kRouteName = '/paymentBank';
  final ModelBank modelBank;

  PaymentBank({
    @required this.modelBank,
  });
  @override
  _PaymentBankState createState() => _PaymentBankState();
}

class _PaymentBankState extends State<PaymentBank> {
  int _selectedMethod;

  @override
  void initState() {
    _selectedMethod = 0;
    super.initState();
  }

  @override
  void dispose() {
    _selectedMethod = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'amount',
                      style: TextStyle(color: Colors.green[500]),
                    ),
                    Text('Rp. 100,000',
                        style:
                            TextStyle(color: Colors.green[500], fontSize: 30)),
                  ],
                ),
                Divider(
                  color: Colors.green[500],
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order ID',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      'ID12049029XDS1II200',
                      // style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Text('Account number'),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Text('Account number'),
                Text('39299752234'),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: widget.modelBank.modelBankMethod.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('How to pay'),
                  actions: [Image.asset(widget.modelBank.imageUri)],
                  bottom: TabBar(
                    labelColor: Color(0xff006442),
                    indicatorColor: Color(0xff006442),
                    tabs: widget.modelBank.modelBankMethod
                        .map((items) => Tab(
                              text: items.method,
                            ))
                        .toList(),
                    onTap: (index) {
                      setState() {
                        _selectedMethod = index;
                      }
                    },
                  ),
                ),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  // children: widget.modelBank.modelBankMethod.map((methods) {
                  //   return Text(methods.method);
                  // }).toList(),
                  children: widget.modelBank.modelBankMethod
                      .map(
                        (methods) => Expanded(
                          child: ListView.builder(
                            itemCount: methods.modelBankMethodStep.length,
                            itemBuilder: (context, ind) {
                              return ListTile(
                                title: Text(
                                    methods.modelBankMethodStep[ind].content),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
