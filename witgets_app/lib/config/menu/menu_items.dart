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
    title: 'Muchas cosas de titulo',
    subTitle: 'Muchas cosas de subtitulo',
    link: '/mis/botones/de/gomita',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Muchas cosas de Tarjeta',
    subTitle: 'Muchas cosas de Tarjeticas',
    link: '/mis/tarjetas/de/gomita',
    icon: Icons.credit_card_off_outlined,
  ),
];
