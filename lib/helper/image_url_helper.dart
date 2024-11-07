import 'package:deliveryman_app/app/data/urls.dart';

getFullimageUrl(String? imageURL) {
  if (imageURL == null) {
    return '';
  }
 return "${Urls.baseimageUrl + getFull200Image(imageURL)}";
}

String getFull200Image(String filename) {
  // Find the position of the last dot in the filename to get the extension
  int dotIndex = filename.lastIndexOf('.');
  
  // Extract the file name and extension
  String baseName = filename.substring(0, dotIndex);
  String extension = filename.substring(dotIndex);
  
  // Append "_80x80" to the base name and add the extension back
  return '${baseName}_80x80$extension';
}