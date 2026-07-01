Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FA9C43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0t7rptyd0TBJTbHPbdY21NPJ4EopZpm+DMSsNfrgQI=; b=oNAqWRIoXulDAw
	MMA704XWIhzqKY44KUP97xkLazQfC7+T3GIXmZTPSJr4sixfijhnmsp4Os9mGoXYPSa36FEozyQde
	AQ1lpM8qtiF9of7MP81P8iPTUyvOpnExTRx1U4I2rKIDIPnoAn7DcGahwWDGC2sjXJp4yCGBBQ/b7
	W38BqP27FaiRA/qmjniDeqcgr9GsXCa1SB5qN2t9UOkegL2rr939bUkiNX0ToWx7Hph+TL/O0+bwr
	m5NagemrxH8giWcCB0ScPlOrZk9Y65h2bZXgvTmjUJo5bM/0J3hWwzj5F9KZMAqzXTUAm4VlsdKF6
	iOAjlNVxNtrnW2ppuHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem8S-00000000bsH-39nm;
	Wed, 01 Jul 2026 04:01:16 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem8O-00000000bq2-3F4r
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:01:15 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-30edbb0dc5fso573735eec.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 21:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782878472; x=1783483272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWN7NBari0i1/8aoHDWNlUmTk2Z27L997IJ1yNwTiBc=;
        b=lBhdz5qH1gRddyp0js/A4UCN57NL9JTkT40H8YualG3VR9OpkprNHx/+L28GtTgPjJ
         h2BjTegRovBQcqqKAgwebykNN8j4TeYtUkCe3yCKtWFxmxAEtcTaolKu4ED+W3heXua0
         RkeIlrEZaqZrHiliwtzfi0bDk3udlry3QnFCeWdYAhNyTmPjlrgdDWadUe8bQMaUXSmT
         dBIo4axRoF3Tjw2zt8HmgDxdX2jM9B4tRV7vWICr/wt/36Kkf9CWXb8aoq/XdZ5Gv0CT
         XpT7xeBz1FHIUVWRy6eEIhcnEF69lAwA2wAEhTnZTeJDEwwbvEFRg5Rlqzl0RWoWsSCA
         NG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878472; x=1783483272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWN7NBari0i1/8aoHDWNlUmTk2Z27L997IJ1yNwTiBc=;
        b=ZFgmjoHV+2Xc2PQoUrFHNAEF7/i28wgMckwHKN8Yh1ENW2JaTIg6wasrbnrJ0WrWVw
         r8NOS2l1Liye54w1WBTVxVSo2QCCCsc/2ISYZU9noRmJoqTnSdFxQqpegeIozmt2wL/H
         fURXZCCoVHhUH+QPlRKYDREbirNZ8wYbF93Qompt1y4Jy8zI+5a/EwDY5UnqYuzPv7Pr
         HNWSbHE4nmigt4jp8MVHsxK9D8jTIJRA85rW4ezLIU/nBIMXdtnSB8h8WwB1dTdP9xFm
         xxI0cXegxdxLOEqUdDZiZlc/5fo67ypO49VLi2Qm2BJUkVLHR6WST98kqu7euKRo4FTU
         WCZw==
X-Forwarded-Encrypted: i=1; AHgh+RqPMvzvHxObZ4lyPlt0Em3aBd+1l/CxIaAxgWxgzawW/XDjlW/9flAGcCpSj7QcGlYdL7jROg7nyIg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzul9QN8W9rZn0MQ+EiSi+skW51OInQS9Z/GJXCliRBUQogxv3j
	kmDEngG6D9HFuCWXVmOUWjAXgDjoHkGNQ9ffdcrMad0qsMGyMH2K+FKRm9e1QvZEURY=
X-Gm-Gg: AfdE7ckqYklHB19+2fA8Z5fKd8IgAzEml4G+uOR/VpYCzJ7dkVK4vH9/1sxd+aYitmW
	ivwzd+qzGvK6CIMAmwzIMqtTJ81rRP9aNO2engE9v4zicj9scvsbLdw3m1FvZeY2vs2/t3qQr7Q
	pRKEWl7kgLB8Ia0KytnmiluyBYuGu576aU9te3dE0hm5bAzPe68Qo3++wkqlr5fqsh0VpcM0lqV
	Lm8E4iT7FNy1b52gLi/f4nI1Vn0i9+dfUOSDEkcOoPPP/lXA8Hqhshxmd1YqnaR6A7BtFIHdbxz
	8WRUCLJc6kQmf1IgytFzjZvwspG8MK+xxMvBNRkWot6HoXpLygPL3kQ/x6PpVcbozOryRpeCW48
	2AyO9K+LjUFTAixActkOaDIiOotSCGVv3g2+52pm9+mHgi3lW/Qpyxk7AyUnLU8RgKetCUiyW0A
	YMLnDap3V8G7yFxK+yP6X9xU5ahzrYG7UVGz5FCwK/+2pX8aOCJ4+az6YRoygzj1csF4x/eGvMH
	GI=
