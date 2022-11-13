import 'package:velocity_x/velocity_x.dart';

import '../cartlog.dart';
import '../data.dart';

class mystore extends VxStore {
  data cat = data();
  cartlog cart = cartlog();
  mystore() {
    cat = data();
    cart = cartlog();
  }
}
