import 'dart:collection';

import 'package:aina/src/models/client_model.dart';
import 'package:flutter/material.dart';

class ClientData extends ChangeNotifier {
  final List<Client> _client = [
    Client(
        clientNumber: '+77471789004',
        lastCalledDate: '07 may 2022',
        callType: 'missed',
        clientName: 'Aimedet'),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
    Client(
      clientNumber: '+77474523625',
      lastCalledDate: '12 april 2022',
      callType: 'come',
      clientName: 'Aruzhan',
    ),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
    Client(
      clientNumber: '+77066549004',
      lastCalledDate: 'yesterday',
      callType: 'come',
    ),
  ];

  int selectedIndex = 0;

  UnmodifiableListView<Client> get client {
    return UnmodifiableListView(_client);
  }

  void setSelectClient(int index) {
    for (int i = 0; i < _client.length; i++) {
      if (i == index) {
        _client[i].isSelected = true;
        selectedIndex = i;
      } else {
        _client[i].isSelected = false;
      }
    }
    notifyListeners();
  }
}
