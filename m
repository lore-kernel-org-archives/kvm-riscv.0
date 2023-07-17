From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 17 Jul 2023 09:28:58 -0700
Subject: [PATCH v6 02/11] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <ef2dddcd-f4dd-da9b-c03f-ccd852bb8543@linaro.org>
References: <20230715005405.3689586-1-rananta@google.com> <20230715005405.3689586-3-rananta@google.com>
 <ef2dddcd-f4dd-da9b-c03f-ccd852bb8543@linaro.org>
Message-ID: <CAJHc60xbPoTeX4oKeg45U6QjBw3CS=ZU0PEVCE1zaoAX4Ex7Vw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Philippe,

On Mon, Jul 17, 2023 at 1:13?AM Philippe Mathieu-Daud?
<philmd@linaro.org> wrote:
>
> Hi Raghavendra, David,
>
> On 15/7/23 02:53, Raghavendra Rao Ananta wrote:
> > From: David Matlack <dmatlack@google.com>
> >
> > Use kvm_arch_flush_remote_tlbs() instead of
> > CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> > problem, allowing architecture-specific code to provide a non-IPI
> > implementation of remote TLB flushing.
> >
> > Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> > all architectures on kvm_arch_flush_remote_tlbs() instead of maintaining
> > two mechanisms.
> >
> > Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > duplicating the generic TLB stats across architectures that implement
> > their own remote TLB flush.
> >
> > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > path, but that is a small cost in comparison to flushing remote TLBs.
> >
> > In addition, instead of just incrementing remote_tlb_flush_requests
> > stat, the generic interface would also increment the
> > remote_tlb_flush stat.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
> > Acked-by: Oliver Upton <oliver.upton@linux.dev>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > ---
> >   arch/arm64/include/asm/kvm_host.h | 3 +++
> >   arch/arm64/kvm/Kconfig            | 1 -
> >   arch/arm64/kvm/mmu.c              | 6 +++---
> >   virt/kvm/Kconfig                  | 3 ---
> >   virt/kvm/kvm_main.c               | 2 --
> >   5 files changed, 6 insertions(+), 9 deletions(-)
>
> You are doing 2 changes in the same patch:
>
> - Have ARM use kvm_arch_flush_remote_tlbs() instead of
>    HAVE_KVM_ARCH_TLB_FLUSH_ALL,
> - Drop the now unused HAVE_KVM_ARCH_TLB_FLUSH_ALL.
>
> Commits should be atomic, to allow partial
> revert or cherry-pick.
>
> Preferably splitting this patch in 2:
> Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>
>
Thanks for the suggestion. I guess that makes sense. I'll split the
patch in two for v7.

- Raghavendra
> Regards,
>
> Phil.
>

