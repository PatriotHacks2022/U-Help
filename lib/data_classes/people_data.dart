import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';

class PeopleData{
  static List<PersonData> people = [
    PersonData(
        id: 'id-003',
        imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=388&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Kuzma Galey",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l: LatLng(53.75050642023227, 20.19329736740068),
    ),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=2070&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Pavlo Kolesnik",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Fairfax, VA",
        l:LatLng(47.728494841620375, 20.74503260035235)
    ),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1887&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Maxim Mucha",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Alexandria, VA",
        l:LatLng(51.56914819222295, 16.865617585472176)),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=870&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Ivan Warhola",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Fairfax, VA",
        l:LatLng(37.43296265331129, -122.08832357078792)),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=461&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Katrya Dacko",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l:LatLng(52.305008827941045, 20.107712851386264)),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=853&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Vesna Hopko",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Alexandria, VA",
        l:LatLng(46.216865425461144, 28.35647476931226)),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=870&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Zlata Kozar",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Fairfax, VA",
        l:LatLng(47.325294495875625, 24.023264394705567)),
    PersonData(
        id: 'id-003',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        imageUrl: 'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80',
        name: "Galyna Koval",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l:LatLng(49.60940768604192, 26.63363209025177)),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Angelina Cap",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Alexandria, VA",
        l:LatLng(47.95844002036243, 26.424802674608074)),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Anna Zelinski",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Fairfax, VA",
        l:LatLng(48.96239301644579, 18.437077540255196)),

    PersonData(
        id: 'id-003',
        imageUrl: 'https://images.unsplash.com/photo-1589571894960-20bbe2828d0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Ionna Zelinski",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l:LatLng(54.4931194401625, 30.159939024890097)),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=870&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Maryna Molchan",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l:LatLng(49.25460988504813, 21.395274805709885)),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=464&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Kateryna Dacko",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l:LatLng(47.3485144656711, 36.44710188307245)),
  ];


  static List<PersonData> people2 = [
    PersonData(
        id: 'id-002',
        imageUrl: 'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=423&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(53.45229947393693, 18.90088854883267)),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://images.unsplash.com/photo-1540569014015-19a7be504e3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l:LatLng(52.73216614844177, 29.94616672686131)),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=870&amp;q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(54.56494256004707, 23.76081094716527)),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(47.60447106756133, 5.015395982168093)),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(52.232479683303794, 18.26972979580246)),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://picsum.photos/seed/image002/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(37.43296265331129, -122.08832357078792)),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(37.43296265331129, -122.08832357078792)),
    PersonData(
        id: 'id-003',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        imageUrl: 'https://i.imgur.com/9h66HBP.png',
        name: "100",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(37.43296265331129, -122.08832357078792)),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(37.43296265331129, -122.08832357078792)),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "Ukraine",
        l:LatLng(37.43296265331129, -122.08832357078792)),

    PersonData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Here a user can write a short bio or include any information they may want to provide.",
        location: "France",
        l:LatLng(37.43296265331129, -122.08832357078792)),
  ];
}