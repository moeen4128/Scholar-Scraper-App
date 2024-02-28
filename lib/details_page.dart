// details_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_provider.dart';

class DetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> details;

  DetailsPage(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Details Page')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(16.0),
              children: [
                DataTable(
                  columns: [
                    DataColumn(label: Text('Author Name')),
                    DataColumn(label: Text('Year')),
                    DataColumn(label: Text('No. of Publications')),
                  ],
                  rows: details
                      .map(
                        (data) => DataRow(
                      cells: [
                        DataCell(
                          Flexible(
                            child: Text(
                              data['Author Name'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(
                          Flexible(
                            child: Text(
                              data['Year'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(
                          Flexible(
                            child: Text(
                              data['Count'].toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'To download the record, go back and click on "Scrape and Save" button.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<DataProvider>().clearDetails();
              Navigator.pop(context); // Go back to the previous screen
            },
            child: Text('Go Back'),
          ),

        ],
      ),
    );
  }
}
