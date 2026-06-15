class AuthState{
      final bool isloading;
      final String? token;
      final String? error;



      AuthState({
        this.isloading = false,
        this.token,
        this.error,
      });

      // Copy with
      AuthState copyWith({
            bool? isloading,
            String? token,
            String? error,
      }){
              return AuthState(
                    isloading: isloading ?? this.isloading,
                    token: token ?? this.token,
                    error: error,
              );
      }
}