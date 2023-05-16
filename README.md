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

1.Compose Email Button (*NewEmail screen not implemented)

https://github.com/zhang86036055/MyGmail/assets/77553874/93d5dbde-e2d1-474e-867d-53037ad3ff3d

2. Search by senders' name

https://github.com/zhang86036055/MyGmail/assets/77553874/5c069f9b-935c-4815-9eba-77de296bb7e2

3. Star Email

https://github.com/zhang86036055/MyGmail/assets/77553874/7aa1c003-a03f-40d1-8e53-173b87dd0651

4. Archive

https://github.com/zhang86036055/MyGmail/assets/77553874/0ff35fea-2751-43df-9d41-0c949f579c52

5. Mark as important

https://github.com/zhang86036055/MyGmail/assets/77553874/3263aa16-2373-449e-8ac3-a91bf9451267

6.Show unread emails body in bold, tags unread numbers by catagory. Specifically: Bottom tab shows unreads counts that are not Archived, Spam or Trash

https://github.com/zhang86036055/MyGmail/assets/77553874/148c744c-d12a-45da-83a3-6df43b4901b7

7. Show User's profile picture if exists, otherwise show senderName's first character with a random Color.

https://github.com/zhang86036055/MyGmail/assets/77553874/c33c3045-107b-48a5-b56a-d108717620f4

8. Switch buttom bar between EmailList and VideoChat(Not Implemented)

https://github.com/zhang86036055/MyGmail/assets/77553874/5be99f06-c297-4ef1-a8c0-981ef1bf1b53

9. Side Menu with sliding left gester, tapping buttons will filter emails by catagory

https://github.com/zhang86036055/MyGmail/assets/77553874/38f5580d-c1eb-4260-87b5-be9932828a23



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
