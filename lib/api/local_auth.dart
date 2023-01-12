import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    
    final List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();
    
    if (availableBiometrics.isNotEmpty) {
      
    }

    try {
      return await _auth.authenticate(
          localizedReason: 'Login using fingerprint',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Confirm Using Your Fingerprint',
              cancelButton: 'No thanks',
              goToSettingsButton: 'Enable in settings'
            ),
          ],
          options: const AuthenticationOptions(biometricOnly: true, useErrorDialogs: true));
    } on PlatformException catch (e) {
      return false;
    }
  }
}