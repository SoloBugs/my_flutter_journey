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
];
