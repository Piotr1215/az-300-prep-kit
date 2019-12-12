# AZ-300 exam preparation kit

<img src="https://docs.microsoft.com/en-us/media/learn/certification/badges/microsoft-certified-expert-badge.svg" alt="Exam badge" width="200"/>

This repo is my way of preparing for az-300 exam which is part of
**Microsoft Certified: Azure Solutions Architect Expert** certification.

Feel free to fork or submit PR, but please stick to the format.

## Content & Learning Progress

Exam curriculum is based on material update from __December 4, 2019.__. See below announcement from exam page

> Exam AZ-300: Microsoft Azure Architect Technologies
> The content of this exam was updated on __December 4, 2019.__ Please download the Skills measured document below to see what changed.

Each section of the exam material has its own README file linked below with links to Azure documentation, Plularsight videos (free), labs and other useful info.
There is also [Exercises folder](/Exercises) with a few scripts (mostly Azure CLI) to deploy resources on Azure quicker.

You can clone/fork this repo and mark mark your progress. If you want to clone this repo and use as started for your learning process, you will need to reset the state of checkmarks. Currently all is marked as done, but you can easily do search and replace in your editor of choice (search for \[x] and replace with [ ], notice there is space between empty brackets).

* [x] [Deploy and configure infrastructure (40-45%)](/1-infrastructure/README.md)

* [x] [Implement workloads and security (25-30%)](/2-workloads-&-security/README.md)

* [x] [Create and deploy apps (5-10%)](/3-create-&-deploy-apps/README.md)

* [x] [Implement authentication and secure data (5-10%)](/4-authentication-&-security/README.md)

* [x] [Develop for the cloud and for Azure storage (15-20%)](/5-develop-cloud-&-storage/README.md)

## Resources

1. [Plularsight Courses](https://app.pluralsight.com/paths/certificate/microsoft-azure-architect-technologies-az-300)

2. [Udemy "AZ-300 Azure Architecture Technologies Certification Exam" by Scott Duffy](https://www.udemy.com/course/70534-azure/)

3. [Official Microsoft exam page with free learning materials](https://docs.microsoft.com/en-gb/learn/certifications/exams/az-300)

4. [Video from MS Ignite with tips on taking the exam](https://myignite.techcommunity.microsoft.com/sessions/80470?source=sessions)

5. [Self paced Azure labs](https://www.microsoft.com/HandsOnLabs/SelfPacedLabs)

6. [Azure documentation](https://docs.microsoft.com/en-us/azure/)

7. [Quick-start ARM and Powershell templates](https://github.com/Azure/AzureStack-QuickStart-Templates)

## Exam preparation tips

### #1: Understand exam structure

Az-300 is focusing on practical usecases of Azure technologies. Exam has following characteristics:

1. Questions: 40-60 questions

   * Some questions are worth 1 point

   * Some questions cannot be skipped

   * There are different types of questions: multiple-choice, build list, hot area, drag and drop, reorder etc

   * There are also Performance based questions (labs) to be done in Azure portal

   * Questions are often in context of Case Studies where you need to gather and understand information across multiple sources

2. Duration: 3,5 hours

   * Schedule 30 minutes for reading and understangin instructions and rest for actal exam.

### #2: Learn how to manipulate resources on Azure using command line tools

* Use `az interactive` to enable CLI auto completion and helpful tips

* Use `powershell`, get help on commands and understand the order of command-lets (first create resource group, etc)

### #3: Preview features are NOT included in the exam curriculum

Preview features are not included, but you should keep an eye on the exam page and check for updates. For example, while I was preparing for the exam it has been updated and some preview features are now GA.

The most significan change is increasing infrastructure related questions to almost **half** of the exam questions and reducing section dedicated for development in cloud. After the update the exam leans very heavily towards infrastructure questions.

### #4: Always answer all the questions. There is no penalty for wrong answers

### #5: Before you schedule the exam, check for offers

* [Exam with retake](https://eu1.mindhub.com/microsoft-exam-replay-mcp-exam-plus-retake/p/Microsoft-Exam-Replay?utm_source=msftmarketing&utm_medium=msft_offers&utm_campaign=ExamReplayFY20&utm_term=ERFY20&utm_content=weblink3)

* [Exam with retake and practice test](https://eu1.mindhub.com/microsoft-exam-replay-with-practice-test-mcp-exam/p/Microsoft-Exam-Replay-PT?utm_source=msftmarketing&utm_medium=msft_offers&utm_campaign=ExamReplayFY20&utm_term=ERFY20&utm_content=weblink)

### #6: Practice key components using Azure portal, there will be practice tests

* [Create free account on Azure and practice!](https://azure.microsoft.com/en-us/free/)

### #7: Schedule exam and create and follow preparation plan

When I was confident I have enought preparation and understand the material, it was time to **schedule the exam**.
Scheduling exam was important to set a date in calendar and make sure I stay focus and plan my time well.

**10 days** from exam I scheduled final preparation plan focusing on each section as follows:

* Days 1-3: Deploy and configure infrastructure (40-45%)

* Days 4-5: Implement workloads and security (25-35%)

* Day 6: Create and deploy apps (5-10%)

* Day 7: Implement authentication and secure data (5-10%)

* Day 8: Develop for the cloud and for Azure storage (15-20%)

* Day 9: Practice exams and mock questions, final review. Please **don't** use so called braindumps. I used "Microsoft Azure AZ-300 Architecture Technologies Practice Exams" (bought cheap on Udemy during Cyber Week)

* Day 10: EXAM!

### **Good luck :)**
