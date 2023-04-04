import 'package:shared_preferences/shared_preferences.dart';

List<dynamic> diseases = [
  "Coccidiosis",
  "Salmonella",
  "Pcr Cocidiosis",
  "Pcr Salmonella",
  "NCD",
  "Pcr NCD"
];

Map<String, bool> symptomsList = {
  "Weight loss": false,
  "Loss of appetite": false,
  "Swollen joints": false,
  "Lameness": false,
  "Nasal discharge": false,
  "Ocular discharge": false,
  "Ruffled feathers": false,
  "Diarrhea": false,
  "Mites": false,
  "Egg production decrease": false,
  "Inability to absorb nutrients": false,
  "Distinctive bumps": false,
  "Warts": false,
  "Stunted growth": false,
  "Edema in the comb": false,
  "Discoloration": false,
  "Coughing and sneezing": false,
  "Swelling": false,
  "Rales": false,
  "Gasping": false,
  "Muscular tremors": false,
  "Opisthotonus": false,
  "Closed eyes": false,
  "Facial swelling": false,
  "Increased thirst": false,
  "Lethargy": false,
  "Profuse tear secretion": false,
  "Facial skin edema": false,
  "Progressing tremors": false,
  "Drowsy": false,
  "Head droop": false,
  "Laying on ground": false,
  "Thick large white patches on the inside the mouth and crop areas": false,
  "Crusty looking eyes": false,
  "Hyperemic": false,
  "High fever": false,
  "Paralysis": false,
  "Dehydration": false,
  "Unkempt feathers": false,
  "Yellow fecal droppings": false,
  "Dullness": false,
  "Reduction in the size of the egg": false,
  "Rough scaly feathers": false,
  "Bloated abdomen": false,
  "Brittle bones": false,
  "Redness or scrabs on skin": false
};

Map<String, String> symptomsListForBackend = {
  "Weight loss": "weight_loss",
  "Loss of appetite": "loss_of_appetite",
  "Swollen joints": "swollen_joints",
  "Lameness": "lameness",
  "Nasal discharge": "nasal_discharge",
  "Ocular discharge": "ocular_discharge",
  "Ruffled feathers": "ruffled_feathers",
  "Diarrhea": "diarrhea",
  "Mites": "mites",
  "Egg production decrease": "egg_production_decrease",
  "Inability to absorb nutrients": "inability_to_absorb_nutrients",
  "Distinctive bumps": "distinctive_bumps",
  "Warts": "warts",
  "Stunted growth": "stunted_growth",
  "Edema in the comb": "edema_in_the_comb",
  "Discoloration": "discoloration",
  "Coughing and sneezing": "coughing_and_sneezing",
  "Swelling": "swelling",
  "Rales": "rales",
  "Gasping": "gasping",
  "Muscular tremors": "muscular_tremors",
  "Opisthotonus": "opisthotonus",
  "Closed eyes": "Closed_eyes",
  "Facial swelling": "facial_swelling",
  "Increased thirst": "increased_thirst",
  "Lethargy": "lethargy",
  "Profuse tear secretion": "profuse_tear_secretion",
  "Facial skin edema": "facial_skin_edema",
  "Progressing tremors": "progressing_tremors",
  "Drowsy": "drowsy",
  "Head droop": "head_droop",
  "Laying on ground": "laying_on_ground",
  "Thick large white patches on the inside the mouth and crop areas":
      "Thick_large_white_patches_on_the_inside_the_mouth_and_crop_areas",
  "Crusty looking eyes": "Crusty_looking_eyes",
  "Hyperemic": "hyperemic",
  "High fever": "high_fever",
  "Paralysis": "paralysis",
  "Dehydration": "dehydration",
  "Unkempt feathers": "unkempt_feathers",
  "Yellow fecal droppings": "yellow_fecal_droppings",
  "Dullness": "dullness",
  "Reduction in the size of the egg": "reduction_in_the_size_of_the_egg",
  "Rough scaly feathers": "Rough_scaly_feathers",
  "Bloated abdomen": "bloated_abdomen",
  "Brittle bones": "brittle_bones",
  "Redness or scrabs on skin": "redness_or_scrabs_on_skin"
};