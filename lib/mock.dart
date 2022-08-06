var mockurls = [
  "https://drbaileyskincare.com/blogs/blog/can-you-be-allergic-to-a-face-mask",
  "https://drbaileyskincare.com/blogs/blog/dr-cynthia-baileys-tips-for-facial-seborrheic-dermatitis-control",
  "https://drbaileyskincare.com/blogs/blog/facial-irritation-from-n95-and-other-face-masks-during-the-covid-19-pandemic",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-skin-care-tricks-to-get-rid-of-thick-and-crusty-age-spots-on",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-advice-for-the-best-skin-care-during-chemotherapy",
  "https://drbaileyskincare.com/blogs/blog/how-to-correctly-use-retin-a-tretinoin-for-anti-aging-and-acne-skin-care",
  "https://drbaileyskincare.com/blogs/blog/tips-for-treating-perioral-dermatitis",
  "https://drbaileyskincare.com/blogs/blog/dr-oz-talks-about-noble-formula-zinc-soap",
  "https://drbaileyskincare.com/blogs/blog/cracked-dry-brittle-and-splitting-fingernails-dermatologists-tips",
  "https://drbaileyskincare.com/blogs/blog/seborrheic-dermatitis-2",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-tips-for-treating-facial-seborrheic-dermatitis",
  "https://drbaileyskincare.com/blogs/blog/how-do-you-combine-tretinoin-retin-a-and-glycolic-acid-products-for-anti-ag",
  "https://drbaileyskincare.com/blogs/blog/itchy-crusty-scaly-ears-more-on-seborrheic-dermatitis",
  "https://drbaileyskincare.com/blogs/blog/problems-with-using-dandruff-shampoos-for-a-facial-cleanser",
  "https://drbaileyskincare.com/blogs/blog/ask-dr-bailey-how-to-treat-deep-vertical-chest-wrinkles",
  "https://drbaileyskincare.com/blogs/blog/combination-anti-aging-skin-care-treatment-with-tretinoin-and-glycolic-acid",
  "https://drbaileyskincare.com/blogs/blog/eczema-on-your-eyelid",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-tips-for-dandruff-of-the-eyelash-line-aka-seborrheic-blephar",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-tips-for-dry-chapped-painful-hand-skin",
  "https://drbaileyskincare.com/blogs/blog/are-zinc-oxide-sunscreens-better",
  "https://drbaileyskincare.com/blogs/blog/can-you-keep-your-brows-and-eyelashes-during-chemotherapy",
  "https://drbaileyskincare.com/blogs/blog/pityrosporum-folliculitis-acne",
  "https://drbaileyskincare.com/blogs/blog/rosacea-skin-care-tips-from-my-dermatology-practice",
  "https://drbaileyskincare.com/blogs/blog/tretinoin-use-retin-a-and-renova-and-scaly-puffy-eyelids",
  "https://drbaileyskincare.com/blogs/blog/is-your-rough-dry-and-swollen-eyelid-skin-caused-by-an-allergic-dermatitis",
  "https://drbaileyskincare.com/blogs/blog/what-causes-itching-in-the-middle-of-the-back",
  "https://drbaileyskincare.com/blogs/blog/how-can-you-make-a-bikini-wax-less-painful",
  "https://drbaileyskincare.com/blogs/blog/does-light-break-down-tretinoin-retin-a-cream",
  "https://drbaileyskincare.com/blogs/blog/why-you-might-have-broken-facial-capillaries",
  "https://drbaileyskincare.com/blogs/blog/best-mens-skin-care-for-flaky-facial-skin",
  "https://drbaileyskincare.com/blogs/blog/what-are-milia-and-what-causes-them",
  "https://drbaileyskincare.com/blogs/blog/skin-drying-from-proactiv-retina-and-other-acne-treatment-products",
  "https://drbaileyskincare.com/blogs/blog/best-products-for-rosacea-oily-skin-and-blackheads",
  "https://drbaileyskincare.com/blogs/blog/how-to-get-rid-of-blackheads-a-dermatologist-explains",
  "https://drbaileyskincare.com/blogs/blog/what-is-poikiloderma-of-civatte",
  "https://drbaileyskincare.com/blogs/blog/pityrosporum-folliculitis-acne-treatment-even-many-doctors-dont-know-this",
  "https://drbaileyskincare.com/blogs/blog/can-you-get-a-facial-and-makeover-on-chemotherapy-part-1",
  "https://drbaileyskincare.com/blogs/blog/new-natural-organic-hypoallergenic-lip-balm",
  "https://drbaileyskincare.com/blogs/blog/best-treatment-for-flaky-facial-skin-from-dandruff-and-rosacea",
  "https://drbaileyskincare.com/blogs/blog/intertrigo-a-red-rash-in-the-skin-folds",
  "https://drbaileyskincare.com/blogs/blog/how-do-you-layer-skin-care-products-with-tretinoin",
  "https://drbaileyskincare.com/blogs/blog/how-do-you-know-if-you-are-allergic-to-hair-products-like-jessica-alba",
  "https://drbaileyskincare.com/blogs/blog/dermatologist-tips-to-treat-sebaceous-hyperplasia",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-advice-for-treating-poison-oak-and-poison-ivy",
  "https://drbaileyskincare.com/blogs/blog/5-skin-care-tips-for-retin-a-users",
  "https://drbaileyskincare.com/blogs/blog/chemical-burn-essential-oils",
  "https://drbaileyskincare.com/blogs/blog/whats-the-best-way-to-remove-skin-tags",
  "https://drbaileyskincare.com/blogs/blog/how-often-should-you-reapply-mineral-zinc-oxide-sunscreen",
  "https://drbaileyskincare.com/blogs/blog/do-you-need-sunscreen-in-winter-or-in-the-morning-and-after-4pm",
  "https://drbaileyskincare.com/blogs/blog/can-you-get-herpes-from-sharing-makeup-chapstick-or-lipstick",
  "https://drbaileyskincare.com/blogs/blog/the-7-myths-of-seborrheic-dermatitis-aka-dandruff",
  "https://drbaileyskincare.com/blogs/blog/how-long-is-it-safe-to-use-cortisone-on-the-face",
  "https://drbaileyskincare.com/blogs/blog/do-uv-sun-rays-go-through-windows",
  "https://drbaileyskincare.com/blogs/blog/cynthia-bailey-mds-recommendations-for-the-alkaline-mediterranean-diet",
  "https://drbaileyskincare.com/blogs/blog/doctors-advice-for-nail-care-cuticles-fingernails-hangnails-and-more",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-treatment-method-for-obagi-nu-derm-products",
  "https://drbaileyskincare.com/blogs/blog/belly-button-infection-and-discharge-causes-treatment-and-more",
  "https://drbaileyskincare.com/blogs/blog/is-it-safe-to-share-razors",
  "https://drbaileyskincare.com/blogs/blog/foot-calluses-the-good-the-bad-and-the-ugly",
  "https://drbaileyskincare.com/blogs/blog/chemotherapy-port-scars",
  "https://drbaileyskincare.com/blogs/blog/the-rosacea-and-oily-skin-care-conundrum-find-it-again-friday",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-tips-for-how-to-soften-rough-feet-and-heels-overnight",
  "https://drbaileyskincare.com/blogs/blog/what-causes-bumps-under-the-eyes",
  "https://drbaileyskincare.com/blogs/blog/a-new-explanation-for-intensely-itchy-arms",
  "https://drbaileyskincare.com/blogs/blog/treatments-for-vertical-lines-around-the-mouth",
  "https://drbaileyskincare.com/blogs/blog/remedies-for-the-dry-itchy-scalp-of-seborrheic-dermatitis-part-2",
  "https://drbaileyskincare.com/blogs/blog/what-causes-sunspots-on-skin",
  "https://drbaileyskincare.com/blogs/blog/how-to-unclog-your-clogged-pores",
  "https://drbaileyskincare.com/blogs/blog/dermatologist-discusses-genital-and-anal-itching",
  "https://drbaileyskincare.com/blogs/blog/5-skin-care-tips-to-heal-psoriasis",
  "https://drbaileyskincare.com/blogs/blog/how-to-treat-your-eczema",
  "https://drbaileyskincare.com/blogs/blog/how-to-get-smooth-summer-legs",
  "https://drbaileyskincare.com/blogs/blog/bumps-under-the-eyes-causes-and-treatments",
  "https://drbaileyskincare.com/blogs/blog/how-to-minimize-waxing-side-effects-from-bikini-waxing",
  "https://drbaileyskincare.com/blogs/blog/back-acne-chest-acne-will-they-ruin-your-summer",
  "https://drbaileyskincare.com/blogs/blog/dandruff-in-the-ear-canal-how-to-treat-an-itch-that-cant-be-scratched",
  "https://drbaileyskincare.com/blogs/blog/4-ways-to-beat-cystic-acne",
  "https://drbaileyskincare.com/blogs/blog/zinc-treatment-for-acne",
  "https://drbaileyskincare.com/blogs/blog/what-is-a-tan",
  "https://drbaileyskincare.com/blogs/blog/from-the-aesthetician-is-a-facial-a-treat-or-necessary-for-healthy-skin",
  "https://drbaileyskincare.com/blogs/blog/whats-the-best-skin-care-to-fade-sunspots",
  "https://drbaileyskincare.com/blogs/blog/does-using-a-daily-moisturizer-with-spf-15-give-you-enough-sun-protection",
  "https://drbaileyskincare.com/blogs/blog/do-mites-in-the-pores-cause-rosacea",
  "https://drbaileyskincare.com/blogs/blog/athletes-foot-what-it-is-how-treat-it-avoid-it",
  "https://drbaileyskincare.com/blogs/blog/sunscreen-for-teens-how-do-you-get-teens-to-wear-sunscreen",
  "https://drbaileyskincare.com/blogs/blog/can-sweat-cause-pimples-and-acne",
  "https://drbaileyskincare.com/blogs/blog/how-often-should-you-change-your-skin-care-regimen",
  "https://drbaileyskincare.com/blogs/blog/intertrigo-prevention-and-skin-care-tips",
  "https://drbaileyskincare.com/blogs/blog/got-clogged-pores-a-how-to-guide-for-unclogging-pores-find-it-again-friday",
  "https://drbaileyskincare.com/blogs/blog/can-you-have-rosacea-or-facial-dandruff-on-just-one-side-of-the-face",
  "https://drbaileyskincare.com/blogs/blog/the-pros-and-cons-of-lip-balms",
  "https://drbaileyskincare.com/blogs/blog/sunscreen-that-blocks-infrared",
  "https://drbaileyskincare.com/blogs/blog/how-high-of-an-spf-does-your-sunscreen-need-to-have",
  "https://drbaileyskincare.com/blogs/blog/how-to-layer-tretinoin-with-other-skin-care-products",
  "https://drbaileyskincare.com/blogs/blog/ask-dr-bailey-white-spots-on-the-arms-and-legs",
  "https://drbaileyskincare.com/blogs/blog/tips-for-blepharitis",
  "https://drbaileyskincare.com/blogs/blog/best-treatments-for-clogged-pores",
  "https://drbaileyskincare.com/blogs/blog/what-causes-itchy-arms",
  "https://drbaileyskincare.com/blogs/blog/understanding-hair-changes-during-chemotherapy",
  "https://drbaileyskincare.com/blogs/blog/how-to-treat-dry-skin-caused-from-retin-a-use-in-the-winter",
  "https://drbaileyskincare.com/blogs/blog/pityrosporum-folliculitis-summers-acne",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-tips-to-fix-bumpy-dry-elbows",
  "https://drbaileyskincare.com/blogs/blog/scalp-melanoma",
  "https://drbaileyskincare.com/blogs/blog/what-does-retinol-do-for-your-skin",
  "https://drbaileyskincare.com/blogs/blog/layering-skin-care-products-with-dimethicone",
  "https://drbaileyskincare.com/blogs/blog/anti-aging-skin-care-options-for-people-with-rosacea",
  "https://drbaileyskincare.com/blogs/blog/how-to-treat-highly-sensitive-skin-from-rosacea",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-tips-for-seborrheic-dermatitis-dry-flaky-skin-on-your-face-and-scalp",
  "https://drbaileyskincare.com/blogs/blog/dyshidrotic-eczema",
  "https://drbaileyskincare.com/blogs/blog/does-mineral-makeup-really-protect-your-skin-from-the-sun",
  "https://drbaileyskincare.com/blogs/blog/what-skin-care-products-are-best-after-obagi-nu-derm",
  "https://drbaileyskincare.com/blogs/blog/a-doctors-personal-experience-with-cold-caps-during-chemotherapy",
  "https://drbaileyskincare.com/blogs/blog/how-can-you-get-rid-of-skin-sun-spots",
  "https://drbaileyskincare.com/blogs/blog/natural-skin-care-product-allergen",
  "https://drbaileyskincare.com/blogs/blog/facial-skin-care-for-problem-skin-with-rosacea-seborrhea-and-clogged-pores",
  "https://drbaileyskincare.com/blogs/blog/should-you-apply-sunscreen-to-your-face-ears-even-if-you-wear-a-hat",
  "https://drbaileyskincare.com/blogs/blog/itchy-back-phenomenon-the-constant-hard-to-reach-itch-find-it-again-friday",
  "https://drbaileyskincare.com/blogs/blog/does-eating-olive-oil-prevent-wrinkles",
  "https://drbaileyskincare.com/blogs/blog/covered-in-mosquito-bites",
  "https://drbaileyskincare.com/blogs/blog/prescription-medication-and-cosmetic-procedures-to-treat-rosacea",
  "https://drbaileyskincare.com/blogs/blog/how-to-avoid-painful-ingrown-hairs",
  "https://drbaileyskincare.com/blogs/blog/how-to-treat-a-sunburn",
  "https://drbaileyskincare.com/blogs/blog/pityrosporum-folliculitis-acne-could-this-be-why-your-acne-wont-go-away",
  "https://drbaileyskincare.com/blogs/blog/can-emotional-stress-cause-skin-cancer",
  "https://drbaileyskincare.com/blogs/blog/know-your-options-for-anti-aging-rosacea-skin-care-find-it-again-friday",
  "https://drbaileyskincare.com/blogs/blog/do-you-itch-more-when-you-are-upset",
  "https://drbaileyskincare.com/blogs/blog/how-to-fix-your-splitting-nails-find-it-again-friday",
  "https://drbaileyskincare.com/blogs/blog/chapped-lips-the-remedy-depends-on-the-cause",
  "https://drbaileyskincare.com/blogs/blog/skin-tips-get-rid-of-those-pesky-sunspots",
  "https://drbaileyskincare.com/blogs/blog/why-you-dont-have-to-hide-nail-psoriasis-anymore",
  "https://drbaileyskincare.com/blogs/blog/the-alkaline-mediterranean-diet-a-dietary-magic-wand-for-overall-health-and",
  "https://drbaileyskincare.com/blogs/blog/is-it-safe-to-use-a-loofah-in-the-shower",
  "https://drbaileyskincare.com/blogs/blog/autoimmune-disease-and-your-skin-part-1",
  "https://drbaileyskincare.com/blogs/blog/best-mens-skin-care-for-clogged-pores-and-acne",
  "https://drbaileyskincare.com/blogs/blog/can-compact-fluorescent-light-bulbs-cause-skin-damage",
  "https://drbaileyskincare.com/blogs/blog/mole-removal",
  "https://drbaileyskincare.com/blogs/blog/why-you-have-crepey-skin",
  "https://drbaileyskincare.com/blogs/blog/how-to-care-for-the-sentive-skin-under-your-eyes",
  "https://drbaileyskincare.com/blogs/blog/trying-to-buy-znp-soap-online-or-in-stores",
  "https://drbaileyskincare.com/blogs/blog/dermatologists-recommendations-for-natural-skin-health-kefir-the-best-probi",
  "https://drbaileyskincare.com/blogs/blog/how-to-tell-a-sunspot-from-melanoma",
  "https://drbaileyskincare.com/blogs/blog/what-is-a-microdermabrasion-facial-treatment",
  "https://drbaileyskincare.com/blogs/blog/best-skin-moisturizer-application-practices-find-it-again-friday",
  "https://drbaileyskincare.com/blogs/blog/mens-skin-care-preventing-shaving-razor-bumps",
  "https://drbaileyskincare.com/blogs/blog/causes-thumbnail-ridging",
  "https://drbaileyskincare.com/blogs/blog/best-ingredients-to-look-for-in-acne-facial-cleansers",
  "https://drbaileyskincare.com/blogs/blog/the-best-treatments-for-sagging-turkey-neck",
  "https://drbaileyskincare.com/blogs/blog/skin-care-tips-for-dry-cracked-gardeners-hands",
  "https://drbaileyskincare.com/blogs/blog/how-to-shrink-the-appearance-of-large-pores",
  "https://drbaileyskincare.com/blogs/blog/how-to-treat-a-dry-nose-from-winter-or-chemotherapy",
  "https://drbaileyskincare.com/blogs/blog/what-is-cutibacterium-acnes",
  "https://drbaileyskincare.com/blogs/blog/what-causes-weak-splitting-nails",
  "https://drbaileyskincare.com/blogs/blog/treating-sun-damage-on-the-back-of-your-hands",
  "https://drbaileyskincare.com/blogs/blog/what-is-perioral-dermatitis",
  "https://drbaileyskincare.com/blogs/blog/best-natural-sunburn-treatment-remedies",
  "https://drbaileyskincare.com/blogs/blog/making-sense-of-the-vitamin-d-dilemma-and-sun-exposure",
  "https://drbaileyskincare.com/blogs/blog/organic-skin-care-beta-carotene",
  "https://drbaileyskincare.com/blogs/blog/pure-mineral-powder-is-best-makeup",
  "https://drbaileyskincare.com/blogs/blog/what-should-be-in-your-sunscreen",
  "https://drbaileyskincare.com/blogs/blog/what-is-scalp-eczema",
  "https://drbaileyskincare.com/blogs/blog/prescription-medicines-medical-problems-and-a-detox-cleansing-fast",
  "https://drbaileyskincare.com/blogs/blog/does-your-aloe-vera-gel-really-contain-aloe",
  "https://drbaileyskincare.com/blogs/blog/heal-chapped-hands-hand-dermatitis",
  "https://drbaileyskincare.com/blogs/blog/a-cleansing-diet-for-arthritis-joint-stiffness-and-overall-physical-well-being",
];