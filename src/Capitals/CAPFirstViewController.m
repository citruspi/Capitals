//
//  CAPFirstViewController.m
//  Capitals
//
//  Created by Mihir Singh on 6/6/12.
//

#import "CAPFirstViewController.h"

@interface CAPFirstViewController ()

@end

@implementation CAPFirstViewController

@synthesize score, country, capital;

NSArray *capitals, *countries;

int key1, key2, sc;
BOOL isTrue;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    [self warmup]; //Stuff to run one time 
    [self setup]; //Set up the first game
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
 

- (IBAction)saidY{
    if(isTrue)
        sc = sc + 1;
    else 
        sc = sc - 1;

    [self process];
    [self setup];
}

- (IBAction)saidN{
    if(isTrue)
        sc = sc - 1;
    else 
        sc = sc + 1;
    
    [self process];
    [self setup];
}

- (void)setup{
    
    key1 = arc4random() % 249;
    
    [capital setText:[capitals objectAtIndex: key1]];
    
    key2 = arc4random() % 249;

    [country setText:[countries objectAtIndex: key2]];
    
    isTrue = (key1 == key2);
}

- (void)warmup{
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wood.jpg"]];
    self.view.backgroundColor = background;
    
    [self fill];
}

- (void)reset{
    score.text = [NSString stringWithFormat:@"000"];
    sc = 0;
    [self setup];
}
- (void)process{
    
    if(sc < 0)
        sc = 0;
    
    if(sc == 250){
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle: @"You Won!"
                                   message: @"You got a score of 250."
                                  delegate: self
                         cancelButtonTitle: @"Ok, whatever..."
                         otherButtonTitles: nil];
        [alert show];
        sc = 0;
        score.text = [NSString stringWithFormat:@"000"];
    }
    
    else{
        
        if (sc < 10){
            score.text = [NSString stringWithFormat:@"00%d", sc];
        }
        
        else {
            if(sc<100)
                score.text = [NSString stringWithFormat:@"0%d", sc];
            else
                score.text = [NSString stringWithFormat:@"%d", sc];
        }    
    }
}

