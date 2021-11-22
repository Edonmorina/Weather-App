
import 'package:geolocator/geolocator.dart';

class Location {

  double lat;
  double long;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      double lat = position.latitude;
      double long = position.longitude;
      this.lat = lat;
      this.long = long;
    }
    catch(e){
      print(e);
    }

  }

}