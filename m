Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF360A381D
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s6k8sRy3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ctcgk8m6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=icU02B36GLnMQEi5McmujeGwTTTtTmUFIfwN+SvDI44=; b=s6k8sRy3z152uLYnI7qWioDVNf
	LorWYyB8vtIOmIl5IhkbiggHmLUdEpE9MCDG+VXt3P/mlqsx5C0zakNDc6FVxpXUsUi2TBuO97DYP
	WCi4oGeVCsj3UDW4b9BZU0lUYjrNqL1hhIpM7UsBsnB7TF2hSLn9zcGiPh7BBLrCF0X5l9qMtk8H7
	TuiQg0ShwwiUjLPVgHc2Z0qgBZX0Lbp7QTLMkLU6f5BJeuZDgEUYrXQzEfBXJJMkmDlFoWsKFdvSG
	BWlwRPh+NgjkNFsBBWQbEHrq7Qey2BZaEnvoEX8Gkw8pr7RV/hE4xfahb/WXhf2pf5USu+QkszNsx
	F4pbTzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq7f-0000000GJ93-0TNX;
	Mon, 02 Nov 2026 11:22:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq7c-0000000GJ5W-189z;
	Mon, 02 Nov 2026 11:22:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D25A1691;
	Mon,  2 Nov 2026 03:22:36 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6474F3F632;
	Mon,  2 Nov 2026 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618559; bh=bDxr5gvFE+Bb+w20GZGn+s22BxRoQqetE+tU52d6PfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ctcgk8m6cdw5AgQ2Im/7eFAWIBTpDgXbtAAO8GJUIWWh/YkZBAZaw9T1WzoMpEVS2
	 9posqID6bDX94oqX9vEed1OT6H8QPauiWj5F4typRunUthD06NqbA4adWOmWErHOFp
	 ZJmVrpwHNi9xgaTlU68f4MNjQeHKzt2spQZCrMtg=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:23 +0000
Subject: [PATCH RESEND v2 10/21] riscv: kvm: remove stack copy address of
 pXd in pXd_offset()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-10-78840b2ec73c@arm.com>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
In-Reply-To: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=bDxr5gvFE+Bb+w20GZGn+s22BxRoQqetE+tU52d6PfY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HIznkcwZYOsTE4W01GcU4mYfE39Lhkjeb/kl
 qYNmf69jTeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyMwAKCRBt1cPRWsUx
 M1nPDACyTxKW0QIf1aki2ILBtcSj+P8SuxY2HQa9GTNUVsd/UcGoLZY6uA/dg7A/Yvuw0TCGbPd
 kcIgBiMNtSZrHn52D6+1EE8BRFSLynEcFOZhgBpTFFw/vtZ6INCLbtKOpOsjDg4DyfpI12y0ZfB
 6LW3z7kJtoWiIOxcg7yDeqiif4xh2+ukAxnSqDWrIA8XkmLrl0meoz8b/5o0DmW6BjtbNX138z1
 KgMPTeBvji7YOP9l4nxY0uRo11y9BlRHu9pYQE8CO0ghDHcBDVdF9JDf7OaNAFcMMlfAco1VUec
 5xAY2JevPpbxhhIvzqN/7k9SEa7bJIpRNqP/uwAp4sA0o4LQYqs94OeBxp7lPb5y1agzCGGwynH
 F3F0i1TidoUuvK9RtQr4nVouqnI2kCZ7OD+1YaNGfAelozaDSsnKalZS3jbFtWUTTPcpx6ZrZ74
 yDINCJGTkAAOUpALpC2WLfbfFmJVgwf9O+hkJStfemMtmTCYRBWPE/h7YvjwkvOWcAHD8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032240_953637_46F206E6 
X-CRM114-Status: GOOD (  11.65  )
X-Spam-Score: -4.4 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The behaviour of pXdp_get() will change with generic compile-time folded
page tables. To prepare for that, rework get_hva_mapping_size() to avoid
use of a stack copy of a pXd and pass it as argument to pXd_offset() so that
the folded entries value is ignored.

Replace direct uses of stack-based pXd values with pXd_offset_lockless()
and there should be no functional change.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/riscv/kvm/mmu.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 371fccaf9df08..a062e8508d3f9 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -450,10 +450,10 @@ static int get_hva_mapping_size(struct kvm *kvm,
 {
 	int size = PAGE_SIZE;
 	unsigned long flags;
-	pgd_t pgd;
-	p4d_t p4d;
-	pud_t pud;
-	pmd_t pmd;
+	pgd_t *pgdp, pgd;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
 
 	/*
 	 * Disable IRQs to prevent concurrent tear down of host page tables,
@@ -469,15 +469,18 @@ static int get_hva_mapping_size(struct kvm *kvm,
 	 * value) and then p*d_offset() walks into the target huge page instead
 	 * of the old page table (sees the new value).
 	 */
-	pgd = pgdp_get(pgd_offset(kvm->mm, hva));
+	pgdp = pgd_offset(kvm->mm, hva);
+	pgd = pgdp_get(pgdp);
 	if (pgd_none(pgd))
 		goto out;
 
-	p4d = p4dp_get(p4d_offset(&pgd, hva));
+	p4dp = p4d_offset_lockless(pgdp, pgd, hva);
+	p4d = p4dp_get(p4dp);
 	if (p4d_none(p4d) || !p4d_present(p4d))
 		goto out;
 
-	pud = pudp_get(pud_offset(&p4d, hva));
+	pudp = pud_offset_lockless(p4dp, p4d, hva);
+	pud = pudp_get(pudp);
 	if (pud_none(pud) || !pud_present(pud))
 		goto out;
 
@@ -486,7 +489,8 @@ static int get_hva_mapping_size(struct kvm *kvm,
 		goto out;
 	}
 
-	pmd = pmdp_get(pmd_offset(&pud, hva));
+	pmdp = pmd_offset_lockless(pudp, pud, hva);
+	pmd = pmdp_get(pmdp);
 	if (pmd_none(pmd) || !pmd_present(pmd))
 		goto out;
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
