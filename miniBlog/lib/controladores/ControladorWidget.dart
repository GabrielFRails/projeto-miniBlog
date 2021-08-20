import 'package:mobx/mobx.dart';
part 'ControladorWidget.g.dart';

class ControladorWidget = _ControladorWidgetBase with _$ControladorWidget;

abstract class _ControladorWidgetBase with Store {
  @observable
  bool selecionouImagem0 = false;
  @observable
  bool selecionouImagem1 = false;
  @observable
  bool selecionouImagem2 = false;
  @observable
  bool selecionouImagem3 = false;
  @observable
  bool selecionouImagem4 = false;
  @observable
  bool selecionouImagem5 = false;
  @observable
  bool selecionouImagem6 = false;
  @observable
  bool selecionouImagem7 = false;
  @observable
  bool selecionouImagem8 = false;

  @action
  void setSelecionada(bool imagemASelecionar) =>
      imagemASelecionar = !imagemASelecionar;
}
