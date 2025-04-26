import 'package:flutter/material.dart';

class roundbuttonFullScreen extends StatelessWidget {
  final String title;
  final VoidCallback tapfun;
  final bool loading;
  final Color backColor;
  const roundbuttonFullScreen(
      {key,
      required this.title,
      required this.tapfun,
      this.loading = false,
      this.backColor = Colors.blueAccent,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapfun,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: this.backColor,
          borderRadius: BorderRadius.circular(25.2),
        ),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
      ),
    );
  }
}

class roundbutton extends StatelessWidget {
  final String title;
  final VoidCallback tapfun;
  final bool loading;
  final Color backColor;
  final double width ;
   roundbutton(
      {key,
      required this.title,
      required this.tapfun,
      this.loading = false,
      this.backColor = Colors.blueAccent,
      this.width = 150,

      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapfun,
      child: Container(
        height: 45,
        width: this.width,
        decoration: BoxDecoration(
          color: this.backColor,
          borderRadius: BorderRadius.circular(10.2),
        ),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
      ),
    );
  }
}
