From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Mar 2024 12:21:31 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.9
In-Reply-To: <6091398f-a2b3-4dc9-9f33-d7459a0a9594@redhat.com>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com> <CAAhSdy2Mu08RsBM+7FMjkcV49p9gOj3UKEoZnPAVk92e_3q=sw@mail.gmail.com>
 <ZesxeoyFZUeo-Z9F@google.com> <6091398f-a2b3-4dc9-9f33-d7459a0a9594@redhat.com>
Message-ID: <CAAhSdy2XEwtn47E5R93gGYHvDv5J0NSWXWyrmhe_kjQAw79N_w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 11, 2024 at 7:40?PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/8/24 16:40, Sean Christopherson wrote:
> > You're missing the point.  I don't care when patches land in the RISC-V tree, nor
> > do I care that you made a last minute tweak to fix a bug.  I care when commits
> > show up in linux-next, and*none*  of these commits were in linux-next until
> > yesterday.
> >
> >    $ git tag -l --contains 2c5af1c8460376751d57c50af88a053a3b869926
> >    next-20240307
> >    next-20240308
> >
> > The*entire*  purpose of linux-next is to integrate*all*  work destined for the
> > next kernel into a single tree, so that conflicts, bugs, etc. can be found and
> > fixed*before*  the next merge window.
>
> Indeed, and this is more important as more work is routed towards
> different trees.  At this point we have 5 more or less active
> architectures, and especially in selftests land it's important to
> coordinate with each other.
>
> Anup, ideally, when you say that a patch is "queued" it should only be a
> short time before you're ready to send it to me - and that means putting
> it in a place where linux-next picks it up.  For x86 I generally compile
> test and run kvm-unit-tests on one of Intel or AMD, and leave the
> remaining tests for later (because they take a day or two), but in
> general it's a matter of days before linux-next get the patches.
>

Currently, I was collecting patches in the queue and allowing people
(including myself) to test the queue for a longer time and updating
"next" branch only a couple of weeks before I send PR.

Going forward, I will follow your suggestion. This means once a
series is tested on queue, I will move it to the "next" branch sooner
so that "linux-next" picks it sooner.

Regards,
Anup

