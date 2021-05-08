import 'package:flutter/material.dart';
import 'package:notes_sqlite_mobx/consts.dart';

class MoreOptions extends StatefulWidget {
  final Color color;
  final void Function(Color) callBackColorTapped;
  final GestureTapCallback onTapDelete;
  final bool isExclude;

  MoreOptions(
    this.color,
    this.callBackColorTapped,
    this.onTapDelete,
    this.isExclude,
  );
  @override
  _MoreOptionsState createState() => _MoreOptionsState();
}

class _MoreOptionsState extends State<MoreOptions> {
  Color cor;

  @override
  void initState() {
    cor = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor,
      child: Wrap(
        children: [
          widget.isExclude
              ? ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Excluir',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: widget.onTapDelete,
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Center(
              child: const Text(
                'Selecionar cor da Nota',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: CORES
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              changeColor(e);
                            },
                            child: Container(
                                height: 38,
                                width: 38,
                                child: CircleAvatar(
                                  foregroundColor: Color(0xff595959),
                                  backgroundColor: e,
                                  child: cor == e
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : const SizedBox(),
                                ),
                                padding:
                                    const EdgeInsets.all(1.0), // border width
                                decoration: new BoxDecoration(
                                  color: Colors.white, // border color
                                  shape: BoxShape.circle,
                                )),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeColor(Color color) {
    print(color);
    setState(() {
      cor = color;
      widget.callBackColorTapped(color);
    });
  }
}
