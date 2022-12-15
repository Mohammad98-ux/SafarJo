import 'package:flutter/material.dart';
import 'package:safar/View/Home/Home_page.dart';
import 'package:safar/lib_orgnaizer.dart';

class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        {
          return _route(SplashScreen());
        }

      case loginRoute:
        {
          return _route(Login());
        }
      case signUpRoute:
        {
          return _route(Signup());
        }
      case countryRoute:
        {
          return _route(Home());
        }
      case jordanRoute:
        {
          return _route(Jordan());
        }








      default:
        {
          final arg = settings.name as String;
          return _route(UndefineRoute(routeName: arg));
        }
    }
  }

  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}

class UndefineRoute extends StatelessWidget {
  const UndefineRoute({Key? key, required this.routeName}) : super(key: key);
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This $routeName is Undefine Route',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
