part of 'hesap_makinesi_cubit.dart';

@immutable
sealed class HesapMakinesiState {
  final String sonuc;

  const HesapMakinesiState({required this.sonuc});
}

class HesapMakinesiLoadedState extends HesapMakinesiState {
  const HesapMakinesiLoadedState({required super.sonuc});
}
