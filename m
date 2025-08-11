Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7234CCA0EC0
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 06:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FttCxDcPSY0qfCAtxrOcvU464B5CO0PpKCwsZyUWsSk=; b=yNDxKh+Qfvzs2k
	lgBRQWHyOTG4Y6esLds25jlMOSCfHKKXAImqDZzegDn08pmxsXB6r7YooygWG/wQsySkak1ofWXij
	vVBVwGLfNXcQ56lSY880r7ArUXOvyIcrByZTyYCQIKa7wJPRvTw4BosNUsGVBPTsSs1zQvntorSbO
	GZsKGWK9l/TpvO59I713nM6bMGevb14qs2B1ysapXiJqlAu7R+Lg3veGDf2exLI/1Bje6HTMwvBtk
	1byN1Nb/mo9SpilzAHTpOeLcPDKMW4g80PCEo26FnH4JwCaHPxON3B8Prz4um5rucQy2z+H13++hQ
	wsHOL6YuMFJkqzvvAGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLko-00000006ZTr-0ojN;
	Mon, 11 Aug 2025 06:11:30 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkh-00000006ZKu-3rfm;
	Mon, 11 Aug 2025 06:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754892681; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7J/clauWbQWRFTci+97Z7tJgolFj9hSh37VSydzAoWg=;
	b=U/LSQzY7UwPB1A363vqFcpmONsE5h+elI+qe4to5q0W6NDhkNXvYH9uZ7tHrOG4f7wShxA8cxAE4VQ6r/eywwzb3Nwi6OIxOvkGLazuzVj1MTZz4p/ouI6eTkXkY2YBWSgpZarEJN/UoPkjiM4XRdKM9wk0U/8350afxgXuIc0I=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WlP-vBA_1754892678 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Aug 2025 14:11:19 +0800
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
Subject: [RFC PATCH 6/6] RISC-V: KVM: Check the MRIF in notice MSI irq handler
Date: Mon, 11 Aug 2025 14:11:04 +0800
Message-Id: <20250811061104.10326-7-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231124_262223_46B11095 
X-CRM114-Status: GOOD (  12.60  )
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

In MRIF mode,  the Advanced Interrupt Architecture Specification
defines the operation to store the  incoming MSIs into the  MRIF
and to generate the notice MSI,the software shold check the MRIF
in the notice MSI irq handler.

And without MRIF support,we redirect the guest interrupt back to
the original host interrupt,  the software update and check MRIF
in host irq handler.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/aia_imsic.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 58807e68a3dd..f0d1acde0dd4 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -867,11 +867,16 @@ int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 
 			ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
 			if (ret) {
+				if (ret == -ENODEV) {
+					imsic->mrif_support = false;
+					ret = 0;
+				}
 				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
 				goto out;
 			}
 
-			irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, msg);
+			if (imsic->mrif_support)
+				irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, msg);
 
 			read_unlock_irqrestore(&imsic->vsfile_lock, flags);
 		}
@@ -921,6 +926,10 @@ static int kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu)
 
 		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
 		if (ret) {
+			if (ret == -ENODEV) {
+				imsic->mrif_support = false;
+				ret = 0;
+			}
 			spin_unlock_irq(&kvm->irqfds.lock);
 			return ret;
 		}
@@ -1182,8 +1191,24 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
 	} else {
+		if (imsic->mrif_support) {
+			struct msi_msg *msg;
+			unsigned long idx;
+
+			/* In MRIF mode, the noticed MSI irq handler will call here to
+			 * determine whether the MRIF has been updated.Since the IOMMU
+			 * hardware has updated the MRIF,the software does not need to
+			 * update the MRIF file again.
+			 */
+			xa_for_each(&imsic->hostirq_array, idx, msg) {
+				if (msg->data == iid)
+					goto skip_update_swfile;
+			}
+		}
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
+
+skip_update_swfile:
 		imsic_swfile_extirq_update(vcpu);
 	}
 
@@ -1260,7 +1285,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	raw_spin_lock_init(&imsic->swfile_extirq_lock);
 
 	xa_init(&imsic->hostirq_array);
-	imsic->mrif_support = false;
+	imsic->mrif_support = true;
 
 	/* Setup IO device */
 	kvm_iodevice_init(&imsic->iodev, &imsic_iodoev_ops);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
