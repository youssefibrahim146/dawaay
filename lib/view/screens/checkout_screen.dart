import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:dawaay/controller/chechout_controller.dart';
import 'package:dawaay/view/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:get/get.dart';

class CheckoutScreen extends GetWidget<CheckoutController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GapWidget(30),
              rounderContainerWidget("Add your location"),
              const GapWidget(30),

              /// location
              Obx(() {
                return Center(
                  child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        border: Border.all(color: DawaayColors.kprimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: controller.determinePosition,
                        child: Column(
                          children: [
                            Icon(
                              controller.isLocation.value
                                  ? Icons.done_all
                                  : Icons.location_on_outlined,
                              size: 30,
                            ),
                            const GapWidget(10),
                            Text(
                              controller.isLocation.value
                                  ? 'Done'
                                  : 'Get Location',
                              style: TextStyle(
                                color: DawaayColors.kprimaryColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              }),
              const GapWidget(30),
              rounderContainerWidget("Payment method"),
              const GapWidget(30),
              Obx(() {
                return Center(
                  child: InkWell(
                    onTap: () {
                      controller.cashOnDeliveryOnClick();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: controller.isCashOnDelivery.value
                            ? DawaayColors.kprimaryColor
                            : Colors.white,
                        border: Border.all(
                          color: DawaayColors.kprimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.money_rounded,
                            size: 25,
                            color: controller.isCashOnDelivery.value
                                ? Colors.white
                                : Colors.black,
                          ),
                          const GapWidget(10),
                          Text(
                            'Cash on delivery',
                            style: TextStyle(
                              color: controller.isCashOnDelivery.value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const GapWidget(30),
              Obx(() {
                return Container(
                  decoration: BoxDecoration(
                    color: controller.isCreditCard.value
                        ? DawaayColors.kprimaryColor
                        : Colors.white,
                    border: Border.all(
                      color: DawaayColors.kprimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: ExpandedTile(
                    theme: ExpandedTileThemeData(
                      headerColor: controller.isCreditCard.value
                          ? DawaayColors.kprimaryColor
                          : Colors.white,
                    ),
                    title: InkWell(
                      onTap: () {
                        controller.isCashOnDelivery.value = false;
                        controller.isCreditCard.value = true;
                        controller.expandedTileController.toggle();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: controller.isCreditCard.value
                                ? Colors.white
                                : Colors.black,
                            size: 25,
                          ),
                          const GapWidget(10),
                          Text(
                            'Credit card',
                            style: TextStyle(
                              fontSize: 15,
                              color: controller.isCreditCard.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller: controller.expandedTileController,
                    content: Column(
                      children: [
                        const GapWidget(10),
                        TextFormField(
                          controller: controller.cardNumberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Card number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const GapWidget(10),
                        TextFormField(
                          controller: controller.cardHolderNameController,
                          decoration: const InputDecoration(
                            labelText: 'Card holder name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const GapWidget(10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.expiryDateController,
                                decoration: const InputDecoration(
                                  labelText: 'Expiry date',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const GapWidget(10),
                            Expanded(
                              child: TextFormField(
                                controller: controller.cvvController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'CVV',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const GapWidget(10),
                      ],
                    ),
                  ),
                );
              }),
              const GapWidget(30),
              Obx(() {
                return Center(
                  child: ElevatedButton(
                    onPressed: () => controller.confirmYourOrderOnClick(data),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DawaayColors.kprimaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Confirm your order',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                  ),
                );
              }),
              const GapWidget(40),
            ],
          ),
        ),
      ),
    );
  }

  Container rounderContainerWidget(
    String title,
  ) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: DawaayColors.kprimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
