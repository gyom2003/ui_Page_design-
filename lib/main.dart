import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exercice_ui/Customisation Scripts/Clipper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter exo UI',
      theme: ThemeData(
        //fontFamily: 'Playfair Display'
      
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false, //si restant de appbar
            floating: true, 
             stretch: true,
              backgroundColor: Colors.transparent, 
              expandedHeight: 370,
              stretchTriggerOffset: 225,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: SvgPicture.asset('assets/Challenge CSS/images/logo/nature.svg', 
                  width: 60, height: 60,), 
                 onPressed: () => {}),
                 title: Text("", style: TextStyle(color: Colors.white)), 
                 actions: <Widget>[
                   Container(
                     padding: EdgeInsets.all(5), 
                    child:  Text("Nos meilleurs ventes", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.5))
                   ), 

                   Container(
                    padding: EdgeInsets.all(5), 
                    child:  Text("Nos plantes ", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.5))
                  )
                 ],
                 flexibleSpace: FlexibleSpaceBar(
                   title: Text("Nature et moi meilleur que le chocolat.", 
                      style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)
                      )),
                      centerTitle: false,
                      stretchModes: <StretchMode> [
                        StretchMode.zoomBackground, 
                        StretchMode.fadeTitle, 
                        StretchMode.blurBackground, 
                      ],
                      //ajout de l'image dans le background 
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget> [
                          ClipShadowPath(
                            clipper:  CircularClipper(), 
                            shadow: Shadow(blurRadius: 25.0),
                            child: Image(
                              image: AssetImage('assets/Challenge CSS/images/bg.jpg'), 
                              fit: BoxFit.fill, 
                            ),
                          ), 
                     
                        ],
                      ),
                 ),
             // direction: Axis.horizontal, 
             // alignment: WrapAlignment.spaceAround, 
          ), 
          SliverList(
            delegate: SliverChildListDelegate([
              
                  SliverBody(),
                
              


              //à revoire
            ])
          )
        ],
      )
    );
  }
}

class SliverBody extends StatefulWidget {
  @override
  _SliverBodyState createState() => _SliverBodyState();
}

class _SliverBodyState extends State<SliverBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
    
      children:<Widget> [
        Container( 
        width: 300,
        height: 500,
        // decoration: BoxDecoration(
        //   color: Color(0xffF8F8FF),
        // ),
        child: Wrap(
          direction: Axis.horizontal, 
          alignment: WrapAlignment.spaceAround, 
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                //pour les icones et le texte 
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0), 
                    child: SizedBox(
                      height: 100, 
                      width: 100, 
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.button, 
                          text: "Retrait en magazin avec contacte     ", 
                          children: [
                             WidgetSpan(
                               alignment: PlaceholderAlignment.bottom,
                              child: IconButton(
                                icon: SvgPicture.asset("assets/Challenge CSS/images/logo/store.svg", 
                                color: Color(0xffADD981), 
                               ), 
                                onPressed: () => {

                                },
                              )
                            )
                           
                          ]
                        ),
                        ), 
                    ),
                  ),
                

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0), 
                    child: SizedBox(
                      height: 100, 
                      width: 100, 
                      child:  RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.button, 
                          text: "Retrait en magazin sans contacte     ", 
                          children: [
                             WidgetSpan(
                               alignment: PlaceholderAlignment.bottom,
                              child: IconButton(
                                icon: SvgPicture.asset("assets/Challenge CSS/images/logo/box.svg", 
                                color: Color(0xffADD981), 
                               ), 
                                onPressed: () => {
                                },
                              )
                            )
                           
                          ]
                        ),
                        ), 
                    ),
                  ),
                
               
                
              ],
            ),
             //deuxième titre
            Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0, bottom: 40.0)
                      ),
                      //ajout titre 1
                      TitleBody(),
                    ],
                  ),
          ],
        ),

      ),
      ]
    );
  }
}

class TitleBody extends StatefulWidget {
  @override
  _TitleBodyState createState() => _TitleBodyState();
}

class _TitleBodyState extends State<TitleBody> {
  List <String> titlebody  = ["Nos meilleurs ventes", "Nos plantes", ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 280, 
      //premier titre
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: 1, 
        itemBuilder: (context, index) => buildText(index),
      ) ,
      
    );
  }

  Widget buildText(int index)  {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              titlebody[0], 
              style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(fontSize: 20,
               color: selectedindex == index ? Colors.black : Colors.black26,
               fontWeight: FontWeight.bold)
               )
              ),
            //ajout bar 
            Container(
              margin: EdgeInsets.only(top: 10), 
              height: 5, 
              width: 60, 
              color: selectedindex == index ? Colors.lightGreen :  Colors.transparent,
              decoration: BoxDecoration(

              )
              
            )
          ],
        ),
      ),
    );

  }
}