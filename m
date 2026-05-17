Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAABCCD4F47
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWGsCdbG7Olu0BGXAQgPs3mFXAN7z/+a7ntQU7JtjeY=; b=bf0EmRX0EKuGQC
	BWfG1sgIzF65dKj6uy1XItfUeUosVAoD2aMkGY1p2YsFe1rRCclGO9qNFhQVV2fGto0BbEJz1fbhp
	glJUIWsYAEEEpmXWzASEsI6WTPFpGxQ5lh6Mug7IJ3a9bfCDCExA9UC+G1k5HFgHBmUKiX1gmr6lQ
	63xFzMyuwcXb66CB8AOAqSrCFdY3XzCyBzXIYVXrcZOpwjkwaJGFkrc+44PgRQIOHJtFJ65PWz7Mi
	TAUZHJcnNT3h70Wyn3FDh/xNzn/siHhc1kekz5BukQd3+QRNDt+uGrtf+LATd6nMXLhsL9uUsAD4d
	sF86EbmApgmV5V7U1EFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY3-0000000CwJ5-2fKU;
	Sun, 17 May 2026 15:36:59 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY1-0000000CwGa-0Pfa;
	Sun, 17 May 2026 15:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=GS
	RXubJm/GTIB2NyfMCMfFiE+Wj4O/jjRpn2yvJTgg8=; b=cNdf7/9a8wM9X4TBcT
	4zZ2UCoK6d6HCiyJkAvZJ0DCDafJP/gmCKaF7iNnfv6YC308750AVGkVWWHzmoAe
	BWXn9vVnJ9grWVdY4hNGeIj99IcobInW/xhsxmOKfJ8bP7+PzlqhaFqwVf+4lzD8
	IbpvNOsRSiDZixyxGRCZuo/C4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3ylwO4AlqyKW7Bw--.10227S6;
	Sun, 17 May 2026 23:34:59 +0800 (CST)
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
Subject: [PATCH 4/5] KVM: riscv: Update G-stage PTE permissions atomically
Date: Sun, 17 May 2026 23:34:26 +0800
Message-ID: <20260517153427.94889-5-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517153427.94889-1-tjytimi@163.com>
References: <20260517153427.94889-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wA3ylwO4AlqyKW7Bw--.10227S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xJrykWF45Zr1kKF1DGFg_yoW8Ww43pF
	WDCry3ur4rKwnxCF4Sqw1vyrs8uFs7Kw4rJr9Fv34DAF15trW8Xrn093yYyr98AF97Xa4Y
	vrW0gF1UGr48twUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pifcTLUUUUU=
X-Originating-IP: [2408:823d:2011:b54:9f00:c5fa:7b13:491e]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC8QMdlWoJ4CM3MgAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083657_611835_9F5C3218 
X-CRM114-Status: UNSURE (   9.22  )
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

When a fault hits an existing G-stage leaf with the same PFN, KVM only
needs to update the PTE permissions. This path will be used by read-side
fault handling, so it must not overwrite a concurrent PTE update.

Use the cmpxchg helper when relaxing permissions on an existing leaf,
following the same concurrency model used by x86 for atomic SPTE
permission updates. Retry if another CPU changed the PTE first, and use
cpu_relax() while spinning.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/kvm/gstage.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index d70584b9e..9595169da 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -182,17 +182,22 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 static void kvm_riscv_gstage_update_pte_prot(struct kvm_gstage *gstage, u32 level,
 					     gpa_t addr, pte_t *ptep, pgprot_t prot)
 {
-	pte_t new_pte;
+	pte_t old_pte, new_pte;
 
-	if (pgprot_val(pte_pgprot(ptep_get(ptep))) == pgprot_val(prot))
-		return;
+	for (;;) {
+		old_pte = ptep_get(ptep);
+		if (pgprot_val(pte_pgprot(old_pte)) == pgprot_val(prot))
+			return;
 
-	new_pte = pfn_pte(pte_pfn(ptep_get(ptep)), prot);
-	new_pte = pte_mkdirty(new_pte);
+		new_pte = pfn_pte(pte_pfn(old_pte), prot);
+		new_pte = pte_mkdirty(new_pte);
 
-	set_pte(ptep, new_pte);
+		if (kvm_riscv_gstage_try_update_pte(gstage, level, addr, ptep,
+						    old_pte, new_pte))
+			return;
 
-	gstage_tlb_flush(gstage, level, addr);
+		cpu_relax();
+	}
 }
 
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
