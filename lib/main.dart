import 'package:flutter/material.dart';
import 'package:food_go_app/detailpage.dart';
import 'Foods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Go',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Foods>> foodGet() async{
    var foodList = <Foods>[];
    var f1 = Foods(1, "Etli Nohut", "etlinohut.jpg", 55.99);
    var f2 = Foods(2, "Yaprak Sarma", "yapraksarma2.jpg", 40.99);
    var f3 = Foods(3, "Patates Kızartma", "patateskizartma3.jpg", 70);
    var f4 = Foods(4, "Ayran", "ayran4.jpg", 3.50);
    var f5 = Foods(5, "Salgam Suyu " ,"salgamsuyu5.jpg", 10);
    var f6 = Foods(1, "Meyve Suyu", "meyvesuyu6.jpg", 12);

    foodList.add(f1);
    foodList.add(f2);
    foodList.add(f3);
    foodList.add(f4);
    foodList.add(f5);
    foodList.add(f6);

    return foodList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Go",style: TextStyle(fontSize: 26,color: Colors.white),),
      ),
      body: FutureBuilder<List<Foods>>(
        future:  foodGet(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var foodsLists = snapshot.data;
            
            return ListView.builder(
              itemCount: foodsLists!.length,
              itemBuilder: (context,indexs) {
                var foods = foodsLists[indexs];

                return  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailFoods(foods) ));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            width: 150,
                            height: 135,
                            child: Image.asset("assets/food_images/${foods.food_images_name}",)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foods.food_name,style: TextStyle(fontSize: 25,),),
                            SizedBox(height: 40,),
                            Text("${foods.food_price} \u{20BA}",style: TextStyle(fontSize: 23,color: Colors.blue),),
                          ],
                        ),
                        Spacer(),
                        Icon((Icons.keyboard_arrow_right),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },

      )

    );
  }
}
