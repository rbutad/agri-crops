import 'dart:async';

import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/enums/operation_state_enum.dart';
import 'package:agricrops/models/farmers_association/farmers_association.dart';
import 'package:agricrops/providers/farmers_association_provider.dart';
import 'package:agricrops/screens/farmers_association/detail/farmers_association.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmersAssociationListScreen extends StatefulWidget {
  const FarmersAssociationListScreen({Key? key}) : super(key: key);

  @override
  State<FarmersAssociationListScreen> createState() =>
      _FarmersAssociationListScreenState();
}

class _FarmersAssociationListScreenState
    extends State<FarmersAssociationListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FarmersAssociationProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmers Associations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const FarmersAssociationScreen(),
                fullscreenDialog: true,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<FarmersAssociation>>(
        stream: provider.getFarmersAssociations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(snapshotListHasError),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(farmersAssociationNoDataMessage),
            );
          }

          return RefreshIndicator(
            onRefresh: () => Future(_refresh),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final association = snapshot.data![index];

                return Card(
                  elevation: kDefaultElevation,
                  child: ListTile(
                    onTap: () {},
                    title: Text(association.name),
                    trailing: PopupMenuButton<OperationState>(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: OperationState.view,
                          child: Text('View Users'),
                        ),
                        const PopupMenuItem(
                          value: OperationState.addUser,
                          child: Text('Add User'),
                        ),
                        const PopupMenuDivider(),
                        const PopupMenuItem(
                          value: OperationState.edit,
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: OperationState.remove,
                          child: Text(
                            'Remove',
                            style: TextStyle(color: kRed),
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        switch (value) {
                          case OperationState.view:
                            _viewListOfUsers(association.uid);
                            break;
                          case OperationState.edit:
                            break;
                          case OperationState.addUser:
                            _createUser(association.uid);
                            break;
                          case OperationState.remove:
                            _removeAssociation(provider, association);
                            break;
                          default:
                            debugPrint('Invalid operation');
                            break;
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  FutureOr<void> _refresh() {
    setState(() {});
  }

  void _removeAssociation(FarmersAssociationProvider provider,
      FarmersAssociation farmersAssociation) {
    _showRemoveAssociationConfirmationDialog(farmersAssociation.name).then(
      (confirmed) {
        if (confirmed!) {
          provider.removeAssociation(farmersAssociation.uid).then(
                (_) => SnackbarUtility.showSuccessSnackBar(
                    'Association \'${farmersAssociation.name}\' has successfully removed'),
              );
        }
      },
    );
  }

  Future<bool?> _showRemoveAssociationConfirmationDialog(
      String associationName) {
    return showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Removing Association'),
        content: Text.rich(
          TextSpan(
            text: 'Do you want to remove ',
            children: [
              TextSpan(
                text: associationName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: '?')
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: kGreen),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: kRed),
            ),
            onPressed: () => Navigator.pop(context, false),
          )
        ],
      ),
    );
  }

  void _createUser(String associationUid) {
    Navigator.pushNamed(context, '/signup',
        arguments: {'associationUid': associationUid});
  }

  void _viewListOfUsers(String associationUid) {
    Navigator.pushNamed(context, '/users',
        arguments: {'associationUid': associationUid});
  }
}
