import 'package:flutter_instagram/src/data/model/album_model.dart';
import 'package:flutter_instagram/src/view/upload_choice.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rxn<AssetEntity> _selectedImage = Rxn<AssetEntity>();
  final RxInt _index = 0.obs;
  final RxBool _isDone = false.obs;

  List<AlbumModel> get albums => _albums.value;
  AssetEntity? get selectedImage => _selectedImage.value;
  int get index => _index.value;
  bool get isDone => _isDone.value;

  @override
  void onReady() {
    super.onReady();
    _checkPermission();
    _isDone(true);
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
      for (AssetPathEntity asset in paths) {
        var cnt = PhotoManager.getAssetCount();
        asset.getAssetListRange(start: 0, end: 10000).then((images) {
          final album = AlbumModel.fromGallery(asset.id, asset.name, images);
          // print(album.id);
          // print(album.name);
          // print(album.images);
          _albums.value.add(album);
          _albums.refresh();
        });
      }
      // PhotoManager.getAssetListPaged(page: 0, pageCount: 20).then((value) {
      //   print(value);
      //   _images(value);
      //   _images.refresh();
      // });
      // getPhotos(_albums.value[0]);
    });
  }

  // void getPhotos(AlbumModel album, {bool albumChange = false}) async {
  //   albumChange ? _currentPage = 0 : _currentPage++;
  //   await _path
  //       .singleWhere((AssetPathEntity e) => e.id == album.id)
  //       .getAssetListPaged(page: _currentPage, size: 10000)
  //       .then((result) {
  //     if (albumChange) {
  //       _images(result);
  //     } else {
  //       _images.value.addAll(result);
  //     }
  //     _images.refresh();
  //   });
  // }

  void moveToChoose() {
    Get.to(() => const UploadChoice());
  }

  void changeIndex(int value) {
    _index(value);
    Get.back();
  }

  void select(AssetEntity e) {
    _selectedImage(e);
    _selectedImage.refresh();
  }
}
