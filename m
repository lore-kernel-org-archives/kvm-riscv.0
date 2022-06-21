From: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Jun 2022 17:59:07 +0000
Subject: [PATCH v6 19/22] KVM: x86/mmu: Zap collapsible SPTEs in shadow
 MMU at all possible levels
In-Reply-To: <CALzav=dG9f2X8GBLjQgR-Lj4yPKX2Adg3C+9_9aC83A7mzmbtw@mail.gmail.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-20-dmatlack@google.com>
 <Yqyzavjp9eS9p4+m@google.com>
 <CALzav=dG9f2X8GBLjQgR-Lj4yPKX2Adg3C+9_9aC83A7mzmbtw@mail.gmail.com>
Message-ID: <YrIG6/dymlPQGwg1@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 21, 2022, David Matlack wrote:
> On Fri, Jun 17, 2022 at 10:01 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, May 16, 2022, David Matlack wrote:
> > > +static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
> > > +                                        const struct kvm_memory_slot *slot)
> > > +{
> > > +     /*
> > > +      * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
> > > +      * pages that are already mapped at the maximum possible level.
> > > +      */
> > > +     if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
> > > +                           PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
> > > +                           true))
> >
> > No need to wrap, "true" fits easily on the previous line.  That said, I don't see
> > any point in adding a helper.  It's highly unlike there will be another caller,
> > and IMO it's not any more readable since I have to go look at another function
> > when reading kvm_mmu_zap_collapsible_sptes().
> 
> I could see an argument for readability either way. Putting it in a
> helper function abstracts away the details, which would aid
> readability if the reader does not care about the implementation
> details of the rmap case.

I'm ok either way, dealer's choice.

