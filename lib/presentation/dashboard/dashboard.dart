import 'package:traval/core/utils/helper.dart';
import 'package:traval/presentation/dashboard/carDetails/car_details_screen.dart';
import 'package:traval/presentation/comman_widget/app_text_field.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/dashboard/contracts/branches_controller.dart';
import 'package:traval/presentation/dashboard/dashboard_con.dart';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:traval/core/app_export.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final DashboardController con = Get.put(DashboardController());
  // final BranchesController con2 = Get.put(BranchesController());
  // List<String>? branches_list = [];
  // List<String>? branches_list2 = [];
  ScrollController sc1 = ScrollController();
  ScrollController sc2 = ScrollController();

  final double _width = 100.0;
  final double _width2 = 100.0;

  bool data_load = false;
  String? _receiving_dropdown;
  int idx_left = 1;
  int idx_right = 0;

  int idx_left2 = 1;
  int idx_right2 = 0;
  String? _deliverydropdown;

  //ni horya hun kisi hor screen ty ja k awa gy ty fr hoy ga
  void _animateToIndex_right(int index) {
    setState(() {
      idx_left = 0;
      idx_right = idx_right + 3;
    });
    sc1.animateTo(
      index * _width,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _animateToIndex_left(int index) {
    setState(() {
      idx_right = 0;
      idx_left = idx_left + 3;
    });
    sc1.animateTo(
      index * _width,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void ind_animation_right(int index) {
    setState(() {
      idx_left2 = 0;
      idx_right2 = idx_right2 + 3;
    });
    sc2.animateTo(
      index * _width2,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void ind_animation_left(int index) {
    setState(() {
      idx_right2 = 0;
      idx_left2 = idx_left2 + 3;
    });
    sc2.animateTo(
      index * _width2,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (con) {
          return GetBuilder<BranchesController>(
              init: BranchesController(),
              builder: (con2) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: SafeArea(
                    child: SingleChildScrollView(
                      controller: con.scrollController,
                      child: Obx(
                        () => Column(
                          children: [
                            con2.isLoading.value
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    // child: const AppLoader(),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            ImageConstant.logoIcon,
                                            height: Get.height * 0.05,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "chooseyourcarnow".tr,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.065,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              border: Border.all(
                                                  color: Colors.green)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02),
                                            child: Row(
                                              children: [
                                                Container(
                                                    height: 60,
                                                    width: 30,
                                                    child: Icon(
                                                      Icons.pin_drop,
                                                      size: 32,
                                                      color: Color.fromARGB(
                                                          255, 87, 174, 91),
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.06,
                                                  child: DropdownButton(
                                                    hint: _receiving_dropdown ==
                                                            null
                                                        ? Text(
                                                            "receivinglocation"
                                                                .tr,
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    "roboto",
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        65,
                                                                        64,
                                                                        64)))
                                                        : Text(
                                                            _receiving_dropdown!,
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    "roboto",
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        65,
                                                                        64,
                                                                        64)),
                                                          ),
                                                    isExpanded: true,
                                                    iconSize: 30.0,
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                    items: con2.isLoading.value
                                                        ? ['No Branch Found']
                                                            .map(
                                                            (val) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: val,
                                                                child:
                                                                    Text(val),
                                                              );
                                                            },
                                                          ).toList()
                                                        : con2.branches.map(
                                                            (val) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value:
                                                                    val.title!,
                                                                child: Text(
                                                                    val.title!),
                                                              );
                                                            },
                                                          ).toList(),
                                                    onChanged: (val) {
                                                      setState(
                                                        () {
                                                          if (val.toString() !=
                                                              "No Branch Found") {
                                                            con.receiveAddress
                                                                    .text =
                                                                val.toString();
                                                            _receiving_dropdown =
                                                                con.receiveAddress
                                                                    .text
                                                                    .toString();
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // AppTextField(
                                        //   hintText: "receivinglocation".tr,
                                        //   obsecureText: false,
                                        //   prefixIcon: ImageConstant.pin,
                                        //   border: true,
                                        //   color: Colors.transparent,
                                        //   controller: con.receiveAddress,
                                        //   errorMessage: "".obs,
                                        // ),
                                        const SizedBox(height: 10),
                                        if (con.isDiffAddress.value)
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.065,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                border: Border.all(
                                                    color: Colors.green)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      height: 60,
                                                      width: 30,
                                                      child: Icon(
                                                        Icons.pin_drop,
                                                        size: 32,
                                                        color: Color.fromARGB(
                                                            255, 87, 174, 91),
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    child: DropdownButton(
                                                      hint: _deliverydropdown ==
                                                              null
                                                          ? Text(
                                                              "deliverylocation"
                                                                  .tr,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontFamily:
                                                                      "roboto",
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          65,
                                                                          64,
                                                                          64)))
                                                          : Text(
                                                              _deliverydropdown!,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "roboto",
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          65,
                                                                          64,
                                                                          64)),
                                                            ),
                                                      isExpanded: true,
                                                      iconSize: 30.0,
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                      items: con2
                                                              .isLoading.value
                                                          ? ['No Branch Found']
                                                              .map(
                                                              (val) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: val,
                                                                  child:
                                                                      Text(val),
                                                                );
                                                              },
                                                            ).toList()
                                                          : con2.branches.map(
                                                              (val) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value:
                                                                      val.title,
                                                                  child: Text(val
                                                                      .title!),
                                                                );
                                                              },
                                                            ).toList(),
                                                      onChanged: (val) {
                                                        setState(
                                                          () {
                                                            if (val.toString() !=
                                                                "No Branch Found") {
                                                              con.deliveryAddress
                                                                      .text =
                                                                  val.toString();
                                                              _deliverydropdown = con
                                                                  .deliveryAddress
                                                                  .text
                                                                  .toString();
                                                            }
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        // AppTextField(
                                        //   border: true,
                                        //   obsecureText: false,
                                        //   prefixIcon: ImageConstant.pin,
                                        //   hintText: "deliverylocation".tr,
                                        //   color: Colors.transparent,
                                        //   controller: con.deliveryAddress,
                                        //   errorMessage: "".obs,
                                        // ),
                                        if (con.isDiffAddress.value)
                                          const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  con.isDiffAddress.value =
                                                      !con.isDiffAddress.value,
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color:
                                                          AppColors.appColor),
                                                ),
                                                child: Center(
                                                  child: con.isDiffAddress.value
                                                      ? const Icon(Icons.done)
                                                      : Container(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: Text(
                                                "deliverytoanotherlocation".tr,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xff707070),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: AppTextField(
                                                hintText: "receiveddate".tr,
                                                obsecureText: false,
                                                ontap: () => con.openDatePicker(
                                                  con.receiveDate,
                                                  con.receiveDateTime,
                                                ),
                                                readonly: true,
                                                controller: con.receiveDate,
                                                prefixIcon:
                                                    ImageConstant.calendar,
                                                border: true,
                                                color: Colors.transparent,
                                                iconColor:
                                                    const Color(0xff707070),
                                                errorMessage: "".obs,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: AppTextField(
                                                hintText: "deliverydate".tr,
                                                obsecureText: false,
                                                ontap: () => con.openDatePicker(
                                                  con.deliveryDate,
                                                  con.deliveryDateTime,
                                                ),
                                                readonly: true,
                                                controller: con.deliveryDate,
                                                prefixIcon:
                                                    ImageConstant.calendar,
                                                border: true,
                                                color: Colors.transparent,
                                                iconColor:
                                                    const Color(0xff707070),
                                                errorMessage: "".obs,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        AppButton(
                                          onPressed: () {
                                            if (_receiving_dropdown == null ||
                                                con.deliveryDate == "" ||
                                                con.receiveDate == "") {
                                              toast("fillmissingfields".tr);
                                            } else {
                                              Get.toNamed(
                                                  AppRoutes.carListScreen);
                                            }
                                            // Get.to(
                                            //   () => InitialContractScreen(
                                            //     onButton: () {},
                                            //   ),
                                            // );
                                          },
                                          text: "search".tr,
                                        ),
                                        // const SizedBox(height: 5),
                                        AppButton(
                                          onPressed: () {
                                            // Get.toNamed(AppRoutes
                                            //     .initialCarDetailScreen);
                                            Get.toNamed(
                                                AppRoutes.myReservationsScreen);
                                          },
                                          color: Colors.transparent,
                                          textColor:
                                              Color.fromARGB(255, 91, 158, 93),
                                          text: "alreadyhaveareservation".tr,
                                        ),
                                        // const SizedBox(height: 10),
                                        // Center(
                                        //   child: TextButton(
                                        //     onPressed: () => Get.to(() => ReservationScreen()),
                                        //     child: Text(
                                        //       "alreadyhaveareservation".tr,
                                        //       style: TextStyle(
                                        //         color: AppColors.appColor,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       TextButton(
                            //         onPressed: () => Get.to(() => CarListScreen()),
                            //         child: Text(
                            //           "offers".tr,
                            //           style: const TextStyle(
                            //             fontSize: 20,
                            //             color: Colors.black,
                            //           ),
                            //         ),
                            //       ),
                            //       GridView.builder(
                            //         itemCount: 2,
                            //         shrinkWrap: true,
                            //         physics: const NeverScrollableScrollPhysics(),
                            //         gridDelegate:
                            //             const SliverGridDelegateWithFixedCrossAxisCount(
                            //           crossAxisCount: 2,
                            //           crossAxisSpacing: 10,
                            //           childAspectRatio: 1.4,
                            //         ),
                            //         padding: const EdgeInsets.all(10),
                            //         itemBuilder: (BuildContext context, int index) {
                            //           return CarCardView(
                            //             carimage: ImageConstant.car,
                            //             onCardTap: () => Get.to(() => CarDetailScreen()),
                            //             title: "hyundai".tr,
                            //             subtitle: "sonata".tr,
                            //             price: "80",
                            //           );
                            //         },
                            //       ),
                            //       const SizedBox(height: 10),
                            //       TextButton(
                            //         onPressed: () => Get.to(() => CarListScreen()),
                            //         child: Text(
                            //           "categories".tr,
                            //           style: const TextStyle(
                            //             fontSize: 20,
                            //             color: Colors.black,
                            //           ),
                            //         ),
                            //       ),
                            //       const SizedBox(height: 5),
                            //       GridView.builder(
                            //         itemCount: 2,
                            //         shrinkWrap: true,
                            //         physics: const NeverScrollableScrollPhysics(),
                            //         gridDelegate:
                            //             const SliverGridDelegateWithFixedCrossAxisCount(
                            //           crossAxisCount: 2,
                            //           crossAxisSpacing: 10,
                            //           childAspectRatio: 1.4,
                            //         ),
                            //         padding: const EdgeInsets.all(10),
                            //         itemBuilder: (BuildContext context, int index) {
                            //           return CarCardView(
                            //             carimage: ImageConstant.car,
                            //             onCardTap: () => Get.to(() => CarDetailScreen()),
                            //             title: "hyundai".tr,
                            //             subtitle: "sonata".tr,
                            //             price: "80",
                            //           );
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   margin: const EdgeInsets.symmetric(horizontal: 20),
                            //   child: AppTextField(
                            //     hintText: "${'search'.tr}...".tr,
                            //     obsecureText: false,
                            //     prefixIcon: ImageConstant.search,
                            //     border: true,
                            //     color: Colors.transparent,
                            //     initialValue: "",
                            //     onChange: (value) {
                            //       con.search.value = value;
                            //     },
                            //     onFieldSubmitted: (e) {
                            //       con.vehicalList.value = [];
                            //       con.currentPage.value = 1;
                            //       con.getVehicles(true);
                            //     },
                            //     errorMessage: "".obs,
                            //   ),
                            // ),
                            // const SizedBox(height: 10),
                            con.isLoading.value
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Center(child: const AppLoader()),
                                  )
                                : con.vehicalList.isEmpty
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 30,
                                        ),
                                        child: Text(
                                          "nothinghereyet".tr,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "offers".tr,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 160,
                                                  child: ListView.builder(
                                                    controller: sc1,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        con.vehicalList.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                                int index) =>
                                                            Card(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(
                                                            () =>
                                                                CarDetailScreen(),
                                                            arguments: con
                                                                .vehicalList[
                                                                    index]
                                                                .id,
                                                          );
                                                        },
                                                        child: AspectRatio(
                                                          aspectRatio: 1.2,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black12,
                                                                  blurRadius:
                                                                      10,
                                                                )
                                                              ],
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  children: [
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${con.vehicalList[index].title}",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff444444),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${con.vehicalList[index].companyName}",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign: Get.locale ==
                                                                                const Locale("ar")
                                                                            ? TextAlign.left
                                                                            : TextAlign.right,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff444444),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child: con
                                                                          .vehicalList[
                                                                              index]
                                                                          .images!
                                                                          .isNotEmpty
                                                                      ? Image
                                                                          .network(
                                                                          "${con.vehicalList[index].images!.first}",
                                                                        )
                                                                      : Container(),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              AppColors.appColor,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomRight:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 16 : 0,
                                                                            ),
                                                                            topLeft:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 16 : 0,
                                                                            ),
                                                                            topRight:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 0 : 16,
                                                                            ),
                                                                            bottomLeft:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 0 : 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            FittedBox(
                                                                          child:
                                                                              Text(
                                                                            "details".tr,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 20),
                                                                        child:
                                                                            Align(
                                                                          alignment: Get.locale == const Locale("ar")
                                                                              ? Alignment.centerLeft
                                                                              : Alignment.centerRight,
                                                                          child:
                                                                              FittedBox(
                                                                            child:
                                                                                Text.rich(
                                                                              TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: 'SR${con.vehicalList[index].rateperday}',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: '/${'day'.tr}',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Color(0xff707070),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // Center(
                                                      //     child: Text(
                                                      //         'Dummy Card Text')),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 70,
                                                      horizontal: 6),
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _animateToIndex_right(
                                                              idx_right);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: Color
                                                                  .fromARGB(
                                                                      195,
                                                                      187,
                                                                      187,
                                                                      187)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_back_ios,
                                                              color:
                                                                  Colors.white,
                                                              size: 26,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          _animateToIndex_left(
                                                              idx_left);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: Color
                                                                  .fromARGB(
                                                                      195,
                                                                      187,
                                                                      187,
                                                                      187)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color:
                                                                  Colors.white,
                                                              size: 26,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "categories".tr,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 160,
                                                  child: ListView.separated(
                                                    // shrinkWrap: true,
                                                    controller: sc2,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    // scrollDirection: Axis.horizontal,
                                                    // physics:
                                                    //     const NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        con.vehicalList.length,

                                                    separatorBuilder:
                                                        (context, index) {
                                                      return const SizedBox(
                                                          height: 20);
                                                    },
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () => Get.to(
                                                          () =>
                                                              CarDetailScreen(),
                                                          arguments: con
                                                              .vehicalList[
                                                                  index]
                                                              .id,
                                                        ),
                                                        child: AspectRatio(
                                                          aspectRatio: 1.2,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black12,
                                                                  blurRadius:
                                                                      10,
                                                                )
                                                              ],
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  children: [
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${con.vehicalList[index].title}",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff444444),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${con.vehicalList[index].companyName}",
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign: Get.locale ==
                                                                                const Locale("ar")
                                                                            ? TextAlign.left
                                                                            : TextAlign.right,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff444444),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child: con
                                                                          .vehicalList[
                                                                              index]
                                                                          .images!
                                                                          .isNotEmpty
                                                                      ? Image
                                                                          .network(
                                                                          "${con.vehicalList[index].images!.first}",
                                                                        )
                                                                      : Container(),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              AppColors.appColor,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomRight:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 16 : 0,
                                                                            ),
                                                                            topLeft:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 16 : 0,
                                                                            ),
                                                                            topRight:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 0 : 16,
                                                                            ),
                                                                            bottomLeft:
                                                                                Radius.circular(
                                                                              Get.locale == const Locale("ar") ? 0 : 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            FittedBox(
                                                                          child:
                                                                              Text(
                                                                            "details".tr,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 20),
                                                                        child:
                                                                            Align(
                                                                          alignment: Get.locale == const Locale("ar")
                                                                              ? Alignment.centerLeft
                                                                              : Alignment.centerRight,
                                                                          child:
                                                                              FittedBox(
                                                                            child:
                                                                                Text.rich(
                                                                              TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: 'SR${con.vehicalList[index].rateperday}',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: '/${'day'.tr}',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Color(0xff707070),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 70,
                                                      horizontal: 6),
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          ind_animation_right(
                                                              idx_right2);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: Color
                                                                  .fromARGB(
                                                                      195,
                                                                      187,
                                                                      187,
                                                                      187)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_back_ios,
                                                              color:
                                                                  Colors.white,
                                                              size: 26,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          ind_animation_left(
                                                              idx_left2);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: Color
                                                                  .fromARGB(
                                                                      195,
                                                                      187,
                                                                      187,
                                                                      187)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        10),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color:
                                                                  Colors.white,
                                                              size: 26,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
