# MyGmail

Simon Zhang's Gmail demo project with SwiftUI

Summary:
Final Video

https://github.com/zhang86036055/MyGmail/assets/77553874/caa83201-dbe1-4980-bcb7-ed0318593588



***Designed/Implemented Gmail views:***
1. InboxList, 
2. SideMenu, 
3. EmailContentView, 
4. VideoChatView(content placeholdered with image), 
5. ComposeNewEmailView(content placeholdered with image)
6. Gmail Navigation Header for EmailContentView


***Implemented features:***
1. Switch between views mentioned above, specifically:
     * Tapping on compose button will open ComposeNewEmailView
     * Slide device left screen edge will open sideMenw
     * Tapping on email cell will open EmailContentView
     * switching bottomTapBar will switch between inboxList and videoChat view
     * Typing texts on search bar will filter emails by senderNames
2. Search email with senders' name
3. Filter emails of centain catagory: e.g. Sent, Primary, Starred, Spam ...
4. Show User's profile picture if exists, otherwise show senderName's first character with a random Color.
5. Mark Email as Starred, Important, Archived

***Tested features with faked data of:***
- Emails that marked with labels of: Primary, Unread, Starred, Important, Spam, Trash, Promotions, Social ...
- Emails that contains attachments
- Emails that sent from You
- Emails that are SPAM
- Emails that profile picture of sender is unknown
- Emails that content body is extemely long



Progress:
--------------------------------------------------------------------

MileStone 4 Demo (Day4)
https://github.com/zhang86036055/MyGmail/assets/77553874/0f95310e-a4c6-491f-8551-f0472c1c7eb5

MileStone 3 (Day3)
- Customized Navigation menu for email content view header
- Added more buttons and icons as well as their onTapture actions 
- Add more fields e.g. isUnread, isSent on email Model struct for furthur uses
- Finalized previous unfinished layout settings to make it more like Gmail

-MileStone2 demo (Day2)
https://github.com/zhang86036055/MyGmail/assets/77553874/6b2edd8a-f927-4ac7-94aa-8615efc17d8b

Milestone 2 (Day1)
- Search Bar
- Side Menu V1
- Slide to Archive

Milestone 1(Day1)
- Implemented Inbox tableView
- Created InboxMails(Model), MailViewMidel, MailInboxTableView(View) and build connections as fundamental MVVM structure
- Created fake inbox mails for preview
- Starring mail
