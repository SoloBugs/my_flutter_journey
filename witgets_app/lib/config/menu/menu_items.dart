import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Tipos de Botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Tipo de Tarjetas',
    link: '/cards',
    icon: Icons.credit_card_off_outlined,
  ),
  MenuItem(
    title: 'Indicador de Progreso',
    subTitle: 'Barras de progreso',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars',
    subTitle: 'Tipos de Snackbars',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Statefull Widget Animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItem(
    title: 'Control de Interfaz',
    subTitle: 'Controles y mas',
    link: '/ui-controls',
    icon: Icons.settings_applications_outlined,
  ),
  MenuItem(
    title: 'Introduccion a la Aplicacion',
    subTitle: 'Uso de la App',
    link: '/tutorial',
    icon: Icons.accessible_forward_outlined,
  ),
  MenuItem(
    title: 'Scroll Infinito',
    subTitle: 'Scroll sin fin',
    link: '/infinite',
    icon: Icons.elevator_outlined,
  ),
  MenuItem(
      title: 'Counter',
      subTitle: 'Contador',
      link: '/counter',
      icon: Icons.add),
  MenuItem(
      title: 'Cambiar Tema',
      subTitle: 'Configuracion del tema de la aplicacion',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined)
];
