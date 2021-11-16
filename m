From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 16 Nov 2021 19:13:45 +0000
Subject: [PATCH 6/7] KVM: powerpc: Use Makefile.kvm for common files
In-Reply-To: <YZP76Un0mip17E1K@google.com>
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
 <20211116115051.119956-6-dwmw2@infradead.org> <YZP76Un0mip17E1K@google.com>
Message-ID: <b26e62070c0a3e5c4b0179772006474402ec32f8.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-11-16 at 18:43 +0000, Sean Christopherson wrote:
> On Tue, Nov 16, 2021, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> > 
> > It's all fairly baroque but in the end, I don't think there's any reason
> > for $(KVM)/irqchip.o to have been handled differently, as they all end
> > up in $(kvm-y) in the end anyway, regardless of whether they get there
> > via $(common-objs-y) and the CPU-specific object lists.
> > 
> > The generic Makefile.kvm uses HAVE_KVM_IRQCHIP for irqchip.o instead of
> > HAVE_KVM_IRQ_ROUTING. That change is fine (and arguably correct) because
> > they are both set together for KVM_MPIC, or neither is set.
> 
> Nope.
> 
>   Symbol: HAVE_KVM_IRQCHIP [=y]
>   Type  : bool
>   Defined at virt/kvm/Kconfig:7
>   Selected by [m]:
>     - KVM_XICS [=y] && VIRTUALIZATION [=y] && KVM_BOOK3S_64 [=m] && !KVM_MPIC [=n]
>   Selected by [n]:
>     - KVM_MPIC [=n] && VIRTUALIZATION [=y] && KVM [=y] && E500 [=n]
> 
> leads to this and a whole pile of other errors
> 
> arch/powerpc/kvm/../../../virt/kvm/irqchip.c: In function ?kvm_irq_map_gsi?:
> arch/powerpc/kvm/../../../virt/kvm/irqchip.c:31:35: error: invalid use of undefined type ?struct kvm_irq_routing_table?
>    31 |         if (irq_rt && gsi < irq_rt->nr_rt_entries) {
>       |                                   ^~
> 

Hm, perhaps it should have been like this then (incremental):

+++ b/virt/kvm/Makefile.kvm
@@ -9,6 +9,6 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
 kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
 kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
 kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
-kvm-$(CONFIG_HAVE_KVM_IRQCHIP) += $(KVM)/irqchip.o
+kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o


> Side topic, please don't post a new version/series in-reply-to a different series.
> b4 also gets confused in this case, e.g. it tried to grab the original patch.  b4
> has also made me really lazy, heaven forbid I actually had to manually grab these
> from mutt :-)

Sorry ;)

I think that one might even be a new series in reply to what was
already a second series on top of what I was *actually* trying to do
when I first started shaving this yak. Or maybe what I was originally
trying to implement has already been lost in the noise :)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211116/22f91a95/attachment-0001.p7s>
