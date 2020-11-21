import 'package:flutter/material.dart';

class DraggableExmp extends StatelessWidget {
  int acceptedData = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DraggableWidget(offset: Offset(100.0, 100.0)),
          Positioned(
            top: 100.0,
            left: 100.0,
            child: DragTarget(
              builder: (context, accepted, rejected) {
                return Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.teal,
                  child: Center(
                    child: Text(acceptedData.toString()),
                  ),
                );
              },
              onAccept: (int data) {
                acceptedData = data;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  Offset offset;
  DraggableWidget({Key key, this.offset}) : super(key: key);
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.offset == null) {
      widget.offset = Offset(0.0, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.offset.dy,
      left: widget.offset.dx,
      child: Draggable(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.red,
          child: Center(
            child: Text('Container'),
          ),
        ),
        feedback: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.red.withOpacity(0.2),
          child: Center(
            child: Text('Container'),
          ),
        ),
        data: 20,
        onDraggableCanceled: (v, o) {
          setState(() {
            widget.offset = o;
          });
        },
      ),
    );
  }
}
