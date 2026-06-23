import 'dart:io';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  const String version = '1.0.0';

  if(arguments.isNotEmpty){
    for(int i=0; i<arguments.length; i++){
      if(arguments[i] == "-h" || arguments[i] == "--help"){
        printHelp();

      }else if(arguments[i] == "-v" || arguments[i] == "--version"){
        print("Dartpedia CLI version $version");

      }else if(arguments[i] == "search"){
        String textToSearch = '';

        if(i == arguments.length-1){
          while(textToSearch.isEmpty){
            print("Missing terms to search. Please enter an article to search for: ");
            textToSearch = stdin.readLineSync() ?? '';
          }

        }else{
          final searchTermsSeparate = arguments.sublist(i+1);
          textToSearch = searchTermsSeparate.join(" ");

        }

        searchWikipedia(textToSearch);

        return;
        
      }else{
        printHelp();
        
      }

    }

  }else{
    printHelp();

  }
}

Future<void> searchWikipedia(String textToSearch) async {
  print("Searching for '$textToSearch' on Wikipedia.");

  var articleContent = await getWikipediaArticle(textToSearch);
  print("\n$articleContent");
}

void printHelp() {
  print("-- Dartpedia CLI usage --");
  print("\nUSAGE:");
  print("dart cli.dart [flags] {parameter}");
  
  print("\nFLAGS:");
  print("'-h' or '--help': prints to the terminal this usage guide.");
  print("'-v' or '--version': prints to the terminal the current version of this program");

  print("\nPARAMETERS:");
  print("'search <term-to-search-for>': Searches for a term on Wikipedia.");

  return;
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https('en.wikipedia.org', 'api/rest_v1/page/summary/$articleTitle',);
  final response = await http.get(url);

  if(response.statusCode==200){
    return response.body;
  }else{
    return "Error: failed to fetch article $articleTitle. Status code: ${response.statusCode}";
  }
}