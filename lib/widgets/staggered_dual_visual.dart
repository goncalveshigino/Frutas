import 'package:flutter/material.dart'; 


class StaggeredDualView extends StatelessWidget {

   final IndexedWidgetBuilder itemBuilder;
   final int itemCount;
   final double spacing;
   final double aspectRadio;
   final double offsetPercent;

  const StaggeredDualView(
    { 
      @required this.itemBuilder, 
      @required  this.itemCount, 
      this.spacing = 0.0, 
      this.aspectRadio = 0.5,
      this.offsetPercent = 0.4
    }
   );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrainst){
        
      //  final width = constrainst.maxWidth;
      //  final itemHeight = (width * 0.5 ) / aspectRadio;
      //  final height = constrainst.minHeight + itemHeight;


        // return OverflowBox(
        //   minWidth: width,
        //   maxWidth: width,
        //   minHeight: height,
        //   maxHeight: height,

        return GridView.builder(
         // padding: EdgeInsets.only( top: itemHeight / 2, bottom: itemHeight),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: aspectRadio, 
            crossAxisSpacing: spacing, 
            mainAxisSpacing: spacing
          ),
          itemCount: itemCount,
          itemBuilder: (context, index){
            return Transform.translate(
                offset: Offset(0.0, index.isOdd ? 100 * offsetPercent : 0.0), 
                child: itemBuilder(context, index)
              );
          },
        );
      },
    );
  }
}