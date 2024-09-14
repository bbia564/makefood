import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/img_picker_util.dart';

typedef SelectCallback = void Function(List<File> files);

class SelectImageWidget extends StatefulWidget {
  const SelectImageWidget({
    super.key,
    required this.maxLength,
    this.crossAxisCount = 3,
    this.maxDuration,
    required this.selectCallback,
    this.onlyImage = true,
  });

  final int maxLength;
  final int crossAxisCount;
  final Duration? maxDuration;
  final bool onlyImage;
  final SelectCallback selectCallback;

  @override
  State<SelectImageWidget> createState() => _SelectImageWidgetState();
}

class _SelectImageWidgetState extends State<SelectImageWidget> {
  List<File> selectFiles = [];
  bool addMore = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 103 / 84,
      mainAxisSpacing: 10.w,
      crossAxisSpacing: 10.w,
      children: [..._items(), if (addMore) _addWidget()],
    );
  }

  List<Widget> _items() {
    List<Widget> fileItems = [];
    for (int i = 0; i < selectFiles.length; i++) {
      fileItems.add(_fileItem(selectFiles[i], i));
    }
    return fileItems;
  }

  _addWidget() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)), color: const Color(0xFFF2F2F2)),
        child: const Icon(
          Icons.add_a_photo_outlined,
          color: Color(0xFFF5902C),
        ),
      ),
      onTap: () async {
        final picker = ImagePicker();
        final file = await picker.pickImage(source: ImageSource.gallery);
        if (file != null) {
          String filePath = file.path;
          await _assetToFile(File(filePath));
          setState(() {});
        }
      },
    );
  }

  Widget _fileItem(File file, int index) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          child: Image.file(
            file,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Positioned(
            top: -2.h,
            right: -3.h,
            child: InkWell(
              onTap: () {
                _removeSelect(file);
                addMore = true;
                setState(() {});
              },
              child: const Center(
                child: Icon(
                  Icons.remove_circle,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ))
      ],
    );
  }

  _assetToFile(File file) async {
    int haveIndex = selectFiles.indexWhere((element) => element.path == file.path);
    if (haveIndex > -1) {
      return;
    }
    selectFiles.add(file);
    widget.selectCallback.call(selectFiles);
  }

  _removeSelect(File file) async {
    selectFiles.removeWhere((element) => element.path == file.path);
    widget.selectCallback.call(selectFiles);
  }
}
