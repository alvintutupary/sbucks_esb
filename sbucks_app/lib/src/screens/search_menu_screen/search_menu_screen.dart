// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:sbucks/src/blocs/branch_bloc.dart';
// import 'package:sbucks/src/models/branch_data_model.dart';
// import 'package:sbucks/src/models/menu_model.dart';
// // import 'package:sbucks/src/screens/order_screen/order_widgets/menu_item.dart';
// import 'package:sbucks/src/utils/size_config.dart';
// import 'package:sbucks/src/utils/style.dart';
// import 'package:sbucks/src/utils/utilities.dart';
// import 'package:sbucks/src/widgets/common/app_spacer.dart';
// import 'package:sbucks/src/widgets/common/circle_button.dart';
// import 'package:sbucks/src/widgets/common/custom_stream_builder.dart';
// import 'package:sbucks/src/widgets/common/progress_spinner.dart';
// import 'package:sbucks/src/widgets/common/simple_stream_builder.dart';
// import 'package:sbucks/src/widgets/rounded_box.dart';

// class SearchMenuScreen extends StatelessWidget {
//   static const kRouteName = '/search-menu';

//   Widget _buildAppBarTextField(BuildContext context) {
//     final branchBloc = Provider.of<BranchBloc>(context);
//     final appBarHeight = 75.scw;

//     return SliverAppBar(
//       pinned: true,
//       automaticallyImplyLeading: false,
//       backgroundColor: AppColor.kPrimaryBackground,
//       collapsedHeight: appBarHeight,
//       expandedHeight: appBarHeight,
//       flexibleSpace: RoundedBox(
//         margin: EdgeInsets.only(
//             top: MediaQuery.of(context).padding.top + 12.0, bottom: 16.scw),
//         outerPadding: EdgeInsets.symmetric(horizontal: 16.scw),
//         circularRadius: 50.0,
//         boxShadow: [
//           BoxShadow(
//             color: AppColor.kShadowSoftColor,
//             blurRadius: 5.0,
//           )
//         ],
//         child: Row(
//           children: [
//             AppSpacer.hSpacing(8.0),
//             CircleButton(
//               child: Icon(
//                 Icons.arrow_back,
//                 size: 18.scs,
//                 color: AppColor.kPrimaryText,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             Expanded(
//               child: Container(
//                 child: TextField(
//                   autofocus: true,
//                   autocorrect: false,
//                   style: AppTextStyle.bodyText1,
//                   textAlignVertical: TextAlignVertical.center,
//                   decoration: InputDecoration(
//                     isCollapsed: true,
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 16.scw,
//                     ),
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     hintText: 'Cari menu disini ...',
//                     hintStyle: AppTextStyle.bodyText1.copyWith(
//                       color: AppColor.kPlaceholderText,
//                     ),
//                   ),
//                   inputFormatters: Utilities.filterEmoticonInputFormatter,
//                   onChanged: branchBloc.changeMenuKeyword,
//                   onEditingComplete: () {
//                     FocusScope.of(context).unfocus();
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildEmptyOutletPlaceholder() {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: EdgeInsets.only(top: 32.scw, left: 12.scw, right: 12.scw),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40.scw),
//               child: Image.asset('assets/images/menu_not_found.png'),
//             ),
//             AppSpacer.vSpacing(12.scw),
//             Text(
//               'Wah, menu yang kamu cari belum tersedia',
//               style: AppTextStyle.bodyText2.copyWith(
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//             Text(
//               'Cari menu yang lain, yuk!',
//               style: AppTextStyle.bodyText2,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final branchBloc = Provider.of<BranchBloc>(context);

//     return Scaffold(
//       backgroundColor: AppColor.kPrimaryBackground,
//       body: CustomStreamBuilder(
//         stream: branchBloc.branchData,
//         onComplete: (_, BranchData branchData) {
//           final isOpen = branchData.outletIsOpen && !branchData.flagTempClosed;

//           return SimpleStreamBuilder(
//             stream: branchBloc.filteredMenuList,
//             onLoading: (_) => Center(child: ProgressSpinner()),
//             onComplete: (_, List<Menu> menuList) {
//               return NotificationListener<OverscrollIndicatorNotification>(
//                 onNotification: (OverscrollIndicatorNotification overscroll) {
//                   overscroll.disallowGlow();
//                   return true;
//                 },
//                 child: CustomScrollView(
//                   slivers: [
//                     _buildAppBarTextField(context),
//                     SimpleStreamBuilder(
//                       asSliver: true,
//                       stream: branchBloc.menuKeyword,
//                       onComplete: (context, String keyword) {
//                         if (keyword.isNotEmpty && menuList.isEmpty) {
//                           return _buildEmptyOutletPlaceholder();
//                         }
//                         return SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (_, int index) {
//                               return AbsorbPointer(
//                                 absorbing: !isOpen,
//                                 child: Opacity(
//                                   opacity: isOpen ? 1.0 : 0.4,
//                                   child: Container(
//                                     margin: EdgeInsets.fromLTRB(
//                                       16.scw,
//                                       index == 0 ? 16.scw : 0.0,
//                                       16.scw,
//                                       16.scw,
//                                     ),
//                                     child: MenuItem(
//                                       menu: menuList[index],
//                                       onMenuAdded: () {
//                                         Navigator.pop(context);
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                             childCount: menuList.length,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
