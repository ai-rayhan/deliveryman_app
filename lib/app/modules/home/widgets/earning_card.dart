
import 'package:deliveryman_app/common/global_widgets/custom_card.dart';
import 'package:flutter/material.dart';

class EarningsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      // color: Colors.deepPurpleAccent.shade100,
      color: Color(0xff007f3a),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance_wallet, color: Colors.white),
                SizedBox(width: 8),
                Text('Balance', style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '\$0.00',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Today', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('\$0.00', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Text('This Week', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('\$0.00', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Text('This Month', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('\$0.00', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
