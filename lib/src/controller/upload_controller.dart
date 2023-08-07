import 'package:flutter_instagram/src/data/model/album_model.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rx<List<AssetPathEntity>> _path = Rx<List<AssetPathEntity>>([]);

  @override
  void onInit() {
    super.onInit();
    _checkPermission();
  }

  void _checkPermission() {
    PhotoManager.requestPermissionExtend().then((ps) {
      if (ps.isAuth) {
        getAlbum();
      } else {
        PhotoManager.openSetting();
      }
    });
  }

  Future<void> getAlbum() async {
    await PhotoManager.getAssetPathList(type: RequestType.image).then((paths) {
      _path.value.addAll(paths);
      for (AssetPathEntity asset in paths) {
        final album = AlbumModel.fromGallery(asset);
        _albums.value.add(album);
      }
    });
    print(_albums.value);
    getPhotos();
  }

  getPhotos() {}
}
