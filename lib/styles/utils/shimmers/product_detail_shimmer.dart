import 'package:flutter/material.dart';

import 'styles/shimmer_shapes.dart';

class Shimmers extends StatelessWidget {
  const Shimmers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     Column(
        children: [
          ShimmerShapes.rectangular(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            shape: const RoundedRectangleBorder(),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShimmerShapes.rectangular(
                height: 40,
                width: 188,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              ShimmerShapes.rectangular(
                height: 40,
                width: 100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ],
          ),
          const SizedBox(
            height: 28.0,
          ),
          const ShimmerShapes.rectangular(
            height: 180,
            width: double.infinity,
            shape: RoundedRectangleBorder(),
          ),
          const SizedBox(
            height: 28.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShimmerShapes.rectangular(
                height: 30,
                width: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              ShimmerShapes.rectangular(
                height: 30,
                width: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              ShimmerShapes.rectangular(
                height: 30,
                width: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              ShimmerShapes.rectangular(
                height: 30,
                width: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ],
          ),
          const SizedBox(
            height: 58.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ShimmerShapes.circular(
                height: 40,
                width: 188,
                shape: CircleBorder(),
              ),
              ShimmerShapes.rectangular(
                height: 55,
                width: 180,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ],
          ),
        ],
  
    );
  }
}
