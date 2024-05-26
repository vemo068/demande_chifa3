//String baseUrl = "http://localhost:8080/";

String baseUrl = "http://10.0.2.2:8080/";

String checkActivationUrl = "${baseUrl}checkActivation";
String loginUrl = "${baseUrl}login";
String accountActivationUrl = "${baseUrl}activateAccount";

String createRenoDemandeUrl = "${baseUrl}createRenouvellementDemande";
String getRenoDemandesUrl = "${baseUrl}getDemandesRenouvellement";

String createCarteDemandeUrl = "${baseUrl}createCarteDemande";


String getAllRenoDemandsByAssureId="${baseUrl}getRenoDemandsByAssureId";
String getAllCardDemandsByAssureId="${baseUrl}getCardDemandsByAssureId";


String getNotDoneRenoDemandsByAssureId="${baseUrl}getNotDoneRenoDemandsByAssureId";
String getNotDoneCardDemandsByAssureId="${baseUrl}getNotDoneCardDemandsByAssureId";