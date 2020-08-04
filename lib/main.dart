import 'package:flutter/material.dart';
import 'package:nutriapp/Home.dart';
import 'package:nutriapp/detailsPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  //this is an alert dialog that will only show when the user clicks on a certain button or item
  Future<void> _ComingSoon(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Coming Soon')),
          content: Container(height: 100,
              child: Column(
                children: <Widget>[
                    const Text("This can be implemented in the future "),
                      SizedBox(height: 10,),
                  Center(child: Icon(Icons.tag_faces,size: 35,)),
                ],
        ),
          ),
          actions: <Widget>[

          ],
        );
      },
    );
  }

//this number will be used to set how many items are in the basket
  int number = 0;


  //main screen layot
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Lines 61 to 126 are for the top navigation bar, this is the icons that will be used to navigate within the application and set their features
      backgroundColor: Colors.lightBlueAccent[200],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: IconButton(
                    icon: Icon(Icons.home,size: 35,),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>HomeScreen()
                        ),
                      );

                    },
                  ),
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list,size: 35,),
                          color: Colors.white,
                          onPressed: () {
                            _ComingSoon(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.menu,size: 35,),
                          color: Colors.white,
                          onPressed: () {_ComingSoon(context);},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text("What's on the",
                    style: TextStyle(
                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                //One text item to be more bold to stand out
                Text('MENU?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),

          //sized box to set some height between items
          SizedBox(height: 40.0),

          //this container is setting the style of the menu , first is to make the container be lower than the screen height
          Container(
            height: MediaQuery.of(context).size.height - 185.0,

            //next is to add some effects to the container and make the border only one section (the left) to have a curve effect
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),

            //next is creating a list of the types of items to show,
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      //again making the container smaller so that it will look nice on the screen
                        height: MediaQuery.of(context).size.height - 300.0,

                        //for the list view I am using static images with prices , this can be added on or taken off , however it would have been better if this could
                        //link to firebase or another database so that it is easier for modifying and adding etc
                        //the _buildfooditem is a widget that will set the layout of how the food should appear to the user
                        child: ListView(children: [
                          _buildFoodItem('assets/chickencurry.png', 'Chicken Curry', 14.99,"269","296","25","86","24"),
                          _buildFoodItem('assets/greeksalad.png', 'Greek Salad', 12.00,"118","320","22","11","19"),
                          _buildFoodItem('assets/hamsandwhich.png', 'Ham Sandwich', 8.35,"300","300","7","42","16"),
                          _buildFoodItem('assets/tacos.png', 'Tacos', 16.00,"69","156","9","14","6"),
                          _buildFoodItem('assets/tomotacheese.png', 'Toasted Cheese', 9.95,"106","366","23","28","12"),
                          _buildFoodItem('assets/SalmonSalad.png', 'Salmon Salad', 15.00,"204","195","10","3.5","21"),
                        ]))),

//this is the bottom navigation bar which is similar to the top
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //I am using a sizedbox as it helps create the height and width I am looking for in terms of the button
                    SizedBox(
                    width: 150,
                      height: 65,
                      //I am using a flatbutton as this is good to show an icon with text side by side
                      child: FlatButton.icon(
                        //again when on pressed is clicked it will just inform the user that it is coming
                            onPressed: () => {_ComingSoon(context)},
                            color: Colors.lightBlueAccent[200],

                            icon: Icon(Icons.shopping_basket,size: 35,), //`Icon` to display
                            label: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                              child: Text(number.toString(),style: TextStyle(fontSize: 18),), // text to display, this text will update when the user clicks add on food
                            ), //`Text` to display
                             padding: EdgeInsets.all(10.0),

                            ),

                      ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  //this is the widget for building the items that were declared earlier, as you can see we need the image path, food name and the price etc in order to build the widget
  Widget _buildFoodItem(String imgPath, String foodName, double price,String weight,String cal,String fat,String carbs,String protien) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        //the inkwell is used to direct to the correct page and set the information relating to the the food in the details page
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price,foodWeight: weight,foodCalories: cal,foodFat: fat,foodCarbs: carbs,foodProtein: protien,)
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                        children: [
                          //the hero is used to show the image in a easy way and look smooth
                          Hero(
                              tag: imgPath,
                              child: Image(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.cover,
                                  height: 75.0,
                                  width: 75.0
                              )
                          ),
                          SizedBox(width: 10.0),
                          //this is where the food items are being declared etc
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                    foodName,
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Text("\£${price.toString()}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey
                                    )
                                )
                              ]
                          )
                        ]
                    )
                ),

                //When a user clicks add it will add it to the basket and keep counting ( This can be modified so that instead we have a clear ID
                //for each item of food which will then be able to go to a summary page and add the prices together and give a final total
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        number = number + 1;
                      });
                    }
                )
              ],
            )
        ));
  }
}
