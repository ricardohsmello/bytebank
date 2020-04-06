import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/database/dao/account_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact/form.dart';
import 'package:bytebank/screens/transaction/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  final ContactDAO _accountDAO = ContactDAO();

  @override /*, onDowngrade: onDatabaseDowngradeDelete*/
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 1))
            .then((value) => _accountDAO.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:

              if (snapshot.hasData) {
                final List<Contact> contacts = snapshot.data;

                if (contacts.isNotEmpty) {
                  return ListView.builder(
                    itemCount: contacts?.length ?? 0,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return ContactItem(
                        contact,
                        onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactionForm(contact),
                          ));
                        },
                      );
                    },
                  );
                }
              }

              return CenteredMessage(
                'No contacts found',
                icon: Icons.warning,
              );

              break;
          }
          return CenteredMessage('Unknown Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactForm();
          }));
        },
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact _contact;
  final Function onClick;

  ContactItem(
    this._contact, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        leading: Icon(Icons.monetization_on),
        title: Text(_contact.name),
        subtitle: Text(_contact.accountNumber.toString()),
        trailing: Text('25/03/2020'),
      ),
    );
  }
}
