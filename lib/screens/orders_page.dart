import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: const Text(
          'Orders ',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Merr',
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),

      body: ListView.builder(
      itemCount:10,
      itemBuilder: ((context, index) {
        
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 2,color: Color(0xffF59A23) ),
                         ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: const[
                                     Text(
                                      'Customer Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                         fontWeight: FontWeight.bold,
                                          fontFamily: 'Merr',
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text('Test',
                                        style: TextStyle(color: Colors.black , fontFamily: 'Merr',fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                              ),
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

                                  
                              const SizedBox(
                                height: 7,
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
    })
    ));
  }
}