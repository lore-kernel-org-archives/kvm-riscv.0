From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 10 Aug 2023 21:09:14 -0700
Subject: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
In-Reply-To: <ZNVtBQvjM45tmbce@google.com>
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com> <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
 <ZNVfsxdYKu9Nt+j+@google.com> <CAJHc60w0By2Q+PCsfwReGXsN5zf5k1ww3Ov4m9Eb-pFH-UKBDg@mail.gmail.com>
 <ZNVtBQvjM45tmbce@google.com>
Message-ID: <CAJHc60y0izDbTE+XETkSURBzJiRrzmMwQB3+eNJ3YXR-kcg30g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 10, 2023 at 4:04?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Aug 10, 2023, Raghavendra Rao Ananta wrote:
> > On Thu, Aug 10, 2023 at 3:20?PM Sean Christopherson <seanjc@google.com> wrote:
> > > On Thu, Aug 10, 2023, Raghavendra Rao Ananta wrote:
> > > > After doing some experiments, I think it works because of the order in
> > > > which the inline-definition and the declaration are laid out. If the
> > > > 'inline' part of the function comes first and then the declaration, we
> > > > don't see any error. However if the positions were reversed, we would
> > > > see an error. (I'm not sure what the technical reason for this is).
> > > >
> > > > Just to be safe, I can move the definition to arch/x86/kvm/mmu/mmu.c
> > > > as a non-inline function.
> > >
> > > No need, asm/kvm_host.h _must_ be included before the declaration, otherwise the
> > > declaration wouldn't be made because __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS wouldn't
> > > be defined.  I.e. we won't run into issues where the non-static declaration comes
> > > before the static inline definition.
> > >
> > > C99 explicitly covers this case:
> > >
> > >   6.2.2 Linkages of identifiers
> > >
> > >   ...
> > >
> > >   If the declaration of a file scope identifier for an object or a function contains the storage-
> > >   class specifier static, the identifier has internal linkage.
> > >
> > >   For an identifier declared with the storage-class specifier extern in a scope in which a
> > >   prior declaration of that identifier is visible if the prior declaration specifies internal or
> > >   external linkage, the linkage of the identifier at the later declaration is the same as the
> > >   linkage specified at the prior declaration. If no prior declaration is visible, or if the prior
> > >   declaration specifies no linkage, then the identifier has external linkage.
> > >
> > > In short, because the "static inline" declared internal linkage first, it wins.
> > Thanks for sharing this! I can keep the 'static inline' definition as
> > is then. However, since a later patch (patch-05/14) defines
> > kvm_arch_flush_remote_tlbs_range() in arch/x86/kvm/mmu/mmu.c, do you
> > think we can move this definition to the .c file as well for
> > consistency?
>
> We "can", but I don't see any reason to do so.  Trying to make helpers consistently
> inline or not is usually a fools errand.  And in this case, I'd actually rather go
> the opposite direction and make the range variant an inline.
>
> Ha!  And I can justify that with minimal effort.  The below makes the helper a
> straight passthrough for CONFIG_HYPERV=n builds, at which point I think it makes
> sense for it to be inline.
>
> If it won't slow your series down even more, any objection to sliding the below
> patch in somewhere before patch 5?  And then add a patch to inline the range-based
> helper?
>
Since it is a little diverted from the rest of the series' goal (and
yes, the slowing down part), do you mind if we send it as a separate
series? :)
I'll keep the functions as we have on v8 for now.

Thank you.
Raghavendra
> Disclaimer: compile tested only.
>
> ---
> From: Sean Christopherson <seanjc@google.com>
> Date: Thu, 10 Aug 2023 15:58:53 -0700
> Subject: [PATCH] KVM: x86/mmu: Declare flush_remote_tlbs{_range}() hooks iff
>  HYPERV!=n
>
> Declare the kvm_x86_ops hooks used to wire up paravirt TLB flushes when
> running under Hyper-V if and only if CONFIG_HYPERV!=n.  Wrapping yet more
> code with IS_ENABLED(CONFIG_HYPERV) eliminates a handful of conditional
> branches, and makes it super obvious why the hooks *might* be valid.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm-x86-ops.h | 2 ++
>  arch/x86/include/asm/kvm_host.h    | 4 ++++
>  arch/x86/kvm/mmu/mmu.c             | 6 ++++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index 13bc212cd4bc..6bc1ab0627b7 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -54,8 +54,10 @@ KVM_X86_OP(set_rflags)
>  KVM_X86_OP(get_if_flag)
>  KVM_X86_OP(flush_tlb_all)
>  KVM_X86_OP(flush_tlb_current)
> +#if IS_ENABLED(CONFIG_HYPERV)
>  KVM_X86_OP_OPTIONAL(flush_remote_tlbs)
>  KVM_X86_OP_OPTIONAL(flush_remote_tlbs_range)
> +#endif
>  KVM_X86_OP(flush_tlb_gva)
>  KVM_X86_OP(flush_tlb_guest)
>  KVM_X86_OP(vcpu_pre_run)
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 60d430b4650f..04fc80112dfe 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1604,9 +1604,11 @@ struct kvm_x86_ops {
>
>         void (*flush_tlb_all)(struct kvm_vcpu *vcpu);
>         void (*flush_tlb_current)(struct kvm_vcpu *vcpu);
> +#if IS_ENABLED(CONFIG_HYPERV)
>         int  (*flush_remote_tlbs)(struct kvm *kvm);
>         int  (*flush_remote_tlbs_range)(struct kvm *kvm, gfn_t gfn,
>                                         gfn_t nr_pages);
> +#endif
>
>         /*
>          * Flush any TLB entries associated with the given GVA.
> @@ -1814,6 +1816,7 @@ static inline struct kvm *kvm_arch_alloc_vm(void)
>  #define __KVM_HAVE_ARCH_VM_FREE
>  void kvm_arch_free_vm(struct kvm *kvm);
>
> +#if IS_ENABLED(CONFIG_HYPERV)
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
>  static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
>  {
> @@ -1823,6 +1826,7 @@ static inline int kvm_arch_flush_remote_tlb(struct kvm *kvm)
>         else
>                 return -ENOTSUPP;
>  }
> +#endif
>
>  #define kvm_arch_pmi_in_guest(vcpu) \
>         ((vcpu) && (vcpu)->arch.handling_intr_from_guest)
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 9e4cd8b4a202..0189dfecce1f 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -271,18 +271,24 @@ static inline unsigned long kvm_mmu_get_guest_pgd(struct kvm_vcpu *vcpu,
>
>  static inline bool kvm_available_flush_remote_tlbs_range(void)
>  {
> +#if IS_ENABLED(CONFIG_HYPERV)
>         return kvm_x86_ops.flush_remote_tlbs_range;
> +#else
> +       return false;
> +#endif
>  }
>
>  void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
>                                  gfn_t nr_pages)
>  {
> +#if IS_ENABLED(CONFIG_HYPERV)
>         int ret = -EOPNOTSUPP;
>
>         if (kvm_x86_ops.flush_remote_tlbs_range)
>                 ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
>                                                                    nr_pages);
>         if (ret)
> +#endif
>                 kvm_flush_remote_tlbs(kvm);
>  }
>
>
> base-commit: bc9e68820274c025840d3056d63f938d74ca35bb
> --
>

