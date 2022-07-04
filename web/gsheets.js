const CLIENT_ID = '23161908784-febdr9vgq8atgt847uhs14ak1abpphg8.apps.googleusercontent.com';
const API_KEY = "AIzaSyDBJP82rBZPTBO9SlxHaFuFRvMZcjp8TV0";

// Discovery doc URL for APIs used by the quickstart
const DISCOVERY_DOC = 'https://sheets.googleapis.com/$discovery/rest?version=v4';

// Authorization scopes required by the API; multiple scopes can be
// included, separated by spaces.
const SCOPES =

    'https://www.googleapis.com/auth/drive.file';


let tokenClient;
let gapiInited = false;
let gisInited = false;


/**
 * Callback after api.js is loaded.
 */
async function gapiLoaded() {
    gapi.load('client', intializeGapiClient);
}

/**
 * Callback after the API client is loaded. Loads the
 * discovery doc to initialize the API.
 */
async function intializeGapiClient() {
    await gapi.client.init({
        apiKey: API_KEY,
        discoveryDocs: [DISCOVERY_DOC],
    });
    gapiInited = true;

}

/**
 * Callback after Google Identity Services are loaded.
 */
function gisLoaded() {
    tokenClient = google.accounts.oauth2.initTokenClient({
        client_id: CLIENT_ID,
        scope: SCOPES,
        callback: '', // defined later
    });
    gisInited = true;


}


/**
 * Sign in the user upon button click.
 */
function handleAuthClick(sheetData) {
    tokenClient.callback = async (resp) => {
        if (resp.error !== undefined) {
            throw (resp);
        }
    var url = ""
    await    gapi.client.sheets.spreadsheets.create({
            properties: {
                title: "isus te jeba krvavi"
            }
        }).then(async(response) => {
            var spreadsheetId = response.result.spreadsheetId;
            var values = JSON.parse(sheetData)
            var data = [];

            data.push({
                range: "Sheet1",
                values: values
            });

            var body = {
                data: data,
                valueInputOption: "USER_ENTERED",

            };
          await  gapi.client.sheets.spreadsheets.values.batchUpdate({
                spreadsheetId: spreadsheetId,
                resource: body
            }).then((response) => {
              console.log(response)
                var result = response.result;
                url = `https://docs.google.com/spreadsheets/d/${spreadsheetId}`
                window.open(url, "_blank");
                console.log(`${result.totalUpdatedCells} cells updated.`);
            });

        });

    };

    if (gapi.client.getToken() === null) {
        // Prompt the user to select an Google Account and asked for consent to share their data
        // when establishing a new session.
        tokenClient.requestAccessToken({prompt: 'consent'});
    } else {
        // Skip display of account chooser and consent dialog for an existing session.
        tokenClient.requestAccessToken({prompt: ''});
    }
}

/**
 * Sign out the user upon button click.
 */
function handleSignoutClick() {
    const token = gapi.client.getToken();
    if (token !== null) {
        google.accounts.oauth2.revoke(token.access_token);
        gapi.client.setToken('');

    }
}

// gapi.client.sheets.spreadsheets.batchUpdate({
//     spreadsheetId: spreadsheetId,
//
//     requests:[
//         {
//             "autoResizeDimensions": {
//                 "dimensions": {
//                     "sheetId": 0,
//                     "dimension": "COLUMNS",
//                     "startIndex": 0,
//                     "endIndex": values[0].length+1
//                 }
//             }
//         }
//     ]
// }).then((response) => {
//     console.log(response)
// })
