// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

List<String> oppNames = new List<String>{'Opp 1', 'Opp 2', 'Opp 3'};

DMLOperations.upsertOpportunities('Test Account', oppNames);