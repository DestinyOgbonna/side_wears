import 'package:building_ui/core/exports/exports.dart';

class Heart extends ConsumerStatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeartState();
}

class _HeartState extends ConsumerState<Heart>
    with SingleTickerProviderStateMixin {
  AnimationController? _myAnimationController;
  Animation? _colorAnimation;
  Animation<double>? _sizeAnimation;
  bool isFav = true;
  @override
  void initState() {
    super.initState();
    _myAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _myAnimationController!.forward(); //*Starts the animation
//* IMplemention a colour animation
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_myAnimationController!);

    //*Implemention the size animation
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 50,
        ),
      ],
    ).animate(_myAnimationController!);

    _myAnimationController!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFav == true;
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(
            () {
              isFav == false;
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _myAnimationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _myAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation!.value,
            size: _sizeAnimation!.value,
          ),
          onPressed: () {
            if (isFav == true) {
  _myAnimationController!.forward();
      //        ref.read(myProductsDetailsScreenModel.notifier).addToFavorite();
            }  if (isFav == false) {

              _myAnimationController!.reverse();
            
           //   ref.read(myProductsDetailsScreenModel.notifier).removeFromFavorite();
            }
          },
        );
      },
    );
  }
}
