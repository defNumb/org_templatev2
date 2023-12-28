import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_templatev2/views/main_pages/home_page.dart';
import 'package:org_templatev2/views/main_pages/settings_page.dart';
import '../blocs/cubits/page_provider/page_provider_cubit.dart';
import '../components/app_bar.dart';
import 'main_pages/inventory_page.dart';

class PageContainer extends StatefulWidget {
  const PageContainer({super.key});

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: myAppBar(context: context),
      body: SafeArea(
        child: BlocBuilder<PageProviderCubit, PageProviderState>(
          builder: (context, state) {
            // switch method checking for the current state of the pageItem provider and
            // returning the appropriate page
            switch (state.pageItem) {
              case PageItem.home:
                return const MyHomePage();
              case PageItem.inventory:
                return const InventoryPage();
              case PageItem.settings:
                return const SettingsPage();
              default:
                return const Placeholder();
            }
          },
        ),
      ),
    );
  }
}
