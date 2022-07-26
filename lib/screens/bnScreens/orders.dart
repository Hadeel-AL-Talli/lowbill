import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount:10,
      itemBuilder: ((context, index) {
        
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2, ),
                         ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              const SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: const[
                                     Text(
                                      'Order Date',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                         fontWeight: FontWeight.bold,
                                          fontFamily: 'Merr',
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text('20/8/2022',
                                        style: TextStyle(color: Colors.black , fontFamily: 'Merr',fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: const[
                                     Text(
                                      'Service',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                         fontWeight: FontWeight.bold,
                                          fontFamily: 'Merr',
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text('Cleaning',
                                        style: TextStyle(color: Colors.black , fontFamily: 'Merr',fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                               Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Service Details ',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                         fontWeight: FontWeight.bold,
                                          fontFamily: 'Merr',
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text('Floor',
                                        style: TextStyle(color: Colors.black , fontFamily: 'Merr',fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Total Price',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                         fontWeight: FontWeight.bold,
                                          fontFamily: 'Merr',
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text('400 sr',
                                        style: TextStyle(color: Colors.black, fontFamily: 'Merr',fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
      );
    }));
  }
}