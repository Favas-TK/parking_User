import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parking_user/sharedprefrepo/shredpref.dart';


part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit)async {
   
    if (event is NavigateToLoginEvent) {
     await Future.delayed(const Duration(seconds: 5));
     final data =await SharedPref().getUserData();
     if (data['isLogin']==true) {
       emit(NavigateToHomeState());
     }else{
       emit(NavigateToLoginState());
     }
    
    
      
    }
    });
  }
}
