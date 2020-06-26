import 'package:flutter/material.dart';
class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Quantity'),
                    Row(children:[Icon(Icons.add),
                    Text('Add'),
                    Icon(Icons.remove)],),]),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.favorite),
                        Container(
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.redAccent),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text('Add to Cart'),
                          Text('Rs.199.0')],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                elevation: 10,
                
              ),
            ),

           ] ),
      
    );
  }
}