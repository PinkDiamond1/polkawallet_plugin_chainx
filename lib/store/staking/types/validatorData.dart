import 'dart:math';

import 'package:intl/intl.dart';

class ValidatorData extends _ValidatorData {
  static ValidatorData fromJson(Map<String, dynamic> json) {
    ValidatorData data = ValidatorData();
    data.accountId = json['accountId'];
    data.registeredAt = json['registeredAt'];
    data.isChilled = json['isChilled'];
    data.totalNomination = json['totalNomination'];
    data.lastTotalVoteWeight = json['lastTotalVoteWeight'];
    data.lastTotalVoteWeightUpdate = json['lastTotalVoteWeightUpdate'];
    data.isValidating = json['isValidating'];
    data.referralId = json['referralId'];
    data.selfBonded = json['selfBonded'];
    data.rewardPotAccount = json['rewardPotAccount'];
    data.rewardPotBalance = json['rewardPotBalance'];

    // if (json['exposure'] != null) {
    //   data.total = BigInt.parse(json['exposure']['total'].toString());
    //   data.bondOwn = BigInt.parse(json['exposure']['own'].toString());
    //   data.bondOther = data.total - data.bondOwn;

    //   data.isActive = json['isActive'];
    //   data.isElected = json['isElected'];

    //   data.numNominators = json['numNominators'];
    //   data.rankBondTotal = json['rankBondTotal'];
    //   data.rankReward = json['rankReward'];

    //   data.stakedReturn = double.parse(json['stakedReturn'].toString());
    //   data.stakedReturnCmp = double.parse(json['stakedReturnCmp'].toString());

    //   data.commission = NumberFormat('0.00%').format(json['validatorPrefs']['commission'] / pow(10, 9));
    //   data.nominators = List<Map<String, dynamic>>.from(json['exposure']['others']);
    // }
    return data;
  }
}

abstract class _ValidatorData {
  String accountId = '';
  int registeredAt = 0;
  bool isChilled = false;
  String totalNomination = '';
  String lastTotalVoteWeight = '';
  String lastTotalVoteWeightUpdate = '';
  bool isValidating = false;
  String referralId = '';
  String selfBonded = '';
  String rewardPotAccount = '';
  int rewardPotBalance = 0;
}
