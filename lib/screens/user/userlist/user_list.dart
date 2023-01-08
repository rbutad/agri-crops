import 'dart:async';

import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/enums/operation_state_enum.dart';
import 'package:agricrops/enums/role_enum.dart';
import 'package:agricrops/enums/user_status_enum.dart';
import 'package:agricrops/models/user/app_user.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String? associationUid;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    _getAssociationUid();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: StreamBuilder<List<AppUser>>(
        stream: _isUserSysAdmin()
            ? provider.getUsers()
            : provider.getUsersByAssociation(associationUid!),
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
              child: Text(userListNoDataMessage),
            );
          }

          return RefreshIndicator(
            onRefresh: () => Future(_refresh),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];

                return Card(
                  elevation: kDefaultElevation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.firstName} ${user.lastName}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'User is a? ${toBeginningOfSentenceCase(user.role.name)!}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Account: ${toBeginningOfSentenceCase(user.status.name)!}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: user.status == UserStatus.approved
                                          ? kGreen
                                          : kRed),
                            )
                          ],
                        ),
                        user.status == UserStatus.pending
                            ? PopupMenuButton<OperationState>(
                                itemBuilder: (context) => const [
                                  PopupMenuItem(
                                    value: OperationState.approve,
                                    child: Text('Approve'),
                                  ),
                                  PopupMenuItem(
                                    value: OperationState.decline,
                                    child: Text('Decline'),
                                  )
                                ],
                                onSelected: (operation) {
                                  switch (operation) {
                                    case OperationState.approve:
                                      _approveUser(provider, user);
                                      break;
                                    case OperationState.decline:
                                      _declineUser(provider, user);
                                      break;
                                    default:
                                      debugPrint('Invalid operation');
                                      break;
                                  }
                                },
                              )
                            : Container(),
                      ],
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

  void _getAssociationUid() {
    final arguments = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map;
    associationUid = arguments['associationUid'] ??
        context.read<AuthProvider>().appUser?.associationUid;
  }

  bool _isUserSysAdmin() => (associationUid == null ||
      associationUid!.isEmpty &&
          context.read<AuthProvider>().appUser?.role == Role.sysadmin);

  void _approveUser(UserProvider provider, AppUser user) {
    user = user.copyWith(
      status: UserStatus.approved,
      approvedAt: DateTime.now(),
      approvedBy: context.read<AuthProvider>().appUser!.uid,
    );

    final userName = '${user.firstName} ${user.lastName}';
    provider.updateUser(user).then((_) =>
        _showUserUpdateStatusSuccessfullyDialog(userName, UserStatus.approved));
  }

  void _declineUser(UserProvider provider, AppUser user) {
    user = user.copyWith(
      status: UserStatus.declined,
      declinedAt: DateTime.now(),
      declinedBy: context.read<AuthProvider>().appUser!.uid,
    );

    final userName = '${user.firstName} ${user.lastName}';
    provider.updateUser(user).then((_) =>
        _showUserUpdateStatusSuccessfullyDialog(userName, UserStatus.declined));
  }

  Future<void> _showUserUpdateStatusSuccessfullyDialog(
      String userName, UserStatus status) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Status'),
        content: Text.rich(
          TextSpan(
            text: 'User ',
            children: [
              TextSpan(
                text: userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text:
                      ' has ${status == UserStatus.approved ? 'successfully' : 'been'} ${toBeginningOfSentenceCase(status.name)}.'),
              status == UserStatus.approved
                  ? const TextSpan(
                      text: '\n\nThis user will now be able to sign in.')
                  : const TextSpan(
                      text: '\n\nThis user will not be able to sign in.',
                      style: TextStyle(color: kRed),
                    )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
