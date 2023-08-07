import 'package:photo_manager/photo_manager.dart';

class AlbumModel {
  String? id;
  String? name;

  AlbumModel({required this.id, required this.name});

  factory AlbumModel.fromGallery(AssetPathEntity asset) {
    return AlbumModel(id: asset.id, name: asset.name);
  }
}
