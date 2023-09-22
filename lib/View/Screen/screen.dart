import 'package:animation/View/Homepage/widget/heart.dart';
import 'package:animation/controller/screenpageprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final vehicle;
  Details({required this.vehicle});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double fontSize = 15.0;
  bool isFontIncreased = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body:
          Consumer<Increassizeprovider>(builder: (context, provider, snapshot) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  child: Image.asset(
                    'lib/assets/${widget.vehicle.img}',
                    height: 360,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  title: Text(
                    widget.vehicle.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[800],
                    ),
                  ),
                  subtitle: Text(
                    '${widget.vehicle.emi} Low Emi For \$${widget.vehicle.price}',
                    style: const TextStyle(letterSpacing: 1),
                  ),
                  trailing: Heart(),
                ),
                GestureDetector(
                  onTap: () {
                    final fontSizeProvider = Provider.of<Increassizeprovider>(
                        context,
                        listen: false);
                    fontSizeProvider.toggleFontSize();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 400),
                      style: TextStyle(
                        color: Colors.grey[600],
                        height: 1.4,
                        fontSize:
                            Provider.of<Increassizeprovider>(context).fontSize,
                      ),
                      child: Text(
                        lorem(paragraphs: 1, words: 60),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
