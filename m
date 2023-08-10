From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 10 Aug 2023 15:34:00 -0700
Subject: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
In-Reply-To: <ZNVfsxdYKu9Nt+j+@google.com>
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com> <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
 <ZNVfsxdYKu9Nt+j+@google.com>
Message-ID: <CAJHc60w0By2Q+PCsfwReGXsN5zf5k1ww3Ov4m9Eb-pFH-UKBDg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 10, 2023 at 3:20?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Aug 10, 2023, Raghavendra Rao Ananta wrote:
> > On Thu, Aug 10, 2023 at 5:26?AM Shaoqin Huang <shahuang@redhat.com> wrote:
> > > On 8/10/23 00:38, Raghavendra Rao Ananta wrote:
> > > >>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > >>> index e3f968b38ae97..ade5d4500c2ce 100644
> > > >>> --- a/include/linux/kvm_host.h
> > > >>> +++ b/include/linux/kvm_host.h
> > > >>> @@ -1484,6 +1484,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
> > > >>>    {
> > > >>>        return -ENOTSUPP;
> > > >>>    }
> > > >>> +#else
> > > >>> +int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
> > > >>>    #endif
> > > >>>
> > > >>>    #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
> > > >>
> > > >> Is the declaration inconsistent to that in arch/x86/include/asm/kvm_host.h?
> > > >> In order to keep them consistent, I guess we need move kvm_arch_flush_remote_tlbs()
> > > >> from x86's header file to arch/x86/kvm/mmu/mmu.c and 'inline' needs to be dropped.
> > > >>
> > > > Unsure of the original intentions, I didn't want to disturb any
> > > > existing arrangements. If more people agree to this refactoring, I'm
> > > > happy to move.
> > >
> > > This is amazing to me. This change can be compiled without any error
> > > even if the declaration inconsistent between the kvm_host.h and x86's
> > > header file.
> > >
> > > I'm curious which option make it possible?
> > >
> > After doing some experiments, I think it works because of the order in
> > which the inline-definition and the declaration are laid out. If the
> > 'inline' part of the function comes first and then the declaration, we
> > don't see any error. However if the positions were reversed, we would
> > see an error. (I'm not sure what the technical reason for this is).
> >
> > Just to be safe, I can move the definition to arch/x86/kvm/mmu/mmu.c
> > as a non-inline function.
>
> No need, asm/kvm_host.h _must_ be included before the declaration, otherwise the
> declaration wouldn't be made because __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS wouldn't
> be defined.  I.e. we won't run into issues where the non-static declaration comes
> before the static inline definition.
>
> C99 explicitly covers this case:
>
>   6.2.2 Linkages of identifiers
>
>   ...
>
>   If the declaration of a file scope identifier for an object or a function contains the storage-
>   class specifier static, the identifier has internal linkage.
>
>   For an identifier declared with the storage-class specifier extern in a scope in which a
>   prior declaration of that identifier is visible if the prior declaration specifies internal or
>   external linkage, the linkage of the identifier at the later declaration is the same as the
>   linkage specified at the prior declaration. If no prior declaration is visible, or if the prior
>   declaration specifies no linkage, then the identifier has external linkage.
>
> In short, because the "static inline" declared internal linkage first, it wins.
Thanks for sharing this! I can keep the 'static inline' definition as
is then. However, since a later patch (patch-05/14) defines
kvm_arch_flush_remote_tlbs_range() in arch/x86/kvm/mmu/mmu.c, do you
think we can move this definition to the .c file as well for
consistency?

Thank you.
Raghavendra


Raghavendra

