import "@johnlindquist/kit"
    
// Menu: Open Jira ticket in browser
// Description: Parses a valid ticket number from selection and opens it in browser
// Author: Jakub Olek
// Shortcut: cmd shift j
// Twitter: @JakubOlek

const jiraDomain = await env("JIRA_DOMAIN");
const text = await getSelectedText();
const jiraTicket = text.match(/([A-Z]{2,5}-[0-9]+)/);

if (jiraTicket) {
  focusTab(`${jiraDomain}/browse/${jiraTicket[0]}`);
}