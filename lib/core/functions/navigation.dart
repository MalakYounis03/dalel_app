import 'package:go_router/go_router.dart';

customNavigate(context, String path) {
  GoRouter.of(context).push(path);
}

customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
