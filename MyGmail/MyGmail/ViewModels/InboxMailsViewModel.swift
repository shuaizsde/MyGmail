//
//  InboxMailsViewModel.swift
//  MyGmail
//
//  Created by Shuai Zhang on 5/8/23.
//

import Foundation

class InboxMailsViewModel: ObservableObject {
    typealias Mail = InboxMails.Mail

    // MARK: Faked data

    private static let preview: [InboxMails.Mail] = [
        Mail(
            profilePicture: "simon",
            sender: "Simon Zhang",
            time: "11:24 AM",
            subject: "*Simon Resume *",
            content: """
            3+ years of experience full stack software developer with a versatile skillset. Developed products with
            2 billion+ daily active users,/n proficient in IOS and Web development with Swift , Objective-C, Java and
            Javascript. Experienced in producing complex projects with programming, designing, management skills. A committed
            team player who consistently delivers results.

            WORK EXPERIENCE
            Whatsapp, Meta
            Whatsapp Communities, Software Engineer IC4 MountainView,CA | July2022-current

            ...
            """,
            isUnread: false,
            isPrimary: true,
            isStarred: true,
            isImportant: true
        ),
        Mail(
            profilePicture: "cecillia",
            sender: "Cecilia D'Costa",
            time: "10:15 AM",
            subject: "Re: Team Match Update",
            content: """
            Thanks, Simon. I have your call scheduled for ***. Doc is updated with the details. Please be sure to take some
            time to review the *****and specifically practice/prep for the points listed below. Please let me know if you
            have any questions and let me know how the call goes once completed.
            """,
            isUnread: false,
            isPrimary: true,
            isStarred: true,
            isImportant: true
        ),
        Mail(
            profilePicture: "person3",
            sender: "Jessica Lu",
            time: "06:11 AM",
            subject: "Good luck on your interview",
            content: """
            Good luck baby, you are my hero !!! Love you
            """,
            isUnread: false,
            isPrimary: true,
            isStarred: true
        ),
        Mail(
            profilePicture: nil,
            sender: "SPAM",
            time: "02:48 AM",
            subject: "Delivered: Your Amazon.com order #114-7107059-2488333",
            content: """
            Hi SZhang12345,
            Your package has been delivered to the mailroom.,
            Order info
            1 item
            Order #114-7102351239-212345
            Return or replace items in Your Orders.
            """,
            isSpam: true
        ),
        Mail(
            profilePicture: nil,
            sender: "SPAM",
            time: "02:48 AM",
            subject: "Delivered: Your Amazon.com order #114-7107059-2488333",
            content: """
            Hello,
                I've been trying to contact you. Did you get the message I sent you earlier? I have a profitable idea
            to share with you. Reply now for more details.

            Best Regards
            Peggy Chan.

            """,
            isSpam: true
        ),
        Mail(
            profilePicture: nil,
            sender: "-CVS Rewards",
            time: "May 04",
            subject: ">>simon123!! -You-have won an $90-CVS-Gift-Card",
            content: """
            Your_Name _ Came Up For_a RTIC backpackCooler __ Reward
            """,
            isTrash: true
        ),
        Mail(
            profilePicture: "person5",
            sender: "John Smith",
            time: "May 02",
            subject: "website package",
            content: """
            I am XXX, Web Development Manager and I work with 150+experienced IT professionals who are into:
            Website designing & development, Magento, Wordpress, Joomla, PHP Development, Logo Design & Digital
            Marketing.If you are interested please share your requirements so that we can assist your Further.
            Kind Regards,
            xxx
            """,
            isPrimary: true,
            isSocial: true
        ),
        Mail(
            profilePicture: "person6",
            sender: "John Smith2",
            time: "April 28",
            subject: "Test Test",
            content: """
            To have this test, you swallow a string with a weighted gelatin capsule on the end. The string is pulled out
            4 hours later. Any bile, blood, or mucus attached to the string is examined under the microscope. This is done
            to look for cells and parasites or parasite eggs.
            """,
            isPrimary: true,
            isSocial: true
        ),
        Mail(
            profilePicture: "person7",
            sender: "John Smith 3",
            time: "April 26",
            subject: "Letter of complaint",
            content: """
            On January 30th, 2020, I made a reservation at your restaurant located at 1234 Mulberry Lane for a birthday dinner
            for four people. This letter is intended to bring certain issues to your attention.
            Unfortunately, we did not enjoy our dinner due to the fact that the food was very slow to arrive and we received
            the wrong dishes. It’s understandable that it was a busy time at your restaurant, but the quality of the service
            was not as expected.To resolve this problem, I would appreciate it if you could provide compensation in the form of a
            gift voucher or discount on a future meal.
            I’m looking forward to your reply.
            With regards,
            [Your name]
            """,
            isUnread: true,
            isSocial: true
        ),
        Mail(
            profilePicture: "person8",
            sender: "John Smith 4",
            time: "April 24",
            subject: "Test Test",
            content: """
            To have this test, you swallow a string with a weighted gelatin capsule on the end. The string is pulled out 4 hours later.
            Any bile, blood, or mucus attached to the string is examined under the microscope. This is done to look for cells and parasites
            or parasite eggs.
            """,
            isUnread: true,
            isSpam: true
        ),

        Mail(
            profilePicture: nil,
            sender: "Tom Kitty",
            time: "11:24 AM",
            subject: "First Email from Simon",
            content: """
            Hi there, I’m emailing you today to let you know we have created a new project called myGmail. In this article, you’ll learn
            how to do it by yourself with SwiftUI If you know anybody else who’ll find this useful, please forward the email to them. Let
            us know if you face any problems accessing the project
            by replying to this email. We’ll get back to you ASAP and ensure you gain access to it immediately.
            Thank you
            """,
            isPrimary: true,
            isPromotions: true

        ),
        Mail(
            profilePicture: "simon",
            sender: "You",
            time: "10:15 AM",
            subject: "Re: Team Match Update",
            content: """
            Sounds great! I will do my best
            Simon
            """,
            isUnread: false,
            isSent: true
        ),
        Mail(
            profilePicture: "simon",
            sender: "You",
            time: "06:11 AM",
            subject: "Re:Good luck on your interview",
            content: """
            Let's ROCK!!!
            Simon
            """,
            isUnread: false,
            isSent: true
        ),
        Mail(
            profilePicture: nil,
            sender: "Annie Lee",
            time: "02:48 AM",
            subject: "from unknown sender",
            content: """
            put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,put me into spam,
            """,
            isSpam: true
        ),
        Mail(
            profilePicture: "person7",
            sender: "Cara Sue",
            time: "May 04",
            subject: "Something Update",
            content: """
            I’m sure your schedule is very busy, so this email is simply to remind you of your upcoming interview with [name] who is a candidate for [name of position].
            The interview will be at [time] on [date] in [location].
            Please let me know if there’s anything I can help you with to prepare to interview this candidate.
            Best,
            [Your name]

            """,
            isUnread: false,
            isDraft: true
        ),
        Mail(
            profilePicture: "person10",
            sender: "Tim Cook",
            time: "May 02",
            subject: "Test Test",
            content: """
            Please accept my deepest apologies on behalf of [company or business name] for the poor experience you had at our restaurant.
            I want to thank you for bringing these issues to my attention and please know that we are making every effort to correct our mistakes so events like these don’t happen in the future.
            As a token of our apology, please accept a gift card in the amount of $50.00 that can be used at our restaurant in the future.
            I hope to greet you again soon at [company or business name].
            Yours sincerely,
            YYY
            """,
            isPrimary: true
        ),
        Mail(
            profilePicture: nil,
            sender: "SPAM2",
            time: "April 28",
            subject: "Test Test",
            content: """
            To have this test, you swallow a string with a weighted gelatin capsule on the end. The string is pulled out 4 hours later.
            Any bile, blood, or mucus attached to the string is examined under the microscope. This is done to look for cells and
            parasites or parasite eggs.
            """,
            isSpam: true
        )
    ]

