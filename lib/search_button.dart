import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.child, required this.pokeUrl});

  final Widget child;
  final String pokeUrl;

  Future<void> _launchURL(String url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      await launchUrl(url0);
    } else {
      throw Exception('Gagal membuka url : $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            bottom: 50,
            right: 30,
            child: InkWell(
              onTap: () {
                _launchURL(pokeUrl);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: Colors.red),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
