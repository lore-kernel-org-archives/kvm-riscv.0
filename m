Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2C1C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpdsLeoiD6TOP6NFLp2IBM3wTMGI/Z2HneDYepQm0PY=; b=SEZ8Lc47gWQxCi
	wsE0JDXGVmbNYPTfbC22EwqQMegClbT0puz/iQ0Pyoav5mq3ZEbhfmc6njenI1FbjtzfULswVOH7V
	It+LYsnwAQRfZJmqtQgazAgxGdTCvY1uZYRwHHtKNAj4YSDqGDiBwPb1iFIBwyom3046hSBHfAjZy
	MG5OVClxENsmPSy7gXHevThTuEjJI9xG3qWqByZIAEcX4Y1vRk0JfrONXm+0VKTepqI/OuRP6tp/m
	UV16fHtX985NMxolu8ZY7YImDQF03qoyRwvK9EwhskwT7JMgOqdO4nzC88ET5Kuo4fwRYffNslaOL
	xRltzJ5NLSb1vGWIez4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbM-0000000EaES-0EDK;
	Wed, 02 Sep 2026 11:58:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbK-0000000EaBc-0kRB;
	Wed, 02 Sep 2026 11:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T4ZC5NFVeQY99+PVp2UJl7URx3a4Ea9PI7M+v45bZsw=; b=dEzLObDOppNAUqBQDt2gkt1HzL
	v4J0SyYGjUFQAibo2Mre6lxn/4iIwLwOMy2tRHNHeQ184lUi0DfdAX0UDYxuu7usfQewnKjY4dtWx
	i5/lSTUaSfTQl9lsHnr3xqK8iQtSdGG5BKaa2N8Tuehj/tXJJQyp7c1zlq6UIJgo+gPYhY6gj5ZXP
	Ympsr++yC6mFc44GhZpjOUWyHoBf/33pA486QBlCg0FQTN0t4ObAhiqP/dH5qxf9uEoiNYucPUm5w
	ZwgJQ1RxxQT+IK3/mzjDWbkSiOy+QOzGFAcWaJKYIud0fF3ai6ueET8a1YwNCTIC4gRNNAEPv6Str
	2n7xEhFA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jbE-0000000Bvfd-3kLo;
	Wed, 02 Sep 2026 11:57:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 569A31E32;
	Wed,  2 Sep 2026 04:57:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D20183F85F;
	Wed,  2 Sep 2026 04:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350271; bh=u1Z77HcuVhsn6YhXUmkFsPEbxxF45OV6fwB+pGKvXaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KwVckYUFD0lh0ySdrjYJ96Swie3hj5sqm3vMY81r3S03FnG0fxHPzd0qowq8aZG5g
	 IKesnnrhaDKSBya7uksmJfX5kn32Lpqri7nZkx6IJdyAEy0gh9YyZGvb8St62p+VF+
	 jHU2x45mp/UblfZisQApAggIrhQmd+H9mASJWRUg=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:12 +0100
Subject: [PATCH RFC v3 10/21] riscv: kvm: remove stack copy address of pXd
 in pXd_offset()
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-10-5d8f5b17c25c@arm.com>
References: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
In-Reply-To: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2078; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=u1Z77HcuVhsn6YhXUmkFsPEbxxF45OV6fwB+pGKvXaw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7mT8hWwbLEAfZ37PxMdkX2SXibeCCh04uq4
 LVfmdutif2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO5gAKCRBt1cPRWsUx
 M+PqC/40X13zsXs8BTi8kV5papAGh8OSIhs97QZRguA2644nXsxQL0KWVabFVdCiD01eIXjwiwK
 xc28n/yQ0VytaKVRoLdH2uaCikWav9oZ9XDLjMzQLSF1EWLel4YSmV+pQdtzVzQsSoi9YTysn3x
 JkUT86wqAghgrmHxTDoQ6TjpqsBNziVpG+FIHDJt0oyS1A5b6+50SiwZpCxoJktIFfQqctIE67X
 pOpT704P02sdCZmz5tnhqEEANwjL1IDJy5g7ax557FSOnEeb1fqbAiC5aA32WSWn00wvg29OODg
 QEENRDtdwmzRDVlc6E6KtCngcNjmmnYj3BBEb6ma3mwUfahX0QMDHlGAEFkBKP7JbWcXpjz6UMh
 O7HhjVbbW6duC29hFpC0g4D0iBai5cCFlp4WKlyC5tzjeOm6WUg2qQJObDgIEGd6t/v+1NGFPg+
 7gtTrSnpWjJSAYpwvyDrtlfK3hO9M/URw/sMGNUnH2v1a6efUQCi9kCBVlEsxT7nPtlCo=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_125753_243420_F83436C9 
X-CRM114-Status: GOOD (  12.11  )
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

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/riscv/kvm/mmu.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6035b5ec9503..dd5a7b0bd084 100644
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
