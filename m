From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 10 Aug 2023 13:54:55 -0700
Subject: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
In-Reply-To: <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com>
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com>
Message-ID: <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 10, 2023 at 5:26?AM Shaoqin Huang <shahuang@redhat.com> wrote:
>
>
>
> On 8/10/23 00:38, Raghavendra Rao Ananta wrote:
> > Hi Gavin,
> >
> > On Tue, Aug 8, 2023 at 9:00?PM Gavin Shan <gshan@redhat.com> wrote:
> >>
> >>
> >> On 8/9/23 09:13, Raghavendra Rao Ananta wrote:
> >>> There's no reason for the architectures to declare
> >>> kvm_arch_flush_remote_tlbs() in their own headers. Hence to
> >>> avoid this duplication, make the declaration global, leaving
> >>> the architectures to define only __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> >>> as needed.
> >>>
> >>> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> >>> ---
> >>>    arch/mips/include/asm/kvm_host.h | 1 -
> >>>    include/linux/kvm_host.h         | 2 ++
> >>>    2 files changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> >>> index 9b0ad8f3bf327..54a85f1d4f2c8 100644
> >>> --- a/arch/mips/include/asm/kvm_host.h
> >>> +++ b/arch/mips/include/asm/kvm_host.h
> >>> @@ -897,6 +897,5 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> >>>    static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
> >>>
> >>>    #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
> >>> -int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
> >>>
> >>>    #endif /* __MIPS_KVM_HOST_H__ */
> >>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> >>> index e3f968b38ae97..ade5d4500c2ce 100644
> >>> --- a/include/linux/kvm_host.h
> >>> +++ b/include/linux/kvm_host.h
> >>> @@ -1484,6 +1484,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
> >>>    {
> >>>        return -ENOTSUPP;
> >>>    }
> >>> +#else
> >>> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
> >>>    #endif
> >>>
> >>>    #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
> >>
> >> Is the declaration inconsistent to that in arch/x86/include/asm/kvm_host.h?
> >> In order to keep them consistent, I guess we need move kvm_arch_flush_remote_tlbs()
> >> from x86's header file to arch/x86/kvm/mmu/mmu.c and 'inline' needs to be dropped.
> >>
> > Unsure of the original intentions, I didn't want to disturb any
> > existing arrangements. If more people agree to this refactoring, I'm
> > happy to move.
>
> This is amazing to me. This change can be compiled without any error
> even if the declaration inconsistent between the kvm_host.h and x86's
> header file.
>
> I'm curious which option make it possible?
>
After doing some experiments, I think it works because of the order in
which the inline-definition and the declaration are laid out. If the
'inline' part of the function comes first and then the declaration, we
don't see any error. However if the positions were reversed, we would
see an error. (I'm not sure what the technical reason for this is).

Just to be safe, I can move the definition to arch/x86/kvm/mmu/mmu.c
as a non-inline function.

Thank you.
Raghavendra
> Thanks,
> Shaoqin
>
> >
> > Thank you.
> > Raghavendra
> >> Thanks,
> >> Gavin
> >>
> >
>
> --
> Shaoqin
>

