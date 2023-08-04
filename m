From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 4 Aug 2023 11:19:02 -0700
Subject: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com>
 <877cqdqw12.wl-maz@kernel.org> <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
Message-ID: <CAJHc60zN-dc2E-fS7fuXgkrfGD9bqW6tMy2GRZxbHOeZv0ZOBw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 2, 2023 at 4:28?PM Raghavendra Rao Ananta
<rananta@google.com> wrote:
>
> Sure, I'll change it to kvm_arch_flush_vm_tlbs() in v8.
>
While working on the renaming, I realized that since this function is
called from kvm_main.c's kvm_flush_remote_tlbs(). Do we want to rename
this and the other kvm_flush_*() functions that the series introduces
to match their kvm_arch_flush_*() counterparts?  (spiraling more into
this, we also have the 'remote_tlb_flush_requests' and
'remote_tlb_flush' stats)

Thank you.
Raghavendra

> Thanks,
> Raghavendra
>
> On Wed, Aug 2, 2023 at 8:55?AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Mon, 31 Jul 2023 22:50:07 +0100,
> > Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Thu, Jul 27, 2023, Marc Zyngier wrote:
> > > > On Sat, 22 Jul 2023 03:22:41 +0100,
> > > > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > > >
> > > > > Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> > > > > standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > > > > duplicating the generic TLB stats across architectures that implement
> > > > > their own remote TLB flush.
> > > > >
> > > > > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > > > > path, but that is a small cost in comparison to flushing remote TLBs.
> > > >
> > > > Well, there is no such thing as a "remote TLB" anyway. We either have
> > > > a non-shareable or inner-shareable invalidation. The notion of remote
> > > > would imply that we track who potentially has a TLB, which we
> > > > obviously don't.
> > >
> > > Maybe kvm_arch_flush_vm_tlbs()?  The "remote" part is misleading even on x86 when
> > > running on Hyper-V, as the flush may be done via a single hypercall and by kicking
> > > "remote" vCPUs.
> >
> > Yup, this would be much better.
> >
> > Thanks,
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

