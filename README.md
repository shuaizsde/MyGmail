# GptMail
GptMail is an autonomous demo email application that adopts the appearance of Gmail while integrating GPT-4 functionalities. The primary objective of the project is to demonstrate the creator's proficiency in establishing a comprehensive mobile app architecture and implementing features with precise UI design specifications within a limited timeframe. Developed within just 2 weeks, GptMail successfully incorporates crucial functionalities such as Inbox, SideMenu, Compose Email, Unread Alerts, and notably, Email Assistant. By integrating the OpenAI API, the creator enables users to effortlessly rewrite emails by simply clicking a dedicated assistant button in the compose view, leveraging the content from the sender and their own responses.

### 05/16 Update: Implemented tapBar and SideMenu buttonOnTap Animations as gmail does:
https://github.com/zhang86036055/MyGmail/assets/77553874/2d6a76bf-fd25-4abd-8f55-12179c557acf

### Final Video Stage 3
https://github.com/zhang86036055/MyGmail/assets/77553874/caa83201-dbe1-4980-bcb7-ed0318593588

## Project Repository
The project repository can be accessed at the following URL: GptMail Repository

## Design and Implemented Views
### GptMail replicates the appearance of Gmail and includes the following views:
* InboxList
* SideMenu
* EmailContentView
* VideoChatView
* ComposeNewEmailView
* Gmail Navigation Header
## Implemented Features
### GptMail includes the following implemented features:

* Email Assistant

[https://github.com/zhang86036055/MyGmail/assets/77553874/5b911915-749b-40ff-a741-27baa86a9658](https://github.com/zhang86036055/MyGmail/assets/77553874/5b911915-749b-40ff-a741-27baa86a9658)

* Compose Email Button (*NewEmail screen not implemented)

[https://github.com/zhang86036055/MyGmail/assets/77553874/93d5dbde-e2d1-474e-867d-53037ad3ff3d](https://github.com/zhang86036055/MyGmail/assets/77553874/93d5dbde-e2d1-474e-867d-53037ad3ff3d)

* Search by senders' name

[https://github.com/zhang86036055/MyGmail/assets/77553874/5c069f9b-935c-4815-9eba-77de296bb7e2](https://github.com/zhang86036055/MyGmail/assets/77553874/5c069f9b-935c-4815-9eba-77de296bb7e2)

* Star Email

[https://github.com/zhang86036055/MyGmail/assets/77553874/7aa1c003-a03f-40d1-8e53-173b87dd0651](https://github.com/zhang86036055/MyGmail/assets/77553874/7aa1c003-a03f-40d1-8e53-173b87dd0651)

* Archive

[https://github.com/zhang86036055/MyGmail/assets/77553874/0ff35fea-2751-43df-9d41-0c949f579c52](https://github.com/zhang86036055/MyGmail/assets/77553874/0ff35fea-2751-43df-9d41-0c949f579c52)

* Mark as important

[https://github.com/zhang86036055/MyGmail/assets/77553874/3263aa16-2373-449e-8ac3-a91bf9451267](https://github.com/zhang86036055/MyGmail/assets/77553874/3263aa16-2373-449e-8ac3-a91bf9451267)

* Show unread emails body in bold, tags unread numbers by catagory. Specifically: Bottom tab shows unreads counts that are not Archived, Spam or Trash

[https://github.com/zhang86036055/MyGmail/assets/77553874/148c744c-d12a-45da-83a3-6df43b4901b7](https://github.com/zhang86036055/MyGmail/assets/77553874/148c744c-d12a-45da-83a3-6df43b4901b7)

* Show User's profile picture if exists, otherwise show senderName's first character with a random Color.

[https://github.com/zhang86036055/MyGmail/assets/77553874/c33c3045-107b-48a5-b56a-d108717620f4](https://github.com/zhang86036055/MyGmail/assets/77553874/c33c3045-107b-48a5-b56a-d108717620f4)

* Switch buttom bar between EmailList and VideoChat(Not Implemented)

[https://github.com/zhang86036055/MyGmail/assets/77553874/5be99f06-c297-4ef1-a8c0-981ef1bf1b53](https://github.com/zhang86036055/MyGmail/assets/77553874/5be99f06-c297-4ef1-a8c0-981ef1bf1b53)

* Side Menu with sliding left gester, tapping buttons will filter emails by catagory

[https://github.com/zhang86036055/MyGmail/assets/77553874/38f5580d-c1eb-4260-87b5-be9932828a23](https://github.com/zhang86036055/MyGmail/assets/77553874/38f5580d-c1eb-4260-87b5-be9932828a23)
## Tested Features
### The following features have been tested using faked data:

* Emails marked with labels such as Primary, Unread, Starred, Important, Spam, Trash, Promotions, Social
* Emails with attachments
* Emails sent from the user
* Spam emails
* Emails with unknown sender profile pictures
* Emails with long content body




<!-- 
----------------------------------------------------------
### Progress
#### MileStone 4 Demo (Day4)
https://github.com/zhang86036055/MyGmail/assets/77553874/0f95310e-a4c6-491f-8551-f0472c1c7eb5

#### MileStone 3 (Day3)

Customized Navigation menu for email content view header
Added more buttons and icons as well as their onTap actions
Added additional fields (e.g., isUnread, isSent) in email Model struct for further use
Finalized layout settings to resemble Gmail
MileStone 2 Demo (Day2)
https://github.com/zhang86036055/MyGmail/assets/77553874/6b2edd8a-f927-4ac7-94aa-8615efc17d8b

#### Milestone 1 (Day1)

Implemented Inbox tableView
Created InboxMails(Model), MailViewModel, MailInboxTableView(View), and established connections as the fundamental MVVM structure
Created fake inbox mails for preview
Implemented starring mail feature -->
