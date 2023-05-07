import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late ScrollController _scrollController;

  List allSlides = [
    {'slideName' : 'slideOne', 'selected' : false},
    {'slideName' : 'slideTwo', 'selected' : false},
    {'slideName' : 'slideThree', 'selected' : false},
    {'slideName' : 'slideFour', 'selected' : false},
    {'slideName' : 'slideFive', 'selected' : false},
    {'slideName' : 'slideSix', 'selected' : false},
    {'slideName' : 'slideSeven', 'selected' : false},
    {'slideName' : 'slideEight', 'selected' : false},
    {'slideName' : 'slideNine', 'selected' : false},
  ];

  var selectedSlide;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((changeSelector));
    setState(() {
      selectedSlide = allSlides[0];
      selectedSlide['selected'] = true;
    });
  }
  changeSelector(){
    var maxScrollvalue = _scrollController.position.maxScrollExtent;

    var scrollValue = _scrollController.offset.round();
    // print(scrollValue);

    var divisor = (maxScrollvalue/allSlides.length)+20;
    print('h: $divisor');

    var slideValue = (scrollValue / divisor ).round();
    print('sv : $slideValue');

    var currentSlide = allSlides.indexWhere((slide) => slide['selected']);

    setState(() {
      allSlides[currentSlide]['selected'] = false;
      selectedSlide = allSlides[slideValue];
      selectedSlide['selected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Trick'),
      ),
      body: Row(
        children: <Widget>[
          SizedBox(width: 15, child: Text('공백', style: TextStyle(color:
          Colors.white38),),),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: ListView(
              children: allSlides.map((element) {
                return getTitles(element);
              }).toList()
            ),
          ),
          SizedBox(width: 10, child: Text('공백2', style: TextStyle(color:
          Colors.white38),),),
          Container(
            width: (MediaQuery.of(context).size.width / 3) * 2 - 25,
            child: ListView(
              controller: _scrollController,
              children: allSlides.map((element){
                return getCards(element);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  scrollToSlide(inputSlide){
   var whichSlide = allSlides.indexWhere((slide) => slide['slideName'] == inputSlide['slideName']);

   var maxScrollValue = _scrollController.position.maxScrollExtent;

   var divisor = (maxScrollValue / allSlides.length) + 20;

   var scrollToValue = whichSlide * divisor;

   // _scrollController.jumpTo(scrollToValue);
   _scrollController.animateTo(scrollToValue,
       curve: Curves.easeInOut, duration: Duration(milliseconds: 1000));
  }

  Widget getTitles(slide) {
    return InkWell(
      onTap: () {
        scrollToSlide(slide);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          slide['slideName'],
          style: TextStyle(
              fontWeight: slide['selected'] ? FontWeight.bold : FontWeight.normal
          ),
        ),
      ),
    );
  }

  Widget getCards(slide) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1
          )
        ),
        height: 200,
        width: 150,
        child: Center(
          child: Text(
            slide['slideName'],
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
