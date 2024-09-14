import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStepWidget extends StatefulWidget {
  const AddStepWidget({super.key, required this.textList});

  final ValueChanged<List<TextEditingController>> textList;

  @override
  State<AddStepWidget> createState() => _AddStepWidgetState();
}

class _AddStepWidgetState extends State<AddStepWidget> {
  final List<TextEditingController> _controllers = [TextEditingController()];

  void addInput() {
    final controller = TextEditingController();
    setState(() {
      _controllers.add(controller);
      widget.textList.call(_controllers);
    });
  }

  @override
  void initState() {
    widget.textList.call(_controllers);
    super.initState();
  }

  void removeInput(int index) {
    if (_controllers.isNotEmpty && index >= 0 && index < _controllers.length) {
      _controllers[index].dispose(); // 释放TextEditingController资源
      setState(() {
        _controllers.removeAt(index);
        widget.textList.call(_controllers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._controllers.asMap().entries.map((entry) {
          int index = entry.key;
          TextEditingController controller = entry.value;
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: const Color(0xFFF2F2F2)),
            margin: EdgeInsets.only(bottom: 9.h),
            padding: EdgeInsets.only(left: 14.w),
            child: Row(
              children: [
                Text(
                  "Step ${index + 1}",
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xFF4B4B4B), fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 14.sp),
                    controller: controller,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Input Content",
                        hintStyle: TextStyle(fontSize: 12.sp, color: const Color(0xFFD5D5D5))),
                  ),
                ),
                if (index > 0)
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Color(0xFFCCCCCC),
                    ),
                    onPressed: () => removeInput(index),
                  ),
              ],
            ),
          );
        }),
        addBtn,
      ],
    );
  }

  Widget get addBtn {
    return InkWell(
      onTap: () {
        addInput();
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: const Color(0xFFF5902C),
        radius: const Radius.circular(4),
        padding: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: SizedBox(
            height: 47,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text(
                  "Add steps",
                  style: TextStyle(
                      fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFFF5902C)),
                ),
                const Positioned(
                  right: 12,
                  child: Icon(
                    Icons.add_circle,
                    color: Color(0xFFF5902C),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
