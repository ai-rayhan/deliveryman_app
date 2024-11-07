import 'package:deliveryman_app/app/modules/order/domain/entities/order.dart';
import 'package:deliveryman_app/app/modules/order/screens/running_order.dart';
import 'package:deliveryman_app/helper/get_currency.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderDetail});
  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(getFullImageUrl(orderDetail.productImage)),
            radius: 25,
          ),
          const SizedBox(width: 10),
          // Use Flexible to prevent overflow
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderDetail.productTitle,
                  style: robotoMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    if(orderDetail.productSize != null)
                    Text(
                      "Size: ${orderDetail.productSize}",
                      style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
                    ),
                    if(orderDetail.productSize != null)
                    const SizedBox(width: 10),
                    if(orderDetail.productColor != null)
                    Text(
                      "Color: ${orderDetail.productColor}",
                      style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  "Price: ${orderDetail.productPrice.toCurrency()}",
                  style: robotoMedium,
                ),
              ],
            ),
          ),
          // Trailing column with quantity and total
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Quantity: ${orderDetail.productQty}"),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  "Total: ${orderDetail.subTotal.toCurrency()}",
                  style: robotoBold.copyWith(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
