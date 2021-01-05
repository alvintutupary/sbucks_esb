import 'package:flutter/material.dart';

class RegisterAgreement extends StatelessWidget {
  static const kRouteName = '/agreement';
  final String agreementText = """
GORIDE TERMS OF USE

as of 01 September 2019

We thank you for Your trust in GoRide Service in the Gojek App. Please take Your time to read the whole Terms of Use of GoRide ("GoRide Terms of Use").

This GoRide Terms of Use is an integral part of Gojek Terms of Use. If You use the GoRide Service on the Gojek App, You will be deemed to have read and agreed to the GoRide Terms of Use. Therefore, if You do not agree to part or all of the conditions of the GoRide Terms of Use, please discontinue the use of GoRide Service.

GENERAL TERMS
Unless specifically defined below and in other parts of the GoRide Terms of Use, capital letters used in the GoRide Terms of Use must be interpreted in accordance with the terms in the Gojek Terms of Use.

GORIDE is a transportation service provided by a Driver Partner by using a motorized two-wheeled vehicle (motorbike) to take passengers from the pickup location to the User-specified destination.

Driver Partner is a third party-independent Service Provider that agrees to become Our partner, cooperate with Us with a partnership scheme, and is not Our employees, agents or representatives.

 

TERMS OF SERVICE
You must provide complete and accurate information regarding the complete pick-up address and destination specified by the User who will use GoRide Service.
Passengers are prohibited from carrying items that are prohibited or that are not in accordance with the applicable laws and regulations, including but not limited to illegal or dangerous items such as narcotics, illegal drugs or hazardous materials and items that weigh more than the dimensions or capacity two-wheeled vehicles driven by Driver Partner.
GoRide service is not a service for sending goods or instant couriers. If You intend to use the service for the purpose of sending goods or instant courier, You can use GoSend or GoBox Service.
If the Driver Partner drives the vehicle in a way that endangers others, You can notify Us through the channel as stipulated in the Gojek Terms of Use.
Passengers are responsible for their own safety. Therefore, passengers must wear helmets while traveling using GoRide Service. You understand that You are required to maintain the number of passengers in accordance with the carrying capacity of two-wheeled vehicles driven by Driver Partner. The Driver Partner has the right to reject or cancel Your GoRide Service order if the Driver Partner knows that the number of passengers will exceed the carrying capacity of two-wheeled vehicles.
Fees of the GoRide Service’s performance (“User Fee”) will be offered and displayed on the Gojek App before You use GoRide Service. You understand and acknowledge that We can change the offer and/or updates the User Fee offered to You from time to time based on factors, including location, time, applicable laws and regulations. If there are other costs incurred during the provision of GoRide Service for You, including but not limited to toll fees and parking fees, then You are fully responsible for these costs and the Driver Partner has the right to request reimbursement of these other costs of Yours.
Payment of other fees as referred to in number 2(g) can be made in cash or paid through other payment features available in the Gojek App.
 

LEFT GOODS
Goods left behind on the Driver Partner's vehicle are not Our responsibility. We do not provide safekeeping services in any form from passengers.
If the Driver Partner hands over the goods left behind to Us, the User can retrieve items that are left behind within 30 (thirty) business days from the date of the transaction between the User and the Driver Partner in Our nearest office ("Period of Goods Retrieval"). If the item left behind is not retrieved during the Period of Goods Retrieval, then the passing of the Period of Goods Retrieval is Your express statement that the goods has been transferred and handed over to Us and therefore We have the right to, without Your prior consent, take actions that We deem appropriate for the goods (including but not limited to donating, selling, destroying or disposing of the goods).
In the event that the goods left behind is not Your property, if after the expiration of the Period of Goods Retrieval we understand that the item goods behind will not be taken, You are deemed to have wanted the ownership of the goods left behind to Us as provided for in this Article. The transfer of goods is Your responsibility and the relationship between You and the owner of the goods left behind.
 

USER’S REPRESENTATION AND WARRANTY
The representations and warranties of the User as stipulated in this Article 4 are in addition to the representations and warranties provided for the User as contained in the Gojek Terms of Use. There are no provisions in this Article 4 that reduce or limit the applicability of the representations and warranties provided by the User in the Gojek Terms of Use.
You represent and warrant that You know and understand the risk of driving when providing GoRide Services, including but not limited to the possibility of an accident involving passengers and/or Driver Partner.
In the event that loss or problems occurred when You experience during the provision of GoRide Service, including due to an accident caused by the Driver Partner's negligence or traffic violation, We may, with Our best efforts, help bring You together with the relevant Service Provider in seeking solutions for the problem. We do not have any liability for any problems or disputes that arise between You and the Driver Partner, including taking legal action deemed necessary by You or the Driver Partner.
Without prejudice to the provisions of Article 4(d) above, We care about passenger safety and, at Our sole discretion, We are cooperating with the third party insurance provider to provide insurance coverage to all passengers using GoRide Service. For more information on the insurance provided by the third party insurance provider, You can access it through https://www.gojek.com/blog/asuransi/.
For the avoidance of doubt, We don’t act as an agent or representative of a third-party insurance service provider and not a party to the insurance agreement between You and the third party insurance provider.

The Driver Partner has the right to refuse Your GoRide Service request if the Driver Partner has reasonable reasons to suspect that You have, or by accepting Your request, you will violate the GoRide Terms of Use, the Gojek Terms of Use or applicable laws and regulations.
How to Contact Us
You can contact us by e-mail to the following address: customerservice@gojek.com or by telephone to number (021) 5025-1110. All Your correspondence will be recorded and stored for Our records.
""";

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          agreementText,
          textAlign: TextAlign.justify,
        ),
      ),
    );
    // return SafeArea(
    //     child: new Scaffold(
    //         appBar: new AppBar(
    //           title: const Text('Agreement'),
    //           actions: [
    //             new FlatButton(
    //                 onPressed: () {
    //                   Navigator.of(context).pop('User Agreed');
    //                 },
    //                 child: new Text('AGREE',
    //                     style: Theme.of(context)
    //                         .textTheme
    //                         .subtitle1
    //                         .copyWith(color: Colors.white))),
    //           ],
    //         ),
    //         backgroundColor: Colors.white,
    //         body: SingleChildScrollView(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               agreementText,
    //               textAlign: TextAlign.justify,
    //             ),
    //           ),
    //         )));
  }
}
