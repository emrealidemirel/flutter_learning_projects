import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hesap_makinesi_state.dart';

class HesapMakinesiCubit extends Cubit<HesapMakinesiState> {
  HesapMakinesiCubit() : super(HesapMakinesiLoadedState(sonuc: "Sonuç"));

  void topla(double a, double b) {
    emit(HesapMakinesiLoadedState(sonuc: "Sonuç: ${a + b}"));
  }

  void cikar(double a, double b) {
    emit(HesapMakinesiLoadedState(sonuc: "Sonuç: ${a - b}"));
  }

  void carp(double a, double b) {
    emit(HesapMakinesiLoadedState(sonuc: "Sonuç: ${a * b}"));
  }

  void bol(double a, double b) {
    if (a == 0 || b == 0) {
      emit(HesapMakinesiLoadedState(sonuc: "Sonuç: 0"));
    } else {
      emit(HesapMakinesiLoadedState(sonuc: "Sonuç: ${a / b}"));
    }
  }
}
