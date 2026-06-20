import 'package:cli/cli.dart';

void main(List<String> arguments) {
  const String version = '1.0.0';

  if (arguments.isEmpty || arguments[0] == "-h" || arguments[0] == "--help") {
    printHelp();
  } else {
    for(int i = 0; i < arguments.length; i++){
      print(i);
    }
  }
}
