// Auth controller -> Riverpods Notifiers
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_flutter/model/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';



final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController()
  
  );


class AuthController extends StateNotifier<AuthState>{
      
      AuthController() : super(AuthState());


      // Future login 
      Future<void> login(String email, String password)async{
            state = state.copyWith(isloading : true, error: null);



            try{
                    // fake delay API
                    await Future.delayed(Duration(seconds: 3));
                  
                  if(email == "samsophal123@gmail.com" && password == "12345"){
                      state = state.copyWith(
                          isloading: false,
                          error: "Login succesfully using riverpods!",
                      );
                  }else{
                      state = state.copyWith(
                        isloading: false,
                        error: "Invalid credentials...!",
                      );
                  }

            }catch (e){
                state = state.copyWith(
                  isloading: false,
                  error: e.toString()
                );
            }
      }



      void logout(){
          state = AuthState();

          
      }



      
}