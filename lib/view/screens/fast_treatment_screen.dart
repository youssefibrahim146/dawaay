import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:dawaay/view/widgets/expanded_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class FastTreatmentScreen extends StatelessWidget {
  const FastTreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExpandedTileController buttockMuscleController =
        ExpandedTileController(isExpanded: false);
    ExpandedTileController achillesTendonitisController =
        ExpandedTileController(isExpanded: false);
    ExpandedTileController stomachColdController =
        ExpandedTileController(isExpanded: false);
    ExpandedTileController crampController =
        ExpandedTileController(isExpanded: false);
    ExpandedTileController coldInjuryController =
        ExpandedTileController(isExpanded: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: DawaayColors.kprimaryColor,
        title: const Text(
          'Fast Treatment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandedTileWidget(
                title: 'Buttock Muscle Strain',
                content:
                    '1. Gently massage the muscle after stretching.\n2. Place a warm towel on the affected muscle.\n3. Apply an ice bag after applying the warm towel. You can also massage using an ice bag.\n4. Drinking water and keeping the body hydrated helps to feel relaxed and treat muscle tension in the buttocks.\n5.Take a painkiller if you continue to feel muscle tension in the buttocks.',
                controller: buttockMuscleController,
              ),
              ExpandedTileWidget(
                title: 'Achilles tendonitis',
                content:
                    'Achilles tendonitis can be treated by following the following tips and instructions:\n1. Take painkillers that belong to the group of non-steroidal anti-inflammatory drugs in high doses, only under the supervision of a specialist doctor.\n2. It is necessary to get some rest while stabilizing the injury site.\n3. It is necessary to apply cold and hot compresses sequentially, or according to the doctor’s instructions.',
                controller: achillesTendonitisController,
              ),
              ExpandedTileWidget(
                title: 'Stomach Cold',
                content:
                    'Stomach cold in children\n1. Avoid giving the child solid foods for a few hours until dehydration is treated.\n2. Give children small sips of water and drinks, such as ginger ale.\n3. Giving older children ice-cold juices or ice chips, as this helps treat dehydration.\n4. Wait 15 to 20 minutes before giving the child any fluids if he or she is vomiting.',
                controller: stomachColdController,
              ),
              ExpandedTileWidget(
                title: 'Cramp',
                content:
                    '1. Compress with a hot cloth, heating pad, or bag.\n2. Compress with a cold cloth or ice after wrapping it in a towel.\n3. Stretching the muscles that hurt you.\n4. Your doctor may prescribe an anti-inflammatory medication such as ibuprofen.',
                controller: crampController,
              ),
              ExpandedTileWidget(
                title: 'Cold Injury',
                content:
                    '1. Treating hypothermia and the injury that caused it.\n2. Identify the type and severity of the injury.\n3. Remove jewelry and any materials that may constrict blood vessels.\n4. Go to the hospital as quickly as possible.\n5. Use painkillers such as ibuprofen.\n6. Leave the affected area to air dry and avoid rubbing it.\n7. Apply aloe vera cream or gel to the affected area.',
                controller: coldInjuryController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
