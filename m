From: Sean Christopherson <seanjc@google.com>
Date: Fri, 4 Nov 2022 20:15:36 +0000
Subject: [PATCH 02/44] KVM: Initialize IRQ FD after arch hardware setup
In-Reply-To: <Y2Rfz+TIcdfcawxh@gao-cwp>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-3-seanjc@google.com>
 <Y2Rfz+TIcdfcawxh@gao-cwp>
Message-ID: <Y2Vy6Eq89tQa+3bq@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 04, 2022, Chao Gao wrote:
> On Wed, Nov 02, 2022 at 11:18:29PM +0000, Sean Christopherson wrote:
> > 
> >+	r = kvm_irqfd_init();
> >+	if (r)
> >+		goto err_irqfd;
> >+
> > 	r = kvm_async_pf_init();
> > 	if (r)
> >-		goto out_free_4;
> >+		goto err_async_pf;
> > 
> > 	kvm_chardev_ops.owner = module;
> > 
> >@@ -5927,6 +5926,9 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
> > 	kvm_vfio_ops_exit();
> > err_vfio:
> > 	kvm_async_pf_deinit();
> >+err_async_pf:
> >+	kvm_irqfd_exit();
> 
> >+err_irqfd:
> > out_free_4:
> 
> Do you mind removing one of the two labels?

Ah, I meant to tack on a patch at the very end to clean up these labels once the
dust had settled, e.g. to also resolve the "err" vs. "out" mess I created (on
purpose, because trying to describe the "out" path was frustrating and generated
too much churn).

