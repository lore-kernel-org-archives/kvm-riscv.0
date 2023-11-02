From: Sean Christopherson <seanjc@google.com>
Date: Thu, 2 Nov 2023 07:41:30 -0700
Subject: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
In-Reply-To: <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Message-ID: <ZUO1Giju0GkUdF0o@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023, Fuad Tabba wrote:
> Hi,
> 
> On Fri, Oct 27, 2023 at 7:22?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > Add flags to "struct kvm_gfn_range" to let notifier events target only
> > shared and only private mappings, and write up the existing mmu_notifier
> > events to be shared-only (private memory is never associated with a
> > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> >
> > Add two flags so that KVM can handle the three possibilities (shared,
> > private, and shared+private) without needing something like a tri-state
> > enum.
> >
> > Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB at google.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  include/linux/kvm_host.h | 2 ++
> >  virt/kvm/kvm_main.c      | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 96aa930536b1..89c1a991a3b8 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -263,6 +263,8 @@ struct kvm_gfn_range {
> >         gfn_t start;
> >         gfn_t end;
> >         union kvm_mmu_notifier_arg arg;
> > +       bool only_private;
> > +       bool only_shared;
> 
> If these flags aren't used in this patch series, should this patch be
> moved to the other series?

If *both* TDX and SNP need this patch, then I think it's probably worth applying
it now to make their lives easier.  But if only one needs the support, then I
completely agree this should be punted to whichever series needs it (this also
came up in v11, but we didn't force the issue).

Mike, Isaku?

> Also, if shared+private is a possibility, doesn't the prefix "only_"
> confuse things a bit? I.e., what is shared+private, is it when both
> are 0 or when both are 1? I assume it's the former (both are 0), but
> it might be clearer.

Heh, I was hoping that "only_private && only_shared" would be obviously nonsensical.

The only alternative I can think would be to add an enum, e.g.

	enum {
		PROCESS_PRIVATE_AND_SHARED,
		PROCESS_ONLY_PRIVATE,
		PROCESS_ONLY_SHARED,
	};

because every other way of expressing the flags either results in more confusion
or an unsafe default.  I.e. I want zapping only private or only shared to require
the caller to explicitly set a non-zero value, which is how I ended up with
"only_{private,shared}" as opposed to "process_{private,shared}".