- (void)fill{
    countries = [NSArray arrayWithObjects:@"Andorra",@"United Arab Emirates",@"Afghanistan",@"Antigua and Barbuda",@"Anguilla",@"Albania",@"Armenia",@"Angola",@"Antarctica",@"Argentina",@"American Samoa",@"Austria",@"Australia",@"Aruba",@"Åland",@"Azerbaijan",@"Bosnia and Herzegovina",@"Barbados",@"Bangladesh",@"Belgium",@"Burkina Faso",@"Bulgaria",@"Bahrain",@"Burundi",@"Benin",@"Saint Barthélemy",@"Bermuda",@"Brunei",@"Bolivia",@"Bonaire",@"Brazil",@"Bahamas",@"Bhutan",@"Bouvet Island",@"Botswana",@"Belarus",@"Belize",@"Canada",@"Cocos [Keeling] Islands",@"Congo",@"Central African Republic",@"Republic of the Congo",@"Switzerland",@"Ivory Coast",@"Cook Islands",@"Chile",@"Cameroon",@"China",@"Colombia",@"Costa Rica",@"Cuba",@"Cape Verde",@"Curacao",@"Christmas Island",@"Cyprus",@"Czech Republic",@"Germany",@"Djibouti",@"Denmark",@"Dominica",@"Dominican Republic",@"Algeria",@"Ecuador",@"Estonia",@"Egypt",@"Western Sahara",@"Eritrea",@"Spain",@"Ethiopia",@"Finland",@"Fiji",@"Falkland Islands",@"Micronesia",@"Faroe Islands",@"France",@"Gabon",@"United Kingdom",@"Grenada",@"Georgia",@"French Guiana",@"Guernsey",@"Ghana",@"Gibraltar",@"Greenland",@"Gambia",@"Guinea",@"Guadeloupe",@"Equatorial Guinea",@"Greece",@"South Georgia and the South Sandwich Islands",@"Guatemala",@"Guam",@"Guinea-Bissau",@"Guyana",@"Hong Kong",@"Heard Island and McDonald Islands",@"Honduras",@"Croatia",@"Haiti",@"Hungary",@"Indonesia",@"Ireland",@"Israel",@"Isle of Man",@"India",@"British Indian Ocean Territory",@"Iraq",@"Iran",@"Iceland",@"Italy",@"Jersey",@"Jamaica",@"Jordan",@"Japan",@"Kenya",@"Kyrgyzstan",@"Cambodia",@"Kiribati",@"Comoros",@"Saint Kitts and Nevis",@"North Korea",@"South Korea",@"Kuwait",@"Cayman Islands",@"Kazakhstan",@"Laos",@"Lebanon",@"Saint Lucia",@"Liechtenstein",@"Sri Lanka",@"Liberia",@"Lesotho",@"Lithuania",@"Luxembourg",@"Latvia",@"Libya",@"Morocco",@"Monaco",@"Moldova",@"Montenegro",@"Saint Martin",@"Madagascar",@"Marshall Islands",@"Macedonia",@"Mali",@"Myanmar [Burma]",@"Mongolia",@"Macao",@"Northern Mariana Islands",@"Martinique",@"Mauritania",@"Montserrat",@"Malta",@"Mauritius",@"Maldives",@"Malawi",@"Mexico",@"Malaysia",@"Mozambique",@"Namibia",@"New Caledonia",@"Niger",@"Norfolk Island",@"Nigeria",@"Nicaragua",@"Netherlands",@"Norway",@"Nepal",@"Nauru",@"Niue",@"New Zealand",@"Oman",@"Panama",@"Peru",@"French Polynesia",@"Papua New Guinea",@"Philippines",@"Pakistan",@"Poland",@"Saint Pierre and Miquelon",@"Pitcairn Islands",@"Puerto Rico",@"Palestine",@"Portugal",@"Palau",@"Paraguay",@"Qatar",@"Réunion",@"Romania",@"Serbia",@"Russia",@"Rwanda",@"Saudi Arabia",@"Solomon Islands",@"Seychelles",@"Sudan",@"Sweden",@"Singapore",@"Saint Helena",@"Slovenia",@"Svalbard and Jan Mayen",@"Slovakia",@"Sierra Leone",@"San Marino",@"Senegal",@"Somalia",@"Suriname",@"South Sudan",@"São Tomé and Príncipe",@"El Salvador",@"Sint Maarten",@"Syria",@"Swaziland",@"Turks and Caicos Islands",@"Chad",@"French Southern Territories",@"Togo",@"Thailand",@"Tajikistan",@"Tokelau",@"East Timor",@"Turkmenistan",@"Tunisia",@"Tonga",@"Turkey",@"Trinidad and Tobago",@"Tuvalu",@"Taiwan",@"Tanzania",@"Ukraine",@"Uganda",@"U.S. Minor Outlying Islands",@"United States",@"Uruguay",@"Uzbekistan",@"Vatican City",@"Saint Vincent and the Grenadines",@"Venezuela",@"British Virgin Islands",@"U.S. Virgin Islands",@"Vietnam",@"Vanuatu",@"Wallis and Futuna",@"Samoa",@"Kosovo",@"Yemen",@"Mayotte",@"South Africa",@"Zambia",@"Zimbabwe",nil];
    
    capitals = [NSArray arrayWithObjects:@"Andorra la Vella",@"Abu Dhabi",@"Kabul",@"St. John's",@"The Valley",@"Tirana",@"Yerevan",@"Luanda",@"Array",@"Buenos Aires",@"Pago Pago",@"Vienna",@"Canberra",@"Oranjestad",@"Mariehamn",@"Baku",@"Sarajevo",@"Bridgetown",@"Dhaka",@"Brussels",@"Ouagadougou",@"Sofia",@"Manama",@"Bujumbura",@"Porto-Novo",@"Gustavia",@"Hamilton",@"Bandar Seri Begawan",@"Sucre",@"Array",@"Brasília",@"Nassau",@"Thimphu",@"Array",@"Gaborone",@"Minsk",@"Belmopan",@"Ottawa",@"West Island",@"Kinshasa",@"Bangui",@"Brazzaville",@"Berne",@"Yamoussoukro",@"Avarua",@"Santiago",@"Yaoundé",@"Beijing",@"Bogotá",@"San José",@"Havana",@"Praia",@"Willemstad",@"The Settlement",@"Nicosia",@"Prague",@"Berlin",@"Djibouti",@"Copenhagen",@"Roseau",@"Santo Domingo",@"Algiers",@"Quito",@"Tallinn",@"Cairo",@"El Aaiún",@"Asmara",@"Madrid",@"Addis Ababa",@"Helsinki",@"Suva",@"Stanley",@"Palikir",@"Tórshavn",@"Paris",@"Libreville",@"London",@"St. George's",@"Tbilisi",@"Cayenne",@"St Peter Port",@"Accra",@"Gibraltar",@"Nuuk",@"Banjul",@"Conakry",@"Basse-Terre",@"Malabo",@"Athens",@"Grytviken",@"Guatemala City",@"Hagåtña",@"Bissau",@"Georgetown",@"Hong Kong",@"Array",@"Tegucigalpa",@"Zagreb",@"Port-au-Prince",@"Budapest",@"Jakarta",@"Dublin",@"Array",@"Douglas",@"New Delhi",@"Array",@"Baghdad",@"Tehran",@"Reykjavik",@"Rome",@"Saint Helier",@"Kingston",@"Amman",@"Tokyo",@"Nairobi",@"Bishkek",@"Phnom Penh",@"Tarawa",@"Moroni",@"Basseterre",@"Pyongyang",@"Seoul",@"Kuwait City",@"George Town",@"Astana",@"Vientiane",@"Beirut",@"Castries",@"Vaduz",@"Colombo",@"Monrovia",@"Maseru",@"Vilnius",@"Luxembourg",@"Riga",@"Tripoli",@"Rabat",@"Monaco",@"Chişinău",@"Podgorica",@"Marigot",@"Antananarivo",@"Majuro",@"Skopje",@"Bamako",@"Nay Pyi Taw",@"Ulan Bator",@"Macao",@"Saipan",@"Fort-de-France",@"Nouakchott",@"Plymouth",@"Valletta",@"Port Louis",@"Malé",@"Lilongwe",@"Mexico City",@"Kuala Lumpur",@"Maputo",@"Windhoek",@"Noumea",@"Niamey",@"Kingston",@"Abuja",@"Managua",@"Amsterdam",@"Oslo",@"Kathmandu",@"Array",@"Alofi",@"Wellington",@"Muscat",@"Panama City",@"Lima",@"Papeete",@"Port Moresby",@"Manila",@"Islamabad",@"Warsaw",@"Saint-Pierre",@"Adamstown",@"San Juan",@"Array",@"Lisbon",@"Melekeok - Palau State Capital",@"Asunción",@"Doha",@"Saint-Denis",@"Bucharest",@"Belgrade",@"Moscow",@"Kigali",@"Riyadh",@"Honiara",@"Victoria",@"Khartoum",@"Stockholm",@"Singapore",@"Jamestown",@"Ljubljana",@"Longyearbyen",@"Bratislava",@"Freetown",@"San Marino",@"Dakar",@"Mogadishu",@"Paramaribo",@"Juba",@"São Tomé",@"San Salvador",@"Philipsburg",@"Damascus",@"Mbabane",@"Cockburn Town",@"N'Djamena",@"Port-aux-Français",@"Lomé",@"Bangkok",@"Dushanbe",@"Array",@"Dili",@"Ashgabat",@"Tunis",@"Nuku'alofa",@"Ankara",@"Port of Spain",@"Funafuti",@"Taipei",@"Dodoma",@"Kyiv",@"Kampala",@"Array",@"Washington",@"Montevideo",@"Tashkent",@"Vatican",@"Kingstown",@"Caracas",@"Road Town",@"Charlotte Amalie",@"Hanoi",@"Port Vila",@"Mata-Utu",@"Apia",@"Pristina",@"Sanaa",@"Mamoutzou",@"Pretoria",@"Lusaka",@"Harare",nil];

}

@end