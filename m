Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C75CD4F21
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgUOOiOdHIU42qeTmanHVUw4oqE+82WQjpfmb1SoPLs=; b=Mi1HpLNSCecESv
	jal5WOVKTNV+/eydXFHNxKz/XAQg1G1/EOMUy67eDydsrXH4in+sN+9ELkBbUmNvctDntg1FN4t/x
	oZ7O2mx/PncMWmDtXJ+ony3G3v36K3F0nie250hHIADs/kC+O4ndxdnwpRtn3wZm4tZTkLr/N9yEz
	V6IVwTApCBbguuPqM0UYRDEx9jaXN5gZg3uQITPJMmeaBIZKffv6hgXLfrDzNHJe4X1C8EbQbe5dl
	H7WYeFWydrEq2vqCTV0Cnu8ZKf4AwYVUObDJCnjatdLQRT583PD/JSdD2qv9yJfcFIRA5ATEZqlIt
	SKbsjCJK8FSLUQrF0mTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY5-0000000CwL8-3ewe;
	Sun, 17 May 2026 15:37:01 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY3-0000000CwGr-2uGt;
	Sun, 17 May 2026 15:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yv
	8yz9RXAgFGizgcfHyJDXAzm7QLNMoZ9qY4PF80Hvs=; b=ZMfBMTY9h+bhGfNVy8
	LSsyccecgon5/Mc1EVL7Pyr5bDV/K5q2BsgIdXVpw4liSrzx0e1nB/difk+oW1+O
	ARpno5X91vLZz4Zk2VOrWk4fUQ5Rzj8AQ9kD7m9UfVSeO8d8qcfP5kKLYTkM9VGN
	TTbdWwYluw9myipi/e2DMatqc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3ylwO4AlqyKW7Bw--.10227S5;
	Sun, 17 May 2026 23:34:57 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH 3/5] KVM: riscv: Add a G-stage PTE cmpxchg helper
Date: Sun, 17 May 2026 23:34:25 +0800
Message-ID: <20260517153427.94889-4-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517153427.94889-1-tjytimi@163.com>
References: <20260517153427.94889-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wA3ylwO4AlqyKW7Bw--.10227S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1UKF1xJF4xWFWDCF1kuFg_yoW8tr4fpF
	ZrCrn3Cr4rWFn3Xr1ay3yq9rn8Ca1vgr13Jr9Fvr98AF1avrW8Xryvg39Ivry5JFyrJay3
	uay5Kr1UCr4vywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziWE_NUUUUU=
X-Originating-IP: [2408:823d:2011:b54:9f00:c5fa:7b13:491e]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC0AEdlWoJ4CGzBAAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083700_166315_8E3782B8 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Permission-only G-stage PTE updates can run in parallel once they are
moved to the read side of mmu_lock. Plain set_pte() is not enough for
that case because another CPU may update the same PTE first.

x86 handles the same class of SPTE races with cmpxchg-based updates in
its fast page fault and TDP MMU paths. Add a small RISC-V helper for
atomic G-stage PTE updates. The helper reports contention to the caller
and flushes the target range only when the PTE value actually changes.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/include/asm/kvm_gstage.h |  4 ++++
 arch/riscv/kvm/gstage.c             | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 9c908432b..afe80e4bf 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -54,6 +54,10 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 			     struct kvm_mmu_memory_cache *pcache,
 			     const struct kvm_gstage_mapping *map);
 
+bool kvm_riscv_gstage_try_update_pte(struct kvm_gstage *gstage, u32 level,
+				     gpa_t addr, pte_t *ptep,
+				     pte_t old_pte, pte_t new_pte);
+
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 6f934cb4a..d70584b9e 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -123,6 +123,20 @@ static void gstage_tlb_flush(struct kvm_gstage *gstage, u32 level, gpa_t addr)
 					       gstage->vmid);
 }
 
+bool kvm_riscv_gstage_try_update_pte(struct kvm_gstage *gstage, u32 level,
+				     gpa_t addr, pte_t *ptep,
+				     pte_t old_pte, pte_t new_pte)
+{
+	if (cmpxchg(&ptep->pte, pte_val(old_pte), pte_val(new_pte)) !=
+	    pte_val(old_pte))
+		return false;
+
+	if (pte_val(old_pte) != pte_val(new_pte))
+		gstage_tlb_flush(gstage, level, addr);
+
+	return true;
+}
+
 int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 			     struct kvm_mmu_memory_cache *pcache,
 			     const struct kvm_gstage_mapping *map)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
