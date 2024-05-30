From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 20:27:45 -0700
Subject: [PATCH v4 4/7] KVM: Move MMU lock acquisition for
 test/clear_young to architecture
In-Reply-To: <ZlekYljG7KJwblUj@google.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-5-jthoughton@google.com> <ZlekYljG7KJwblUj@google.com>
Message-ID: <CADrL8HVZxoO33F2UJBoTjF_SXpxyZmH=RTM5G3stgo_kRPjazA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 29, 2024 at 2:55?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, May 29, 2024, James Houghton wrote:
> > For implementation mmu_notifier_{test,clear}_young, the KVM memslot
> > walker used to take the MMU lock for us. Now make the architectures
> > take it themselves.
>
> Hmm, *forcing* architectures to take mmu_lock is a step backwards.  Rather than
> add all of this churn, what about adding CONFIG_KVM_MMU_NOTIFIER_LOCKLESS, e.g.
>
> static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
>                                                          unsigned long start,
>                                                          unsigned long end,
>                                                          gfn_handler_t handler)
> {
>         struct kvm *kvm = mmu_notifier_to_kvm(mn);
>         const struct kvm_mmu_notifier_range range = {
>                 .start          = start,
>                 .end            = end,
>                 .handler        = handler,
>                 .on_lock        = (void *)kvm_null_fn,
>                 .flush_on_ret   = false,
>                 .may_block      = false,
>                 .lockless       = IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_LOCKLESS),
>         };
>
>         return __kvm_handle_hva_range(kvm, &range).ret;
> }

Thanks Sean, yes this is a lot better. I will do this for v5.

