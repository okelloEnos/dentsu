int pageTransitionValue = 500;

const String baseUrl = "https://www.champion.pesakit.net/api/champions";
// 60 seconds
const Duration sendTimeout = Duration(seconds: 60);
const Duration receiveTimeout = Duration(seconds: 60);
const Duration connectTimeout = Duration(seconds: 60);

const String accessToken = "access_token";

// table names
const String leadTable = "Lead";
const String leadImageTable = "LeadImage";
const String productsTable = "Products";
const String servicesTable = "Services";
const String countyTable = "County";
const String subCountyTable = "SubCounty";
const String wardTable = "Ward";
const String profileTable = "Profile";
const String commissionTable = "Commission";

// shared preferences keys
// const String firstTimeLeadFetch = "first_time_lead_fetch";
// const String firstTimeCountiesFetch = "first_time_counties_fetch";
// const String firstTimeSubCountiesFetch = "first_time_sub_counties_fetch";
// const String firstTimeWardFetch = "first_time_ward_fetch";
