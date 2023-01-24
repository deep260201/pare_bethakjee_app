import 'package:gallery_saver/gallery_saver.dart';

class DownloadImage {
  //save single image
  static saveSingleImage({required String imageUrl}) {
    GallerySaver.saveImage(imageUrl, albumName: 'Pare Darshan');
  }

  //save Multy image
  static saveMultyImage({required List<String> imageUrlList}) {
    for (String data in imageUrlList) {
      try {
        GallerySaver.saveImage(data, albumName: 'Pare Darshan');
      } catch (e) {
        print(e);
      }
    }
  }
}
