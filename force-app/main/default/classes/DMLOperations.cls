/**
 * The DMLOperations class serves as a deep dive into Data Manipulation Language (DML) in Apex.
 * It covers fundamental DML operations such as insert, update, upsert, and delete.
 *
 * This class introduces developers to the concept of manipulating Salesforce records in Apex.
 * It discusses how to use DML operations to create, update, and delete records.
 * This class uses standard Salesforce objects like Account, Contact, and Opportunity for demonstration.
 *
 * Topics covered in this class include:
 * - Understanding how to use insert DML operation to create records in Salesforce.
 * - Understanding how to use update and upsert DML operations to update existing records in Salesforce.
 * - Understanding how to use delete DML operation to remove records from Salesforce.
 *
 * Users of this class can expect to gain a strong understanding of DML operations in Apex and
 * be prepared for more advanced topics in Salesforce development.
 *
 * The methods within this class serve as practical examples of different DML operations,
 * allowing developers to learn through practice and examples.
 *
 * @author David Bolding
 */


public with sharing class DMLOperations {

    public class RandomContact {
        public String firstName {get; set;}
        public String lastName {get; set;}
        public String fullName {get; private set;}

        public RandomContact() {
            List<String> firstNames = new List<String>{'Aaliyah', 'Abigail', 'Addison', 'Alexa', 'Alexandra', 'Alexis', 'Alice', 'Allison', 'Alyssa', 'Amelia', 'Anna', 'Annabelle', 'Aria', 'Ariana', 'Arianna', 'Ashley', 'Aubree', 'Aubrey', 'Audrey', 'Autumn', 'Ava', 'Avery', 'Bella', 'Brianna', 'Brooklyn', 'Camila', 'Caroline', 'Charlotte', 'Chloe', 'Claire', 'Eleanor', 'Elizabeth', 'Ella', 'Ellie', 'Emily', 'Emma', 'Eva', 'Evelyn', 'Faith', 'Gabriella', 'Genesis', 'Gianna', 'Grace', 'Hadley', 'Hailey', 'Hannah', 'Harper', 'Isabella', 'Isabelle', 'Jasmine', 'Julia', 'Katherine', 'Kaylee', 'Kennedy', 'Khloe', 'Kylie', 'Lauren', 'Layla', 'Leah', 'Lillian', 'Lily', 'London', 'Lucy', 'Lydia', 'Mackenzie', 'Madeline', 'Madelyn', 'Madison', 'Maya', 'Melanie', 'Mia', 'Mila', 'Naomi', 'Natalie', 'Nevaeh', 'Nora', 'Olivia', 'Paisley', 'Penelope', 'Peyton', 'Piper', 'Riley', 'Ruby', 'Sadie', 'Samantha', 'Sarah', 'Savannah', 'Scarlett', 'Serenity', 'Skylar', 'Sofia', 'Sophia', 'Sophie', 'Stella', 'Taylor', 'Victoria', 'Violet', 'Vivian', 'Zoe', 'Zoey', 'Aaron', 'Adam', 'Adrian', 'Aiden', 'Alexander', 'Andrew', 'Angel', 'Anthony', 'Asher', 'Austin', 'Ayden', 'Benjamin', 'Bentley', 'Blake', 'Brandon', 'Brayden', 'Brody', 'Caleb', 'Camden', 'Cameron', 'Carson', 'Carter', 'Charles', 'Chase', 'Christian', 'Christopher', 'Colton', 'Connor', 'Cooper', 'Daniel', 'David', 'Dominic', 'Dylan', 'Easton', 'Eli', 'Elijah', 'Ethan', 'Evan', 'Gabriel', 'Gavin', 'Grayson', 'Henry', 'Hudson', 'Hunter', 'Ian', 'Isaac', 'Isaiah', 'Jace', 'Jack', 'Jackson', 'Jacob', 'James', 'Jason', 'Jaxon', 'Jaxson', 'Jayden', 'Jeremiah', 'John', 'Jonathan', 'Jordan', 'Jose', 'Joseph', 'Joshua', 'Josiah', 'Juan', 'Julian', 'Justin', 'Kayden', 'Kevin', 'Landon', 'Leo', 'Levi', 'Liam', 'Lincoln', 'Logan', 'Lucas', 'Luis', 'Luke', 'Mason', 'Matthew', 'Michael', 'Nathan', 'Nathaniel', 'Nicholas', 'Noah', 'Nolan', 'Oliver', 'Owen', 'Parker', 'Robert', 'Ryan', 'Ryder', 'Samuel', 'Sebastian', 'Thomas', 'Tristan', 'Tyler', 'William', 'Wyatt', 'Xavier', 'Zachary'};
            List<String> lastNames = new List<String> {'Adams', 'Alexander', 'Allen', 'Alvarez', 'Anderson', 'Arnold', 'Bailey', 'Baker', 'Barnes', 'Bell', 'Bennett', 'Black', 'Boyd', 'Bradley', 'Brooks', 'Brown', 'Bryant', 'Burns', 'Butler', 'Campbell', 'Carter', 'Castillo', 'Castro', 'Chavez', 'Clark', 'Cole', 'Coleman', 'Collins', 'Cook', 'Cooper', 'Cox', 'Crawford', 'Cruz', 'Cunningham', 'Daniels', 'Davis', 'Diaz', 'Dixon', 'Dunn', 'Edwards', 'Elliott', 'Ellis', 'Evans', 'Ferguson', 'Fernandez', 'Fisher', 'Flores', 'Ford', 'Foster', 'Fox', 'Freeman', 'Garcia', 'Gardner', 'Gibson', 'Gomez', 'Gonzales', 'Gonzalez', 'Gordon', 'Graham', 'Grant', 'Gray', 'Green', 'Griffin', 'Gutierrez', 'Hall', 'Hamilton', 'Hansen', 'Harris', 'Harrison', 'Hart', 'Hawkins', 'Hayes', 'Henderson', 'Henry', 'Hernandez', 'Herrera', 'Hicks', 'Hill', 'Hoffman', 'Holmes', 'Howard', 'Hughes', 'Hunt', 'Hunter', 'Jackson', 'James', 'Jenkins', 'Jimenez', 'Johnson', 'Jones', 'Jordan', 'Kelley', 'Kelly', 'Kennedy', 'Kim', 'King', 'Knight', 'Lee', 'Lewis', 'Long', 'Lopez', 'Marshall', 'Martin', 'Martinez', 'Mason', 'Mcdonald', 'Medina', 'Mendoza', 'Meyer', 'Miller', 'Mills', 'Mitchell', 'Moore', 'Morales', 'Moreno', 'Morgan', 'Morris', 'Murphy', 'Murray', 'Myers', 'Nelson', 'Nguyen', 'Nichols', 'Olson', 'Ortiz', 'Owens', 'Palmer', 'Parker', 'Patel', 'Patterson', 'Payne', 'Perez', 'Perry', 'Peters', 'Peterson', 'Phillips', 'Pierce', 'Porter', 'Powell', 'Price', 'Ramirez', 'Ramos', 'Reed', 'Reyes', 'Reynolds', 'Rice', 'Richardson', 'Rivera', 'Roberts', 'Robertson', 'Robinson', 'Rodriguez', 'Rogers', 'Romero', 'Rose', 'Ross', 'Ruiz', 'Russell', 'Ryan', 'Sanchez', 'Sanders', 'Schmidt', 'Scott', 'Shaw', 'Simmons', 'Simpson', 'Smith', 'Snyder', 'Spencer', 'Stephens', 'Stevens', 'Stewart', 'Stone', 'Sullivan', 'Taylor', 'Thomas', 'Thompson', 'Torres', 'Tran', 'Tucker', 'Turner', 'Vasquez', 'Wagner', 'Walker', 'Wallace', 'Ward', 'Warren', 'Washington', 'Watson', 'Weaver', 'Webb', 'Wells', 'West', 'White', 'Williams', 'Wilson', 'Wood', 'Woods', 'Wright', 'Young'};
        
            Integer firstNameIndex = (Integer)(Math.random() * firstNames.size());
            Integer lastNameIndex = (Integer)(Math.random() * lastNames.size());

            this.firstName = firstNames[firstNameIndex];
            this.lastName = LastNames[lastNameIndex];
            this.fullName = firstName + ' ' + lastName;    
    

        }       


    }

    /**
     * Question 1
     * Create a new Account object and inserts it into the database.
     * The Account will have a random name for uniqueness.
     * @return The Id of the newly created Account.
     */
    public static Id insertNewAccount() {
        // Create a new Account instance
        Account newAcct = new Account();
        RandomContact fName = new RandomContact();                 
        String acctName = fName.fullName;

        System.debug(acctName);     

        // Set some fields on the Account
        newAcct.Name = acctName;      

        // Insert the Account into the database
        Insert newAcct;

        // Return the Id of the newly created Account
        System.debug(newAcct.Id); 
        return newAcct.Id;
    }

    /**
     * Question 2
     * Create a new Account with the specified name and industry provided.
     * @param name The name of the account to be created.
     * @param industry The industry of the account to be created.
     */
    public static void createAccount(String name, String industry) {
        // Create a new Account and set the fields inline
        Account acct = new Account(Name = name, Industry = industry);
        
        // Insert the Account
        try{
            insert acct;
            System.debug('The following account has been created: ' + acct);

        }catch(DmlException e){
            System.debug('The following error has been realizzed: ' + ' '+ e.getMessage());            
                        
        }
    
      
    }

    
    /**
     * Question 3
     * Create a new Contact and link it to the Account id provided then inserts it into the database.
     * @param accountId The Id of the Account to link the Contact to.
     * @return The Id of the newly created Contact.
     */
    public static Id insertNewContact(Id accountId) {
        // Create a new Contact instance
        Contact newContact = new Contact();
        RandomContact lName = new RandomContact();

        // Set some fields on the Contact
        newContact.LastName = lName.lastName;
        // Set the AccountId field to the given accountId
        newContact.AccountId = accountId;
        
        try{

            // Insert the Contact into the database    

            // Return the Id of the newly created Contact
            insert newContact;
            return newContact.Id;

        }catch(Exception e){
            System.debug('The following error has occurred: ' + e.getMessage());
            
            String message = e.getMessage();
            return message;

        }       

        
    }

    /**
     * Question 4
     * Update the last name of a Contact in the database.
     * Resource: https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql.htm
     * @param contactId The Id of the Contact to update.
     * @param newLastName The new last name for the Contact.
     */
    public static void updateContactLastName(Id contactId, String newLastName) {
        
       try {        
         // Retrieve the Contact from the database
        // [SELECT Id FROM Contact WHERE Id = :contactId]
        contact queriedContact = [SELECT id from Contact WHERE ID = :contactId];

         // Update the Contact's last name
         queriedContact.LastName = newLastName;
         // Update the Contact in the database
         update queriedContact; 

       } catch(Exception e) {
         System.debug('The following error has occurred: ' + e.getMessage());

       }           
     
        
    }

    /**
     * Question 5
     * Update the stage of an Opportunity in the database.
     * Resource: https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql.htm
     * @param oppId The Id of the Opportunity to update.
     * @param newStage The new stage for the Opportunity.
     */
    public static void updateOpportunityStage(Id oppId, String newStage) {
        try {
         // Retrieve the Opportunity from the database
        // [SELECT Id FROM Opportunity WHERE Id = :oppId]
        Opportunity retreivedOpp = [SELECT Id FROM Opportunity WHERE Id = :oppId];

         // Update the Opportunity's stage
         retreivedOpp.StageName = newStage;

         // Update the Opportunity in the database
         update retreivedOpp;
            
        } catch (Exception e) {
         System.debug('The following error has occurred: ' + e.getMessage());
            
        }
       
    }

    /**
     * Question 6
     * Update the Account's Name and Industry given an Account Id.
     * Resource: https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/sforce_api_calls_soql.htm
     * @param accountId The Id of the account to be updated.
     * @param newName The new name for the account.
     * @param newIndustry The new industry for the account.
     */
    public static void updateAccountFields(Id accountId, String newName, String newIndustry) {
        
        try {
        // Query the account
        // [SELECT Id FROM Account WHERE Id = :accountId]
        Account updateAccount = [SELECT Id FROM Account WHERE Id = :accountId];

        // Update the Account with the given Id with the new name and industry
        updateAccount.Name = newName;
        updateAccount.Industry = newIndustry;

        update updateAccount;

    } catch (Exception e) {
            System.debug('The following error has occurred: ' + e.getMessage());
        }
    }
       


    /**
     * Question 7
     * Create or updates an Opportunities
     * The Opportunity's Stage is set to Qualification.
     * The Opportunity's Close Date is set to 3 months from today.
     * The Opportunity's Amount is set to 50000.
     * @param list of Opportunities to be changed then upserted.
     */
    public static void upsertOpportunityList(List<Opportunity> opportunities) {
        // Iterate over the opportunities
            // Set the Opportunity's Stage to Qualification
            // Set the Opportunity's Close Date to 3 months from today
            // Set the Opportunity's Amount to 50000
            
            Date closeDate = System.today().addMonths(3);
            Decimal amount = 50000.00; 

        for (Opportunity opp : opportunities) {

            if (opp == null) {
                continue;
                
            }else {
                opp.StageName = 'Qualification';           
                opp.CloseDate = closeDate; 
                opp.Amount = amount;

            }
            
        }

        // Upsert the Opportunity
        try {
          Database.upsert(opportunities);

        } catch (Exception e) {

            System.debug('The following error has occurred: ' + e.getMessage());
        }      
        
    }

    /**
     * Question 8
     * Insert or updates opportunities from list of names.
     * Associate the Opportunities with account that has the name accountName.
     * There should be an Opportunity for each name provided in the list.
     * @param accountName The name of the Account.
     * @param oppNames The list of Opportunity names.
     */
    public static void upsertOpportunities(String accountName, List<String> oppNames) {
        // Loop through each Opportunity name
            // Create an Opportunity with the given name
            // Add the Opportunity to the list
        List<Opportunity> updateOpps = new List<Opportunity>();
        
        Date closeDate = System.today();
        String stageName = 'Prospecting';

        List<Account> acct = [SELECT id, Name 
                        FROM Account 
                        WHERE Name = :accountName 
                        LIMIT 1];

        System.debug(acct);
        String acctId;

         If (acct.isEmpty()) {
            Account createAccount = new Account(Name = accountName);
            insert createAccount;
            System.debug(createAccount);
            acctId = createAccount.Id;

        }else{
            acctId = acct[0].Id;

        } 
        System.debug(acctId);       

        Map<String, Opportunity> existingOppsMap = new Map<String, Opportunity>();
        for(Opportunity opp : [SELECT Id, Name FROM Opportunity WHERE Name IN :oppNames]) {
            existingOppsMap.put(opp.Name, opp);
        }


        for (String oppName : oppNames ) {
            Opportunity updateOpp = existingOppsMap.get(oppName);

            if(updateOpp != null) {
                updateOpp.AccountId = acctId;
                updateOpps.add(updateOpp);
                
            }else {
                Opportunity newOpp = new Opportunity(
                 Name = oppName,
                 StageName = stageName,
                 CloseDate = closeDate,
                 AccountId = acctId
                
             );    
             System.debug(newOpp);               
             updateOpps.add(newOpp);
                
            }
             
          
        }

        try {

            upsert updateOpps;
            System.debug(updateOpps);

        } catch (Exception e) {

            System.debug('The following error has occurred: ' + e.getMessage());
        }
        
    }
    
    /**
     * Question 9
	 * Upserts an Account with the specified name.
	 * If an Account with the given name already exists, update the description to "Updated Account".
	 * If no such Account exists, it creates a new one and sets the description to "New Account".
	 * @param accountName The name of the Account to be upserted.
	 * @return The Account that was upserted.
	 */
	public static Account upsertAccount(String accountName) {
		// Query for the Account
		List<Account> accounts = [SELECT Id, Description FROM Account WHERE Name = :accountName];
        
        Account acct = new Account();       
        
		// if the Account exists, update the description
        // otherwise, create a new Account and set the description
        if(!accounts.isEmpty()) {
            Account existingAccount = accounts[0];
            existingAccount.Description = 'Updated Account'; 
            upsert existingAccount;
            return existingAccount;
           

        }else {
            acct.Name = accountName;
            acct.Description = 'New Account';
            upsert acct;
            return acct;
            

        }                       
               
	}

    /**
     * Question 10
	 * Upserts accounts and links contacts to them based on the contact's last name and account name.
	 * Create or use existing account with contact last name. (Hint: use previous upsertAccount method - this may cause bad practices but for learning purposes it's okay.)
	 * Contacts are then linked to these accounts based on a full last name match.
     * Example Contact Last Name = Doe Link to Account Name = Doe 
     * Example Contact Last Name = Jane Link to Account Name = Jane
	 * @param contactsToUpsert List of Contacts to be upserted and linked to accounts.
	 */
	public static void upsertAccountsWithContacts(List<Contact> contactsToUpsert) {
		// Loop through each Contact
        Map<String, Account> lastNameToAccountMap = new Map<String, Account>();

        for(Contact con : [SELECT Id, LastName FROM Contact WHERE Id IN :contactsToUpsert]) {
           lastNameToAccountMap.put(con.LastName, new Account(Id = con.AccountId));

        }


		// Upsert the Contacts
        For (Contact contact : contactsToUpsert) {
            String lastName = contact.LastName;
            Account account = lastNameToAccountMap.get(lastName);
            if (account == null) {
                account = upsertAccount(lastName);
                lastNameToAccountMap.put(lastName, account);
            }

            contact.AccountId = account.Id;
        }
        upsert contactsToUpsert;


		
	}

    /**
     * Question 11
     * Insert a list of Leads and then deletes them.
     * @param leadNames The list of Lead names to be inserted.
     */
    public static void insertAndDeleteLeads(List<String> leadNames) {
        List<Lead> createLead = new List<Lead>();
        // Loop through each Lead name
        for(String lead : leadNames) {
            createLead.add(new Lead( 
                LastName = lead,
                Company = lead
                ));             
      
        }

        // Insert the Leads
        insert createLead;
        

        // Delete the Leads
        delete createLead;
    }


    /**
     * Question 12
     * Dynamically create the number of cases and relate it to the accountId, then deletes them.
     * @param accountId The account for which the cases will be created and then deleted.
     * @param numOfCases The number of cases to create.
     */
    public static void createAndDeleteCases(String accountId, Integer numOfCases) {
        // Insert the cases
        List<Case> createCase = new List<Case>();

        for (Integer i=0; i<numOfCases; i++){
            createCase.add( new Case(
                origin = 'Web',
                AccountId = accountId
            ));
        }
      
        insert createCase;       
        

        // Delete the cases
        delete createCase;
    }
}