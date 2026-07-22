Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE33C4453C
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7O/a/BEbtc2SiDwJHPwC5SAeCpfIJWwGYrlq5K/HYk=; b=bqa7IY+uqefhLg
	keBuVQma3mxjCnojveieTfm4rpunQDICjonz6JMifQatB8dYbSwvYbZ215FLDrOhf0+79H/7h98sD
	dTsfxVUipLiYFVuHhiQ+ohpHfn0B35p5jmZJb6r6JkJ8MbsmEX8Y9cQgOL5ceFQjoxLseBBv1/y4N
	MR/mH2gy1HZ5eMps1LvADGGAxP1kqaO2J6EXLsEH2OpAVF5pdcV6ZFYEX008HwmGf5N8s32DcVaWe
	/Lv6QJzFiySUlxN2qW9CLeT9awR/QGvLg7X8qxs3Xy/CHWYJHOhXViTL2iwGR2uXYP1GeOSH118Q4
	ksgPYgnxKBL21YHgOykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvN-0000000CApj-3nxB;
	Wed, 22 Jul 2026 15:31:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvM-0000000CAma-0r7q;
	Wed, 22 Jul 2026 15:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=22aw7Np2cGzGcNH8zMseikuNj2a/GNpyekBmCh7fIZU=; b=oRhl5Aw5xdaMYzuWNBNSkuaTZx
	WZCx5/HUY2+uZH881XfPw6NzulRlJyHsOgEeaJ8d3qQpyPs5s2LL9NGy401l/S7C846TDNbPSNQh9
	PyAmVx+xTsr2LPgN6eloMs+Zp04PDTFngP3mQN7Dde1aMcdrYNl0MmyWwxO8lVPsvplzyV1DfSFpQ
	IiGaAWPOuhvEc45MEtIS+mlujICcgyxf/DRI/mISnHSwBqILWkpwjaSQfVPutJ0LD22bQN2h054Br
	nQdoIjz6wbq6RGqV9r12AC6TgeSyz15aR6E5PW4pGXVRRNVtd2NT/r8Te8J3fgKV13xXb0TqSN8SV
	4riBzXYw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmYvJ-00000000wxq-1NZU;
	Wed, 22 Jul 2026 15:31:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD20C168F;
	Wed, 22 Jul 2026 08:31:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 072B93F66F;
	Wed, 22 Jul 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734311; bh=46CYi8oneBLiNJ3cpNNEyn5Md6GOQd0YanozKiYt8po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jM1S8iz1iTRGQItlX7bp8OqSO+oyVlfDJ/6Wqo+ecZp0Q3yjOq9RZ8usX0UOKAqdB
	 P1f36++X8N0WL6V+n6HXyLwlbTy47ZEMBHANTZ8C2zg8NPIobT6lNhpIt2el4T+mN4
	 SN2z2ausZnra+HPuPGgyYdAGZU1O+gsTpQ7G4F04=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:18 +0100
Subject: [PATCH RFC v2 10/20] riscv: kvm: remove stack copy address of pXd
 in pXd_offset()
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-10-d9e4bad31e0a@arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
In-Reply-To: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2021; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=46CYi8oneBLiNJ3cpNNEyn5Md6GOQd0YanozKiYt8po=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIUt6bDSgi5vKRp2azbTZnUNQ0o4jrxwlulo
 USuBIe0QHeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiFAAKCRBt1cPRWsUx
 MzgLC/sFSR+PPsMxGI/0F4kx4qmYYrHefAszi306MKilHpWfr54K5HusUgi3Hq5dAjcstdBJy/x
 p1yWh1Srqlg6E2HoaitTgTj8dMzpHaPLDNaE6GE9Qnk4xCdQa6i1NQj/ZP44ObsaENtoz2Knk6R
 BOWFfE4FG1OmUrUlP5v96/nsrrgnkgOhkFYccJoF18wq7vSKczb2+tfmJT6EcRaOVAaQarYNUY3
 Bt9oAkJwM11kRKYLdAgHc29lOOYSv1Ou2BJzMZhLhJdnEkkGrCeWUiwoTr0EryFm0TIuwksIzjj
 x5Q2OiKJ0RcsLn4GBIqjHv21HGQrlNj3+qhLW2pGQSJq/Q2+IhIdof/ABN6LeigvATALLiHjnZW
 dr6e5gcgPjESIQqXASzCMKKfV3u3K50pAbwkaSmopLDcVQIIs7nkSXViLg2qoBq4dXZJUzsQNnl
 FnhiLenc7K1rXADF+6WMJqqL2IHJyIUqPFJoMJ9fk09X+WGNlXwmEnc5wq081TwA5jk5o=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163153_697636_A4556BFC 
X-CRM114-Status: GOOD (  11.56  )
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

The behaviour of pXdp_get() will change with generic compile-time folded
page tables. To prepare for that, rework get_hva_mapping_size() to avoid
use of a stack copy of a pXd and pass it as argument to pXd_offset() so that
the folded entries value is ignored.

Replace direct uses of stack-based pXd values with pXd_offset_lockless()
and there should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/riscv/kvm/mmu.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 082f9b261733..6d6042b81d79 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -362,10 +362,10 @@ static int get_hva_mapping_size(struct kvm *kvm,
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
@@ -381,15 +381,18 @@ static int get_hva_mapping_size(struct kvm *kvm,
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
 
@@ -398,7 +401,8 @@ static int get_hva_mapping_size(struct kvm *kvm,
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
