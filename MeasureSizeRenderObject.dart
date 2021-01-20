import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef void OnWidgetSizeChange(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key key,
    @required this.onChange,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}




class ChooesexpertPops extends StatefulWidget {
  ChooesexpertPops({Key key}) : super(key: key);

  @override
  _ChooesexpertPopState createState() => _ChooesexpertPopState();
}

class _ChooesexpertPopsState extends State<ChooesexpertPop> {
  double contaheight = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MeasureSize(
            onChange: (size) {
              setState(() {
                print(size);
                contaheight = size.height;
              });
            },
            child: Container(height: 450)));
  }
}
