import 'package:flutter/cupertino.dart';
import 'package:img_search/model/ui/home_view_model.dart';


class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  const PhotoProvider({
    Key? key,
    required Widget child,
    required this.viewModel,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context){
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }



  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }

}