X-Received: by 2002:a05:7301:2a04:b0:30c:52c5:6e3f with SMTP id 5a478bee46e88-30eff0b4e80mr8435eec.18.1782878471619;
        Tue, 30 Jun 2026 21:01:11 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm14024287eec.27.2026.06.30.21.01.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 21:01:11 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [RFC PATCH 2/3] KVM: Move irqfd arch data into route snapshots
Date: Wed,  1 Jul 2026 12:00:15 +0800
Message-ID: <20260701040017.42707-3-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
 <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_210112_824954_4F526D39 
X-CRM114-Status: GOOD (  16.49  )
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

irqfd wakeup takes a seqcount-protected copy of irqfd->irq_entry before
injecting an interrupt.  Architectures that need to classify an injection
by its irqfd producer need any derived arch state to be part of that same
snapshot.

The irqfd object had per-irqfd arch side state, but that state describes
the current producer, not the specific route snapshot used for an
in-flight injection.  Keeping the metadata there can race with route
updates and teardown: the inatomic injection path may observe a new route
with old arch metadata, or old arch metadata after the route has already
been invalidated.

Add optional arch-owned irqfd metadata to struct
kvm_kernel_irq_routing_entry and initialize it whenever KVM refreshes or
clears an irqfd route.  Remove the old per-irqfd arch side-state fields
so the route snapshot is the only place carrying this producer
provenance.  Userspace MSI injection uses a zero-initialized temporary
route, so it is never reported as irqfd-originated.

This provides the sequencing needed by RISC-V AIA to distinguish MRIF
notice MSI delivery from normal MSI injection without consulting mutable
irqfd state outside irq_entry_sc.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 include/linux/kvm_host.h  | 7 +++++++
 include/linux/kvm_irqfd.h | 4 ----
 virt/kvm/eventfd.c        | 5 +++++
 virt/kvm/irqchip.c        | 4 +++-
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5bd76cf394fa..254f8fd132cc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -685,6 +685,13 @@ struct kvm_kernel_irq_routing_entry {
 		struct kvm_hv_sint hv_sint;
 		struct kvm_xen_evtchn xen_evtchn;
 	};
+	/*
+	 * Optional arch-owned irqfd metadata.  It is updated under
+	 * irq_entry_sc together with the route so irqfd_wakeup() observes a
+	 * single consistent snapshot.
+	 */
+	struct kvm_vcpu *irqfd_arch_vcpu;
+	void *irqfd_arch_data;
 	struct hlist_node link;
 };
 
diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index ef8c134ded8a..44fd2a20b09e 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -58,10 +58,6 @@ struct kvm_kernel_irqfd {
 	struct work_struct shutdown;
 	struct irq_bypass_consumer consumer;
 	struct irq_bypass_producer *producer;
-
-	struct kvm_vcpu *irq_bypass_vcpu;
-	struct list_head vcpu_list;
-	void *irq_bypass_data;
 };
 
 #endif /* __LINUX_KVM_IRQFD_H */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index a7794ffdb976..399ef2bdce5d 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -273,6 +273,9 @@ static void irqfd_update(struct kvm *kvm, struct kvm_kernel_irqfd *irqfd)
 	else
 		irqfd->irq_entry.type = 0;
 
+	irqfd->irq_entry.irqfd_arch_vcpu = NULL;
+	irqfd->irq_entry.irqfd_arch_data = NULL;
+
 	write_seqcount_end(&irqfd->irq_entry_sc);
 }
 
@@ -594,6 +597,8 @@ kvm_irqfd_deassign(struct kvm *kvm, struct kvm_irqfd *args)
 			 */
 			write_seqcount_begin(&irqfd->irq_entry_sc);
 			irqfd->irq_entry.type = 0;
+			irqfd->irq_entry.irqfd_arch_vcpu = NULL;
+			irqfd->irq_entry.irqfd_arch_data = NULL;
 			write_seqcount_end(&irqfd->irq_entry_sc);
 			irqfd_deactivate(irqfd);
 		}
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 6ccabfd32287..b163f7ed3c1e 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -47,7 +47,7 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
 
 int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
 {
-	struct kvm_kernel_irq_routing_entry route;
+	struct kvm_kernel_irq_routing_entry route = {};
 
 	if (!kvm_arch_irqchip_in_kernel(kvm) || (msi->flags & ~KVM_MSI_VALID_DEVID))
 		return -EINVAL;
@@ -145,6 +145,8 @@ static int setup_routing_entry(struct kvm *kvm,
 
 	e->gsi = gsi;
 	e->type = ue->type;
+	e->irqfd_arch_vcpu = NULL;
+	e->irqfd_arch_data = NULL;
 	r = kvm_set_routing_entry(kvm, e, ue);
 	if (r)
 		return r;
-- 
2.50.1 (Apple Git-155)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
