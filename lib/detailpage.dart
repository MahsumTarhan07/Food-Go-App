import 'package:flutter/material.dart';
import 'Foods.dart';

class DetailFoods extends StatefulWidget {

  Foods foods;

   DetailFoods(this.foods);

  @override
  State<DetailFoods> createState() => _DetailFoodsState();
}

class _DetailFoodsState extends State<DetailFoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.foods.food_name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/food_images/${widget.foods.food_images_name}"),
              Text("${widget.foods.food_price} \u{20BA}", style: TextStyle(fontSize: 40,color: Colors.blue),),
              SizedBox(
                width: 200, height: 50,

                child: RaisedButton(
                  child: Text("Sipariş Et"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    print("Odeme Sayfasisi");
                  },
                ),
              )
            ],
          ),
        )

    );
  }
}
