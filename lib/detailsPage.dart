import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  //declaring the variables that were sent from the main screen
  final heroTag;
  final foodName;
  final foodPrice;
  final foodWeight;
  final foodCalories;
  final foodFat;
  final foodCarbs;
  final foodProtein;
  DetailsPage({this.heroTag, this.foodName, this.foodPrice,this.foodCalories,this.foodCarbs,this.foodFat,this.foodProtein,this.foodWeight});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

//this is the alert dialog that is the same from the main page
  Future<void> _ComingSoon(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Coming Soon')),
          content: Container(height: 100,
            child: Column(
              children: <Widget>[
                const Text("This can be implemented in the future for basket / checkout"),
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

  //this will be the first selected card that again could have more information about the product if they clicked on it(such as what type of fats etc)
  var selectedCard = 'WEIGHT';

  //this will be used for setting the quantity
  int numbers = 0;

  //this will be used for setting the price
  double price = 0.0;

  //this is the main layout for the details page
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: Colors.lightBlueAccent[200],
      //the appbar is used to give some information about what page the user is looking at and the ability to go back
        //the appbar is fixed to the top at all times
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Icon(Icons.arrow_back_ios,size:30),
            ),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Nutrient Description',
              style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white)),
          centerTitle: true,

        ),
        //this is creating a list with the information that was passed from the main page
        body: ListView(children: [
          Stack(children: [
            //making the container be lower to make it look better
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                //so to is this container and thsi is using a curve radius on both the left and right side
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                //the hero is the image that is declared from the previous section
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0))),

            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    //Using the widget.foodname gets the name that was sent from the previous screen and then declared within this class
                    Text(widget.foodName,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //using ${} will allow for the calling the name directly into the string (using $ alone wont work)
                        Text("\£ ${widget.foodPrice}",
                            style: TextStyle(

                                fontSize: 20.0,
                                color: Colors.grey)),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),

                        //this section from lines 115 to 168 are about the adding and removing of items (for now we set this to zero for demonstration purposes)
                        //but in the future it will link from the cart
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: Color(0xFF7A9BEE)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                //this is the functionality of the minus button to ensure the user does not go below 0
                                onTap: () {
                                  if(numbers >= 1)
                                    {
                                      setState(() {
                                        numbers = numbers - 1;

                                        price = widget.foodPrice * numbers;

                                      });
                                    }
                                  else
                                    {
                                      print(numbers.toString());
                                    }
                                },
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Color(0xFF7A9BEE)),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              //setting the number of quantities

                              Text(numbers.toString(),
                                  style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 15.0)),

                            //this is the functionality for adding numbers to the quantity
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    numbers = numbers + 1;

                                    price = widget.foodPrice * numbers;

                                    print(numbers.toString());
                                  });
                                },

                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7A9BEE),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),


                    SizedBox(height: 20.0),
                    //this sets the listview and the height of the container that stores the information
                    //also as you can see it is calling directly the name of the value
                    Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard('WEIGHT', widget.foodWeight, 'Grams'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('CALORIES', widget.foodCalories, 'CAL'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('TOTAL FAT', widget.foodFat, 'Grams'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('TOTAL CARBS', widget.foodCarbs, 'Grams'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('TOTAL PROTEIN', widget.foodProtein, 'Grams'),
                          ],
                        )
                    ),
                    SizedBox(height: 20.0),

                    //this is the button for showing the amount it will cost and would link to the checkout page
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 65,

                        //I am using a flatbutton as this is good to show an icon with text side by side
                        child: FlatButton.icon(
                          //again when on pressed is clicked it will just inform the user that it is coming
                          onPressed: () => {_ComingSoon(context)},
                          color: Colors.lightBlueAccent[200],

                          icon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
                            child: Icon(Icons.shopping_basket,size: 35,),
                          ), //`Icon` to display
                          label: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text("\£${price.toString()}",style: TextStyle(fontSize: 18),), // text to display, this text will update when the user clicks add on food
                          ), //`Text` to display
                          padding: EdgeInsets.all(10.0),

                        ),

                      ),
                    ),



                  ],
                ))
          ])
        ]));
  }

  //this is the building of the cards and the animations that go along with it
  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard ?
                  Colors.transparent :
                  Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75
              ),

            ),
            height: 100.0,
            width: 100.0,

            //this sets the cards when they are clicked which could be expanded for example to show more info about the card selected
            //the selected cards will also change colours
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontSize: 12.0,
                          color:
                          cardTitle == selectedCard ? Colors.white : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(

                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ]
            )
        )
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}