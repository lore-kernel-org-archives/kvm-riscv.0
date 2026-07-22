Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547CC4453E
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OJEoub4GA4nVnkKZusGq/gEUkH1xYKlMb1BSR0C/Nc=; b=sUYgE4h8RJbGZV
	EGjhdja1UktvkruRdepqjm2+Rxist60ndKyF9N5Sif511mRrNqCbPN/RU4RqPAl43H5a3dwXbZkxP
	GKlU20y8eG+i4GvWURi41I9ZmrYAtBpdmaqAynvNzaDqGatLVC8f6sD5xRQlERsKUUhNjMglRwLi+
	1dvaj72mFAT0jKMFJFiJkeOTGpC+bbbXGgb/NlfnsT6yq1wGnRLLQrDd1vMDm/j4Pr8JE1unYfMWm
	oacG+5DYVPQtFuaAzxNdW1mry1l8OUvmWzSmBIAfuUedFhHYtmJi10iMSOND/1tPWmRUJJX+Hl1oq
	xeALmQ5J3q3iWftrg7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvr-0000000CBHh-0pyW;
	Wed, 22 Jul 2026 15:32:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvp-0000000CBFY-1cgT;
	Wed, 22 Jul 2026 15:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=d2MlnBPpnWxUihvIuMzHATtyH0nJ5mW8K8ZdAZOSpnM=; b=hTtXPz/C/7Avj5RaVd+DRsKbk6
	86KO9MJhDwPsjiImwn+O43hzCWkDmWxhc78ClgkuOybL1kMufvD66zOJpdQRICw2btByn/M84ujgo
	TM321Nh71G6VEpt97TroCKN4w4vhnbVtKarVdfs9CgfvpfBPsqSN8tI5Nfke82gW8mo+V9zt4WY/f
	5pAooFxAB1njtE2q9e88WeXB5q98mKBcrNJio3yMmZyWlzR/F95y8SjrzOEkKBiQEOjQ5z24l9kte
	qIcV0vlKwqJgrR5g0oUH8J4ONGsT/TIkwOXrkuRrYNYvByYYK8akL/rQFlKUXCuDNHWFW6mouOgsF
	iMpEkWsA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmYvm-00000000x4v-1pLW;
	Wed, 22 Jul 2026 15:32:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA06A1691;
	Wed, 22 Jul 2026 08:32:16 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E103D3F66F;
	Wed, 22 Jul 2026 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734340; bh=wsOvhQKZEG00wg1jKdkAFaJFjNazItDwe0xYFjnlbxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pVLe2oqLj/GMbp2ufH9X7mDJQq2xQl+JLsb4rdHdEG8P4q6+zwtBTz6kqejK9a4vE
	 42w+M5uZ5nMb5hwWCHtS4s7q+ErSCs2KQQJDkfsn5+wpqdIMcK1OZYCZCB3cZAW4nq
	 AggYvPNSBbaQWNfM1T4fRg3yIp8YqGdn0GMHuuGY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:22 +0100
Subject: [PATCH RFC v2 14/20] x86: mm: skip pud setup when using generic
 compile-time folded pagetable
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=wsOvhQKZEG00wg1jKdkAFaJFjNazItDwe0xYFjnlbxQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIWIdSyNNx0bAaN04aBwgqBSXTMZTpRKvbWw
 OqEgUkq1DqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiFgAKCRBt1cPRWsUx
 M81eC/94aLur5BJub0U5CeumeSspcUbgF2bv6HfdAEYOdi5ZwYiF40PGZxxjAsv/yQlK5UzHDss
 aPkHeJPk8MkK0qc7gd9qgXRevhd2r3SbCV54lAhtxc3a8MyMlApf+nVtp6WMlSqBdjVBghBQYVu
 m4undaF9OwHTn2K6K/oaocwtD+K/DrwVWCi+WofWjdNbz59AZtNKXjUsQqR0sgDROPY7hcFFkTu
 7JAqrngJ/Rkxa+ZTG1nr+VR0zoMGs9k12vLpTWZlxxB6mcDEbvHDicaHyuykmke3jENeOsJTl+3
 HDxSBdyN3Dalc3OL8zAIHav1Idp6Xmu9CL9mfOQg2LeRY3RaajCzKL5rATAEhSKLyGuhW5cJDZR
 69AEYlBnca2Wzl++N47dEOUGO/uXt3c71udqBZTA+I2so2zK3Gu6esbNhxoBe0uOYGsizKiyDEp
 LYPnBnpmu5SBzQ7DL3uDq15sZsUy9WU/F2HnuSrSJnVeaf08gu/ZXr0DZAzMMkUt7bZIA=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163222_829351_B49BC9D8 
X-CRM114-Status: GOOD (  13.85  )
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

We want to rework how set_pXd() behaves for generic compile-time folded
page tables by disallowing its use and triggering a compile-time error
when it is used improperly, ensuring that the actual first-level set_pXd()
function is used instead.

The behaviour of pXd_page() will change with generic compile-time folded
page tables by disallowing its use and triggering a compile-time error
when it's used improperly, ensuring that the actual.

To prepare fot that, skip collapse_pud_page() and populate_pud() according
to CONFIG_PGTABLE_LEVELS.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/pat/set_memory.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 078689aa7206..91b33a265a43 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1346,7 +1346,7 @@ static int collapse_pud_page(pud_t *pud, unsigned long addr,
 	pmd_t *pmd, first;
 	int i;
 
-	if (!direct_gbpages)
+	if (CONFIG_PGTABLE_LEVELS == 2 || !direct_gbpages)
 		return 0;
 
 	addr &= PUD_MASK;
@@ -1730,7 +1730,8 @@ static int populate_pud(struct cpa_data *cpa, unsigned long start, p4d_t *p4d,
 	/*
 	 * Map everything starting from the Gb boundary, possibly with 1G pages
 	 */
-	while (boot_cpu_has(X86_FEATURE_GBPAGES) && end - start >= PUD_SIZE) {
+	while (CONFIG_PGTABLE_LEVELS > 3 && boot_cpu_has(X86_FEATURE_GBPAGES) &&
+	       end - start >= PUD_SIZE) {
 		set_pud(pud, pud_mkhuge(pfn_pud(cpa->pfn,
 				   canon_pgprot(pud_pgprot))));
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
