import 'package:deliveryman_app/common/global_widgets/custom_shimmer.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:flutter/material.dart';

class SimmerContainer extends StatelessWidget {
  const SimmerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}


class CategoryCardShimmer extends StatelessWidget {
  const CategoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 75,
            width: 75,
            child: CustomShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                   
                    children: [
                    Container(
                      height: 30,
                      width: 50,
                      color: Colors.white,
                    ),
                    SizedBoxSpace.h10,
                    CustomShimmer(
                      color: Colors.redAccent,
                      child: Container(
                        height: 8,
                        width: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],),
                ),
              ),
            ),
          ),
      
        ],
      ),
    );
  }
}


class GridTypeProductCardShimmer extends StatelessWidget {
  const GridTypeProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: SizedBox(
        height: 250,
        width: MediaQuery.sizeOf(context).width/2.3,
        child: CustomShimmer(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          duration: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 12,
                    width: 100,
                    color: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 16,
                    width: 150,
                    color: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomShimmer(
                    color: const Color.fromARGB(255, 255, 164, 156),
                    child: Container(
                      height: 12,
                      width: 80,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ListTypeProductCardShimmer extends StatelessWidget {
  const ListTypeProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shimmer for Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CustomShimmer(
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
      
                // Shimmer for Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shimmer for Title
                      CustomShimmer(
                        child: Container(
                          width: double.infinity,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 4),
      
                      // Shimmer for Subtitle
                      CustomShimmer(
                        child: Container(
                          width: 120,
                          height: 14,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(height: 8),
      
                      // Shimmer for Price and Old Price
                      CustomShimmer(
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 16,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 50,
                              height: 14,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Shimmer for Add to Cart Icon
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child:  Icon(Icons.add_shopping_cart_sharp, color: Theme.of(context).primaryColor.withOpacity(0.1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
