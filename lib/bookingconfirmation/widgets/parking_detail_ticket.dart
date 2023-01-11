import 'package:flutter/material.dart';
import 'package:parking_user/bookingconfirmation/details/details.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ParkingdetailTicket extends StatelessWidget {
  const ParkingdetailTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Column(
          children: [
            Text('Scan this on the Scanner Machine when \n you are in the Parking'),
             SizedBox(height: 10,),
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                child: Center(
                  child: Container(
                    height: 180,
                    width: 180,
                    child: SfBarcodeGenerator(
                      value: 'https://facebook.com',
                      symbology: QRCode(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Details(
              name: 'Name:',
              details: 'favas',
              name2: 'Vehicle:',
              details2: 'toyota land cruiser (KL 18 AC 2212)',
            ),
            Details(
              name: 'Parking Area:',
              details: 'Hilite Buisness park',
              name2: 'Parking Slot:',
              details2: 'Ground Floor (G06)',
            ),
            Details(
              name: 'Duration',
              details: '2 Hours',
              name2: 'Date',
              details2: 'January 10,2023',
            ),
            Details(
              name: 'Hours',
              details: '6:30 PM - 8:30 PM',
              name2: 'Phone',
              details2: '8156828581',
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 80),
          
            //   child: CustomPaint(painter: DrawDottedhorizontalline(),
          
            //   ),),
            //    Details(
            //     name: 'Vehicle Details:',
            //     details: 'Toyota(AFD 6397)',
            //     name2: 'Vehicle Type:',
            //     details2: 'Luxury seden',
            //   ),
          ],
        ),
      ),
    );
  }
}
