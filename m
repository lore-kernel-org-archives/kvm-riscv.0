Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08302C87FDA
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spVkyTqms2mrA9o8sE+VWwdOZk8xdj/SjMQPud2VLPs=; b=CvJ4e/nYMVrd1N
	FxeZTPtk2BxY85DierxtGVXSblafD77rQLvVfMFLPUY2eZXl9ktvNEyykOpHpklZrAM8br2m408Vt
	TubpG2WJd5oeaHSFYxZ5+16WUa6KXZXBjRqSkoNBICE981YZQ64MGZo3DuqcvMNXnyk2NEsS3DaB4
	hBY8Zrsug8dAE24GV/GR2PCV7M/WuDMF4//DZngMYh9JoSQpe3kYkq0Om0et/mQb7nIdy3x+3whsZ
	Ca524zWYYsj9ZvnEhMnIp0TTfHTwiRVrWEU5u4JYjNxuIN8vJ4U9aKaQP595ud9wZoal1Hf63ZhQj
	sYsVP+kpduACFWHVTXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkk-00000006ZPP-3EF4;
	Mon, 11 Aug 2025 06:11:26 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkd-00000006ZIe-2K8M;
	Mon, 11 Aug 2025 06:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754892677; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=JlGDH5MhkH4wQ0znvBetGKXo3m7u1SGgHzon2WgQpFY=;
	b=KEARupvJsFdHyDuNkz7e9EUAYT2GGhc81tJCYiNnMMtD+d3NpEFCqJjsCOY3jXMOs4lVpC0ZNgxsAfNJcX86FmeEX0VPjXVQq38GHFi673/frOVTOWsigVMXwY4AyajRZHzse128tw/i47N/FuaN60lUU7GUVxtLfbSzYi/a4/Y=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WlP-v9j_1754892673 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Aug 2025 14:11:14 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atishp@atishpatra.org,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	sunilvl@ventanamicro.com,
	rafael.j.wysocki@intel.com,
	tglx@linutronix.de,
	ajones@ventanamicro.com
Cc: guoren@linux.alibaba.com,
	guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH 3/6] RISC-V: KVM: Add a xarray to record host irq msg
Date: Mon, 11 Aug 2025 14:11:01 +0800
Message-Id: <20250811061104.10326-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231119_892775_14159228 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

In the irq bypass scenario,the host interrupt comes from VFIO, and
it is an enabled MSI/MSI-X interrupt.  Due to the  reconfiguration
of the PCI-e BAR space during the irq bypass process,this host irq
will not be triggered in the host system.

We can use this host irq as a notice MSI in IOMMU MRIF mode.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/aia_imsic.c | 69 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e91164742fd0..58807e68a3dd 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -60,6 +60,9 @@ struct imsic {
 	struct imsic_mrif *swfile;
 	phys_addr_t swfile_pa;
 	raw_spinlock_t swfile_extirq_lock;
+
+	bool mrif_support;
+	struct xarray hostirq_array;	/* Attached host irq array */
 };
 
 #define imsic_vs_csr_read(__c)			\
@@ -740,6 +743,57 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
+static int kvm_arch_update_irqfd_unset(struct kvm *kvm, unsigned int host_irq)
+{
+	struct kvm_vcpu *vcpu;
+	unsigned long tmp;
+
+	kvm_for_each_vcpu(tmp, vcpu, kvm) {
+		struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+		struct msi_msg *curr = xa_load(&imsic->hostirq_array, host_irq);
+
+		if (!curr)
+			continue;
+
+		xa_erase(&imsic->hostirq_array, host_irq);
+		kfree(curr);
+		break;
+	}
+
+	return irq_set_vcpu_affinity(host_irq, NULL);
+}
+
+static struct msi_msg *kvm_arch_update_irqfd_hostirq(struct imsic *imsic,
+						     unsigned int host_irq, int *ret,
+						     struct kvm_kernel_irq_routing_entry *e)
+{
+	struct msi_msg *priv_msg = xa_load(&imsic->hostirq_array, host_irq);
+
+	if (!priv_msg) {
+		priv_msg = kzalloc(sizeof(*priv_msg), GFP_KERNEL);
+		if (!priv_msg) {
+			*ret = -ENOMEM;
+			goto out;
+		}
+
+		struct msi_msg host_msg, *curr;
+
+		get_cached_msi_msg(host_irq, &host_msg);
+		priv_msg[0] = host_msg;
+		curr = xa_cmpxchg(&imsic->hostirq_array, host_irq,
+				NULL, priv_msg, GFP_ATOMIC);
+		if (WARN_ON_ONCE(curr)) {
+			*ret = xa_err(curr) ? : -EBUSY;
+			kfree(priv_msg);
+			goto out;
+		}
+	}
+	*ret = 0;
+
+out:
+	return priv_msg;
+}
+
 int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 				  uint32_t guest_irq, bool set)
 {
@@ -750,7 +804,7 @@ int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 	int idx, ret = -ENXIO;
 
 	if (!set)
-		return irq_set_vcpu_affinity(host_irq, NULL);
+		return kvm_arch_update_irqfd_unset(kvm, host_irq);
 
 	idx = srcu_read_lock(&kvm->irq_srcu);
 	irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
@@ -795,6 +849,11 @@ int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 
 			vcpu_info.msi_addr_pattern = tppn & ~vcpu_info.msi_addr_mask;
 			vcpu_info.gpa = target;
+			vcpu_info.host_irq = host_irq;
+			vcpu_info.host_msg =
+				    kvm_arch_update_irqfd_hostirq(imsic, host_irq, &ret, e);
+			if (ret)
+				goto out;
 
 			read_lock_irqsave(&imsic->vsfile_lock, flags);
 
@@ -848,6 +907,10 @@ static int kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu)
 		if (!irqfd->producer)
 			continue;
 		host_irq = irqfd->producer->irq;
+		vcpu_info.host_irq = host_irq;
+		vcpu_info.host_msg = xa_load(&imsic->hostirq_array, host_irq);
+		if (!vcpu_info.host_msg)
+			continue;
 
 		if (imsic->vsfile_cpu < 0) {
 			vcpu_info.hpa = imsic->swfile_pa;
@@ -855,6 +918,7 @@ static int kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu)
 		} else {
 			vcpu_info.mrif = false;
 		}
+
 		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
 		if (ret) {
 			spin_unlock_irq(&kvm->irqfds.lock);
@@ -1195,6 +1259,9 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	imsic->swfile_pa = page_to_phys(swfile_page);
 	raw_spin_lock_init(&imsic->swfile_extirq_lock);
 
+	xa_init(&imsic->hostirq_array);
+	imsic->mrif_support = false;
+
 	/* Setup IO device */
 	kvm_iodevice_init(&imsic->iodev, &imsic_iodoev_ops);
 	mutex_lock(&kvm->slots_lock);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
