// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';

class UnitPriceWidget extends StatefulWidget {
  int amount = 0;
  final double price = 1200.0;
  double cost = 0.0;

  UnitPriceWidget({Key? key}) : super(key: key);

  @override
  State<UnitPriceWidget> createState() => _UnitPriceWidgetState();
}

class _UnitPriceWidgetState extends State<UnitPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(5),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'United Pound '),
                TextSpan(
                  text: '(max count )',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // TextSpan(
                //   text: '',
                //   style: TextStyle(fontSize: 12),
                // ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset.zero,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.amount < 20
                    ? () {
                        // Increment the button
                        setState(() {
                          widget.amount++;
                          widget.cost = widget.price * widget.amount;
                        });
                      }
                    : null,
                child: const Icon(
                  Icons.add_circle_outline,
                  size: 50,
                  color: AppColors.meats,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.amount.toString(),
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                          const TextSpan(
                            text: 'lbs.',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.amount > 0
                    ? () {
                        setState(() {
                          widget.amount--;
                          widget.cost = widget.price * widget.amount;
                        });
                      }
                    : null,
                child: const Icon(
                  Icons.remove_circle_outline,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Price'),
                    TextSpan(
                      text: ' ₦${widget.price} / lb',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                '₦${widget.cost}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
