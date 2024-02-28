import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' as html;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:scholar_scraper_app/loaders.dart';
import 'data_provider.dart';
import 'details_page.dart';
import 'home_screen_header.dart';
import 'login_header.dart';
import 'login_screen.dart';
class MyHomePage extends StatelessWidget {
  Future<void> _scrapeAndSave(BuildContext context) async {
    String url = context.read<DataProvider>().urlController.text;
    String year = context.read<DataProvider>().yearController.text;

    try {
      final response = await http.get(Uri.parse(url), headers: {'User-agent': 'your bot 0.1'});
      final document = html.parse(response.body);
      final authors = document.querySelector('#gsc_prf_in');
      final authorName = authors?.text;

      final unYear = document.querySelectorAll('.gsc_a_h.gsc_a_hc.gs_ibl');
      final allYear = unYear.map((element) => element.text).toList();
      final counting = allYear.where((element) => element == year).length;

      Map<String, dynamic> data = {
        'Author Name': authorName,
        'Year': year,
        'Count': counting,
      };

      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/output_data.xlsx';

      await _writeExcelFile(data, filePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating, // Add this line
          content: Text('Data saved to $filePath'),
          action: SnackBarAction(
            label: 'Open',
            onPressed: () {
              _offerDownload(context, filePath);
            },
          ),
        ),
      );

    } catch (e) {
      TLoaders.warningSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  Future<void> _scrapeDetails(BuildContext context) async {
    String url = context.read<DataProvider>().urlController.text;
    String year = context.read<DataProvider>().yearController.text;

    try {
      final response = await http.get(Uri.parse(url), headers: {'User-agent': 'your bot 0.1'});
      final document = html.parse(response.body);
      final authors = document.querySelector('#gsc_prf_in');
      final authorName = authors?.text;

      final unYear = document.querySelectorAll('.gsc_a_h.gsc_a_hc.gs_ibl');
      final allYear = unYear.map((element) => element.text).toList();
      final counting = allYear.where((element) => element == year).length;

      Map<String, dynamic> data = {
        'Author Name': authorName,
        'Year': year,
        'Count': counting,
      };

      // Update the details property
      context.read<DataProvider>().details.add(data);
      TLoaders.successSnackBar(title: "Congratulations",message:"Data scraped successfully" );

    } catch (e) {
      TLoaders.warningSnackBar(title: "Oh Snap!",message: e.toString());
    }

  }

  Future<void> _writeExcelFile(Map<String, dynamic> data, String filePath) async {
    final file = File(filePath);
    bool fileExists = await file.exists();

    if (!fileExists) {
      // Create the Excel file with header if it doesn't exist
      await file.writeAsString('Author Name\tYear\tNo. of Publications\n');
    }

    // Append data to the Excel file
    await file.writeAsString(
        '${data['Author Name']}\t${data['Year']}\t${data['Count']}\n',
        mode: FileMode.append);
  }

  Future<void> _offerDownload(BuildContext context, String filePath) async {
    final directory = await getExternalStorageDirectory();
    final downloadPath = '${directory?.path}/output_data.xlsx';

    await File(filePath).copy(downloadPath);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Excel file downloaded to $downloadPath'),
        action: SnackBarAction(
          label: 'Open',
          onPressed: () {
            OpenFile.open(downloadPath);
          },
        ),
      ),
    );
  }

  void _viewDetails(BuildContext context) async {
    await _scrapeDetails(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(context.read<DataProvider>().details),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Scholar Scraper App')),
        // Add leading arrow button to go back
        actions: [
          // Three-dot menu
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('Logout'),
                onTap: () {
                  // Add your logout functionality here
                  context.read<DataProvider>().urlController.clear();
                  context.read<DataProvider>().yearController.clear();
                  logoutAccountWarningPopup();
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: THomeHeader(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
        
                  const SizedBox(height: 16),
                  TextField(
                    controller: context.watch<DataProvider>().urlController,
                    decoration: const InputDecoration(labelText: 'Enter Google Scholar URL'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: context.watch<DataProvider>().yearController,
                    decoration: const InputDecoration(labelText: 'Enter the year to count'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _scrapeAndSave(context),
                      child: const Text('Scrape and Save'),
                    ),
                  ),
                  const  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _viewDetails(context),
                      child: const Text('View Details'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(context.watch<DataProvider>().output),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void logoutAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(16.0),
        title: 'Logout Account',
        middleText:
        'Are you sure you want to logout account?',
        confirm: ElevatedButton(
            onPressed: () async => logout(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: BorderSide(color: Colors.red)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Text('Confirm'),
            )),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: Text('Cancel'),
        ));
  }
  Future<void> logout() async {
    try {

      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      throw 'Something went Wrong. Please try again';
    }
  }
}