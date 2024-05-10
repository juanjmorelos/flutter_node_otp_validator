import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_project/models/verify_model_provider.dart';
import 'package:otp_project/service/repository/verify_repository_impl.dart';

final verifyProvider = StateNotifierProvider<VerifyProviderNotifier, VerifyModelProvider>((ref) {
  final verifyRepositoryImpl = VerifyRepositoryImpl();
  return VerifyProviderNotifier(verifyRepositoryImpl: verifyRepositoryImpl);
});

class VerifyProviderNotifier extends StateNotifier<VerifyModelProvider> {
  VerifyRepositoryImpl verifyRepositoryImpl;
  
  VerifyProviderNotifier({
    required this.verifyRepositoryImpl
  }): super (VerifyModelProvider());

  onEmailChange(String value) {
    state = state.copyWith(email: value);
  }
  onNameChange(String value) {
    state = state.copyWith(name: value);
  }

  setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<VerifyModelProvider> sendEmailToVerify() async {
    setLoading(true);
    final response = await verifyRepositoryImpl.sendEmailToVerify(email: state.email, name: state.name);
    state = state.copyWith(success: response.success);
    state = state.copyWith(msg: response.msg);
    setLoading(false);
    return state
    ;
  }

  Future<VerifyModelProvider> sendTokenToVerify(String email, String token) async {
    setLoading(true);
    final response = await verifyRepositoryImpl.verifyTokenReceived(email: email, token: token);
    state = state.copyWith(success: response.success);
    state = state.copyWith(msg: response.msg);
    setLoading(false);
    return state;
  }

}