import 'package:flutter/material.dart';

class Cure extends StatelessWidget {
  String diseaseName;
  Cure(this.diseaseName);
  final disease = {
    "Tomato___healthy": "Your plant is already healthy",
    "Tomato___Septoria_leaf_spot":
        "Apply sulfur sprays or copper-based fungicides weekly at first sign of disease to prevent its spread. These organic fungicides will not kill leaf spot, but prevent the spores from germinating.",
    "Corn_(maize)___healthy": "Your plant is already healthy",
    "Peach___healthy": "Your plant is already healthy",
    "Apple___Cedar_apple_rust":
        "Remove galls from infected junipers. In some cases, juniper plants should be removed entirely. Apply preventative, disease-fighting fungicides labeled for use on apples weekly, starting with bud break, to protect trees from spores being released by the juniper host.",
    "Squash___Powdery_mildew":
        "Combine one tablespoon baking soda and one-half teaspoon of liquid, non-detergent soap with one gallon of water, and spray the mixture liberally on the plants. Mouthwash. The mouthwash you may use on a daily basis for killing the germs in your mouth can also be effective at killing powdery mildew spores.",
    "Grape___healthy": "Your plant is already healthy",
    "Tomato___Tomato_mosaic_virus":
        "By treating seeds with 10% Trisodium Phosphate for at least 15 minutes. Whenever possible, virus resistant tomatoes should be planted. Additionally, removal of symptomatic plants may slow the spread of disease once it occurs.",
    "Tomato___Bacterial_spot":
        "A plant with bacterial spot cannot be cured. Remove symptomatic plants from the field or greenhouse to prevent the spread of bacteria to healthy plants. Burn, bury or hot compost the affected plants and DO NOT eat symptomatic fruit.",
    "Corn_(maize)___Common_rust_":
        "Spray of mancozeb@ 2.5g/litre of water at first appearance of pustules. Prefer early maturing varieties.",
    "Cherry_(including_sour)___Powdery_mildew":
        "keep irrigation water off developing fruit and leaves by using irrigation that does not wet the leaves. Also, keep irrigation sets as short as possible. Follow cultural practices that promote good air circulation, such as pruning, and moderate shoot growth through judicious nitrogen management.",
    "Apple___Apple_scab":
        "Choose resistant varieties when possible. Rake under trees and destroy infected leaves to reduce the number of fungal spores available to start the disease cycle over again next spring. Water in the evening or early morning hours (avoid overhead irrigation) to give the leaves time to dry out before infection can occur.",
    "Potato___Late_blight":
        "Fungicides are available for management of late blight on potato.",
    "Strawberry___Leaf_scorch":
        "Remove foliage and crop residues after picking or at renovation to remove inoculum and delay disease increase in late summer and fall. Fungicide treatments are effective during the flowering period, and during late summer and fall.",
    "Orange___Haunglongbing_(Citrus_greening)":
        "Bactericides are a topical treatment aimed at slowing the bacteria that cause citrus greening. The bactericides do not absorb into the tree or fruit. While this is a relatively new treatment for citrus trees.",
    "Corn_(maize)___Northern_Leaf_Blight":
        "Fungicide application to reduce yield loss and improve harvestability.",
    "Pepper,_bell___healthy": "Your plant is already healthy",
    "Grape___Black_rot":
        "Cut off the affected parts of the grape vine with a sterile knife. Remove all spotted leaves and the black, mummified grapes. Be extremely thorough and make sure you remove all parts of the plant that are affected by the black rot. Place fans in the growing area to keep the plants dry.",
    "Pepper,_bell___Bacterial_spot":
        "Spray every 10-14 days with fixed copper (organic fungicide) to slow down the spread of infection. Rotate peppers to a different location if infections are severe and cover the soil with black plastic mulch or black landscape fabric prior to planting.",
    "Tomato___Early_blight":
        " Treat organically with copper spray. Follow label directions. You can apply until the leaves are dripping, once a week and after each rain. Or you can treat it organically with a biofungicide like Serenade.",
    "Blueberry___healthy": "Your plant is already healthy",
    "Cherry_(including_sour)___healthy": "Your plant is already healthy",
    "Potato___healthy": "Your plant is already healthy",
    "Apple___Black_rot":
        "Fungicides like copper-based sprays and lime sulfur, can be used to control black rot.",
    "Grape___Leaf_blight_(Isariopsis_Leaf_Spot)":
        "Fungicides sprayed for other diseases in the season may help to reduce this disease.",
    "Tomato___Target_Spot":
        "Target spot tomato treatment requires a multi-pronged approach. Pay careful attention to air circulation, as target spot of tomato thrives in humid conditions. Grow the plants in full sunlight. Be sure the plants aren’t crowded and that each tomato has plenty of air circulation. Cage or stake tomato plants to keep the plants above the soil.",
    "Tomato___Spider_mitesTwo-spotted_spider_mite":
        "A natural way to kill spider mites on your plants is to mix one part rubbing alcohol with one part water, then spray the leaves. The alcohol will kill the mites without harming the plants. Another natural solution to get rid of these tiny pests is to use liquid dish soap.",
    "Tomato___Tomato_Yellow_Leaf_Curl_Virus":
        "Treatment for this disease include insecticides, hybrid seeds, and growing tomatoes under greenhouse conditions.",
    "Apple___healthy": "Your plant is already healthy",
    "Soybean___healthy": "Your plant is already healthy",
    "Grape___Esca_(Black_Measles)":
        "Lime sulfur sprays can manage the trio of pathogens that cause black measles.",
    "Raspberry___healthy": "Your plant is already healthy",
    "Strawberry___healthy": "Your plant is already healthy",
    "Peach___Bacterial_spot":
        "Compounds available for use on peach for bacterial spot include copper, oxytetracycline (Mycoshield and generic equivalents), and syllit+captan to minimize disease effect.",
    "Potato___Early_blight":
        "Avoid overhead irrigation. Do not dig tubers until they are fully mature in order to prevent damage. Do not use a field for potatoes that was used for potatoes or tomatoes the previous year.",
    "Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot":
        "The disease can be reduced when a crop other than corn is planted for ≥2 years in that given area. Also Fungicides, if sprayed early in season before initial damage, can be effective in reducing disease.",
    "Tomato___Leaf_Mold":
        "By adequating row and plant spacing that promote better air circulation through the canopy reducing the humidity; preventing excessive nitrogen on fertilization since nitrogen out of balance enhances foliage disease development.",
    "Tomato___Late_blight":
        "Remove all affected leaves and burn them or place them in the garbage. Mulch around the base of the plant with straw, wood chips or other natural mulch to prevent fungal spores in the soil from splashing on the plant."
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Disease Recognition'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Cure : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(disease[diseaseName]),
            ),
          ],
        ),
      ),
    );
  }
}
