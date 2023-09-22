import 'package:animation/View/Screen/screen.dart';
import 'package:animation/controller/localizationcontroller.dart';
import 'package:animation/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class VehicleList extends StatefulWidget {
  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  List<Widget> _vehicleTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addvehicles();
    // final localProvider = Provider.of<Localprovider>(context, listen: false);
    // Future.delayed(Duration.zero, () {
    //   final localProvider = Provider.of<Localprovider>(context, listen: false);
    // });
  }

  void _addvehicles() {
    // get data from db
    List<vehicle> _vehicles = [
      vehicle(title: 'Bmw', price: '1.5Cr', emi: '600000', img: 'bmw.jpg'),
      vehicle(title: 'Bugatti ', price: '4Cr', emi: '500000', img: 'bug.jpg'),
      vehicle(
          title: 'Lamborgini', price: '2Cr', emi: '3000000', img: 'lambo.jpg'),
      vehicle(title: 'Shelby GT', price: '85L', emi: '405000', img: 'audi.jpg'),
    ];

    _vehicles.forEach((vehicle vehicle) {
      _vehicleTiles.add(_buildTile(vehicle));
    });
  }

  Widget _buildTile(vehicle vehicle) {
    return Consumer<Localprovider>(builder: (context, provider, snapshot) {
      return ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(vehicle: vehicle)));
        },
        contentPadding: EdgeInsets.all(25),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppLocalizations.of(context)!.emi),
            Text('${vehicle.emi} ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[300])),
            Text(vehicle.title,
                style: TextStyle(fontSize: 20, color: Colors.grey[600])),
          ],
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'lib/assets/${vehicle.img}',
            height: 70.0,
            width: 90,
          ),
        ),
        trailing: Text('\$${vehicle.price}'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _vehicleTiles.length,
        itemBuilder: (context, index) {
          return _vehicleTiles[index];
        });
  }
}
