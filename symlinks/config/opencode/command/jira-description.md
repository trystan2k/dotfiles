---
description: Generate a description for JIRA based on the changes made.
agent: plan
model: github-copilot/gpt-5-mini
---

Based on the changes staged (if any) or from the lasts commits compared with develop branch, generate a description for a JIRA ticket. The description should summarize what would have been the requirements that would result in the implementation done in these changes. Ensure the description is informative and helps develpers understand the what needs to be done. It should be written in a professional, neutral tone and in Spanish. It should be written in markdown format.

It should have these sections sections

1. Small 'Como / Quiero que / Para que' user story
A brief user story that summarizes the requirements.

2. Criterios de Aceptación
A bullet point list of the main acceptance criteria that would need to be met for the implementation.

3. Notas Técnicas
Any technical notes that would help developers understand the implementation details, if necessary.