    @Published private var model = createInboxMails()

    private static func createInboxMails() -> InboxMails {
        return InboxMails(preview)
    }

    var mails: [Mail] {
        return model.mails
    }

    var unreads: Int {
        var count = 0
        for mail in model.mails {
            if mail.isUnread {
                count += 1
            }
        }
        return count
    }

    func getUnreads(of catagory: String) -> Int {
        var count = 0

        var isUnderCatagory = false
        for mail in model.mails {
            switch menuButton(rawValue: catagory) {
            case .allInboxes:
                isUnderCatagory = !mail.isTrash && !mail.isSpam && !mail.isTrash && !mail.isArchived
            case .primary:
                isUnderCatagory = mail.isPrimary
            case .social:
                isUnderCatagory = mail.isSocial
            case .promotions:
                isUnderCatagory = mail.isPromotions
            case .starred:
                isUnderCatagory = mail.isStarred
            case .snoozed:
                isUnderCatagory = mail.isSnoozed
            case .important:
                isUnderCatagory = mail.isImportant
            case .sent:
                isUnderCatagory = mail.isSent
            case .scheduled:
                isUnderCatagory = mail.isScheduled
            case .drafts:
                isUnderCatagory = mail.isDraft
            case .spam:
                isUnderCatagory = mail.isSpam
            case .allMail:
                isUnderCatagory = true
            case .trash:
                isUnderCatagory = mail.isTrash
            case .archived:
                isUnderCatagory = mail.isTrash
            default:
                isUnderCatagory = false
            }

            if isUnderCatagory && mail.isUnread {
                count += 1
            }
        }

        return count
    }

    init(model: InboxMails = createInboxMails()) {
        self.model = model
    }

    func star(_ mail: Mail) {
        model.star(mail)
    }

    func important(_ mail: Mail) {
        model.important(mail)
    }

    func archive(_ mail: Mail) {
        model.archive(mail)
    }

    func read(_ mail: Mail) {
        model.read(mail)
    }
}
