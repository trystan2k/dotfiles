/*
# 🏷️ My Jira issues
- Lists the last 10 issues assigned to me
- You can open the issue in jira
- When selecting an issue, displays a widget on the screen that contains the issue data
- default shortcut to run the script: `cmd+option+shift+j`
*/

// Name: 🏷️ Jira issues
// Description: List issues assigned to me in Jira
// Shortcut:
// Author: WaelNalouti

import "@johnlindquist/kit";

const JIRA_HOST = await env(
  "JIRA_HOST_URL",
  "jira host url: exemple.atlassian.net"
);
const JIRA_USERNAME = await env("JIRA_USERNAME", "your jira username");
const AUTH = await env("AUTH", "your jira acces token");

const JIRA_APP_URL = `${JIRA_HOST}/browse`;
const JIRA_API_URL = `${JIRA_HOST}/rest/api/latest`;

const JIRA_ISSUES_QUERY = `/search?orderBy=-created&jql=assignee=%22${JIRA_USERNAME.replaceAll(
  " ",
  "%20"
)}%22&maxResults=10&startAt=0`;

let headersList = {
  Authorization: AUTH,
};

let response = await get(`${JIRA_API_URL}${JIRA_ISSUES_QUERY}`, {
  headers: headersList,
});

let data = await response.data;

let issuesData = data.issues.map((issue) => ({
  key: issue.key,
  summary: issue.fields.summary,
  issuetype: issue.fields.issuetype,
  project: issue.fields.project,
  created: issue.fields.created,
  priority: issue.fields.priority,
  description: issue.fields.description,
  creator: issue.fields.creator,
  status: issue.fields.status,
}));

const selectedIssue = await arg("Select an issue to open in browser", () => {
  return issuesData.map((issue) => ({
    name: issue.summary,
    icon: issue.issuetype.iconUrl,
    description: `[${issue.status.statusCategory.name}] - ${issue.project.name}/${issue.key}`,
    value: issue.key,
    preview: () =>
      `
      <div class="p-7 font-mono">
        <div class="flex text-xs mb-2">
          <img src="${issue.issuetype.iconUrl}" width="16" height="16"/>
          <p class="ml-2">${issue.issuetype.name}</p>
          <p cless="pl-4">[${issue.status.statusCategory.name}]</p>
        </div>  
        <h1>
          ${issue.summary}
        </h1>
        <div class="border-b-4 border-dashed border-gray-900 mt-4 mb-4"></div>
        <div class='grid grid-cols-2 gap-4 text-xs items-center'>
          <p>Project: <b>${issue.project.name}</b></p>
          <p>Key: <b>${issue.key}</b></p>
        </div>
        <div class='grid grid-cols-2 mt-4 mb-4  gap-2 items-center text-xs'>
        <div>
          created by: 
          <div class="flex mb-2">
          <img src="${
            issue.creator.avatarUrls["16x16"]
          }" class="mr-2 object-scale-down"  width="16" height="16"/>
          <b>${issue.creator.displayName}</b>
          </div>
          </div>
          <div class="mb-2">
            created at: 
            <p>
              <b>${new Date(issue.created).toLocaleString()}</b>
            </p>
          </div>
        </div>
        <div class="border-b-2 border-dashed border-gray-900 mt-4 mb-4"></div>

      <a href="${JIRA_APP_URL}/${issue.key}">
        Open issue in jira
      </a>
        <p class="text-s mt-4 whitespace-pre-wrap">${
          issue.description ||
          "<span class='opacity-20'>No description for this task 🌵</span>"
        }</p>
      </div>
      `,
  }));
});

let issueDataRes = await fetch(`${JIRA_API_URL}/issue/${selectedIssue}`, {
  method: "GET",
  headers: headersList,
});

let issueData = await issueDataRes.json();

let issue = {
  key: issueData.key,
  summary: issueData.fields.summary,
  issuetype: issueData.fields.issuetype,
  project: issueData.fields.project,
  created: issueData.fields.created,
  priority: issueData.fields.priority,
  description: issueData.fields.description,
  creator: issueData.fields.creator,
  status: issueData.fields.status,
};

await widget(
  `
    <div class="p-7 font-mono">
      <div class="flex text-xs mb-2">
        <img src="${issue.issuetype.iconUrl}" width="16" height="16"/>
        <p class="ml-2">${issue.issuetype.name}</p>
        <p cless="pl-4">[${issue.status.statusCategory.name}]</p>
      </div>  
      <h1>
        ${issue.summary}
      </h1>
      <div class="border-b-4 border-dashed border-gray-900 mt-4 mb-4"></div>
      <div class='grid grid-cols-2 gap-4 text-xs items-center'>
        <p>Project: <b>${issue.project.name}</b></p>
        <p>Key: <b>${issue.key}</b></p>
      </div>
      <div class='grid grid-cols-2 mt-4 mb-4  gap-2 items-center text-xs'>
      <div>
        created by: 
        <div class="flex mb-2">
        <img src="${
          issue.creator.avatarUrls["16x16"]
        }" class="mr-2 object-scale-down"  width="16" height="16"/>
        <b>${issue.creator.displayName}</b>
        </div>
        </div>
        <div class="mb-2">
          created at: 
          <p>
            <b>${new Date(issue.created).toLocaleString()}</b>
          </p>
        </div>
      </div>
      <a href="${JIRA_APP_URL}/${selectedIssue}">
        go to issue
      </a>
      <div class="border-b-2 border-dashed border-gray-900 mt-4 mb-4"></div>
      <p class="text-s mt-4 whitespace-pre-wrap">${
        issue.description ||
        "<span class='opacity-20'>No description for this task 🌵"
      }</p>
    </div>
  `,
  {
    alwaysOnTop: true,
    opacity: 0.7,
    roundedCorners: true,
    hasShadow: true,
    draggable: true,
    backgroundColor: "#000",
    // frame: true,
    darkTheme: true,
    useContentSize: true,
  }
);
