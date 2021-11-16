From: Sean Christopherson <seanjc@google.com>
Date: Tue, 16 Nov 2021 18:43:53 +0000
Subject: [PATCH 6/7] KVM: powerpc: Use Makefile.kvm for common files
In-Reply-To: <20211116115051.119956-6-dwmw2@infradead.org>
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
 <20211116115051.119956-6-dwmw2@infradead.org>
Message-ID: <YZP76Un0mip17E1K@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 16, 2021, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> It's all fairly baroque but in the end, I don't think there's any reason
> for $(KVM)/irqchip.o to have been handled differently, as they all end
> up in $(kvm-y) in the end anyway, regardless of whether they get there
> via $(common-objs-y) and the CPU-specific object lists.
> 
> The generic Makefile.kvm uses HAVE_KVM_IRQCHIP for irqchip.o instead of
> HAVE_KVM_IRQ_ROUTING. That change is fine (and arguably correct) because
> they are both set together for KVM_MPIC, or neither is set.

Nope.

  Symbol: HAVE_KVM_IRQCHIP [=y]
  Type  : bool
  Defined at virt/kvm/Kconfig:7
  Selected by [m]:
    - KVM_XICS [=y] && VIRTUALIZATION [=y] && KVM_BOOK3S_64 [=m] && !KVM_MPIC [=n]
  Selected by [n]:
    - KVM_MPIC [=n] && VIRTUALIZATION [=y] && KVM [=y] && E500 [=n]

leads to this and a whole pile of other errors

arch/powerpc/kvm/../../../virt/kvm/irqchip.c: In function ?kvm_irq_map_gsi?:
arch/powerpc/kvm/../../../virt/kvm/irqchip.c:31:35: error: invalid use of undefined type ?struct kvm_irq_routing_table?
   31 |         if (irq_rt && gsi < irq_rt->nr_rt_entries) {
      |                                   ^~


Side topic, please don't post a new version/series in-reply-to a different series.
b4 also gets confused in this case, e.g. it tried to grab the original patch.  b4
has also made me really lazy, heaven forbid I actually had to manually grab these
from mutt :-)

