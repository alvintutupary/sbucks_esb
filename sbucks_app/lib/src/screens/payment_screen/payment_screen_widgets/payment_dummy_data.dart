import 'package:sbucks/src/models/card_model.dart';

class PaymentDummyData {
  final cards = List<CardModel>()
    ..add(CardModel('Level 1', '1111 1111 1111 1111', true,
        'assets/img/sbuck-card-1.jpg', true, 110110, '18/01/2020 11:16'))
    ..add(CardModel('Level 2', '2222 2222 2222 2222', false,
        'assets/img/sbuck-card-2.jpg', true, 120220, '20/02/2020 11:16'))
    ..add(CardModel('Level 3', '3333 3333 3333 3333', false,
        'assets/img/sbuck-card-3.jpg', false, 130330, '5/06/2020 11:16'))
    ..add(CardModel('Level 4', '4444 4444 4444 4444', false,
        'assets/img/sbuck-card-4.jpg', true, 140440, '12/12/2020 11:16'));
}

PaymentDummyData appBloc = PaymentDummyData();
