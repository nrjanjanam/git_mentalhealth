import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:git_mentalhealth/common/widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends SuperController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userEmail = '';
  String? userName = '';
  String? userPassword = '';
  File? userImageFile;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLogin = RxBool(true);

  RxBool isLoading = RxBool(false);

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  @override
  void onInit() {
    isLogin(true);
    isLoading(false);
    super.onInit();
  }

  void submitAuthForm() async {
    UserCredential _authResult;
    try {
      isLoading(true);
      if (isLogin.value) {
        _authResult = await _auth.signInWithEmailAndPassword(
            email: userEmail ?? "", password: userPassword ?? "");
      } else {
        _authResult = await _auth.createUserWithEmailAndPassword(
            email: userEmail ?? "", password: userPassword ?? "");

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child((_authResult.user?.uid)! + '.jpg');

        await ref.putFile(userImageFile!).whenComplete(() async {
          String url = await ref.getDownloadURL();
          debugPrint("URL is" + url);

          //for adding extra data
          await FirebaseFirestore.instance
              .collection('users')
              .doc(_authResult.user?.uid)
              .set({
            'userName': userName,
            'email': userEmail,
            'imageUrl': url,
          });
        });
      }
    } on FirebaseAuthException catch (e) {
      String message;

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = 'An error occured, please check your credentials';
      }

      isLoading(false);
      snackBar(
        title: isLogin.value ? "Login error" : "Sign up error",
        message: message,
      );
    } on PlatformException catch (e) {
      String message = 'An error occured, please check your credentials';
      isLoading(false);

      snackBar(
          title: isLogin.value ? "Login error" : "Sign up error",
          message: e.message ?? message);
    } on Exception catch (e) {
      snackBar(
          title: isLogin.value ? "Login error" : "Sign up error",
          message: e.toString());

      isLoading(false);
      debugPrint(e.toString());
    }
  }

  void pickedImg(XFile image) {
    userImageFile = File(image.path);
  }

  void trySubmit() {
    final bool? _isValid = formKey.currentState?.validate();

    FocusScope.of(Get.context!).unfocus();

    if (userImageFile == null && !isLogin.value) {
      snackBar(
        title: isLogin.value ? "Login error" : "Sign up error",
        message: "Please pick an image",
      );

      return;
    }
    if (_isValid != null && _isValid) {
      formKey.currentState?.save();
      debugPrint('$userEmail $userName $userPassword');

      submitAuthForm();
    }
  }
}
