import 'dart:io';

void main(List<String> arguments) {
  const String version = '1.0.0';

  if(arguments.isNotEmpty){
    for(int i=0; i<arguments.length; i++){
      if(arguments[i] == "-h" || arguments[i] == "--help"){
        printHelp();
      }else if(arguments[i] == "-v" || arguments[i] == "--version"){
        print("Dartpedia CLI version $version");
      }else if(arguments[i] == "search"){
        print("Searching.");
      }else{
        printHelp();
      }

    }

  }else{
    printHelp();
  }
}


void printHelp() {
  print("-- Dartpedia CLI usage --");
  print("\nUSAGE:");
  print("dart cli.dart [flags] {parameter}");
  
  print("\nFLAGS:");
  print("'-h' or '--help': prints to the terminal this usage guide.");
  print("'-v' or '--version': prints to the terminal the current version of this program");

  print("\nPARAMETERS:");

  exit(0);
}
