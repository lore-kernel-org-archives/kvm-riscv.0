Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2802C624D0
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tf/kwCezu5HdxtKFThmHcTG0QZIbaKxhizYcmGlo/Rk=; b=AqkDIE7D/A6X6a
	j2jp4SnXR4uuKF0dhZeA4wYckhOFH55CP+x95oqXawU9Ve2rxG9+CbCyFNWN5+KNreNP7C0EvOD3C
	jcg0XZqAlHHKISgCwxfKVO4D+BAfNJvCe5U9rk/eKlauzeTifZuvZCE1kXba9hq2Dbk6Hv/B5OauL
	EuhOskY/soJ1Hib3M3cNeGh65PNrL/qTPUwsQO1ZxonbaKhZ1D4lDMFpXiSx0Jhc6PFerKZg1EfE/
	xlVQuJcNcxibWu1AWZ/LgfaRd8gYmzdniLbvsgljHOaftf6pCBulBqPudw+9E+1JHZGQQOYPGDg2w
	rjO6l6xziyUVXqfd8JVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbw-0000000Eapx-0H07;
	Wed, 02 Sep 2026 11:58:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbv-0000000Eao7-0xA7;
	Wed, 02 Sep 2026 11:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=davfq0z7MyiduyrJqxBuiTUo7xKHqvO6yeyvaRPCkgI=; b=mbHbrpODC9oLurLhQAgkaYaPiU
	l93VbqEgUQY50Nx/zfE7utyvcz6d7g4XykMv4u5n2TU9ZTH1jt5fwnglrKMHGeYMY/+wTWCwwXouL
	9wiTH184puf+rOG/tO0rKFOVcJswBhxyIwrHzSy6JEsgluW5Q2bDlsDtKeyiGDdfVU5FaZ/id+aTO
	XrOAIcicLluM6G77FL58fa5frSy4ZoAgCGD+GJWuQ194Te56wlZP36XsbvFWcq2vFlmy0WFSNFgrs
	4TYESVrhYigJG5nMNtGBZF7vtDcJqAsghG94WZdoMA3JpOJYfgjzZiziKdxP00ad+AO99R7a4y6LM
	NmGzAnaA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jbr-0000000BvrO-2bOf;
	Wed, 02 Sep 2026 11:58:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5EC1684;
	Wed,  2 Sep 2026 04:58:25 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C64723F85F;
	Wed,  2 Sep 2026 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350309; bh=k2zH0FGZAHQHsE8iyLCaqqIz9EPe8wwBeb+yxtADtNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jYatJEpXusEujngnHtU6I+YPUKEc9K8lGG+lz1k8jk0KjT5om9VcibE/ezX/VNx7b
	 lpj/LXh8tiH840xQlDjIN8NOZFbyzF3GoEjDO3+GBfOYuqP94T7AQrC++hekhMS6tA
	 8FkWEGa9JBOcKLOCiJlkvBaOKggzzYeRDZmNyDQM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:17 +0100
Subject: [PATCH RFC v3 15/21] x86: mm: skip collapse_pud_page() when
 CONFIG_X86_DIRECT_GBPAGES disabled
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-15-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=k2zH0FGZAHQHsE8iyLCaqqIz9EPe8wwBeb+yxtADtNc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7pUQwEjNuqeUAg7BhIVlnxOYow79q+z+b/o
 Mu+s6x0zhqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO6QAKCRBt1cPRWsUx
 Mz9sDACbzWbwygGpa8m3XTPuxJjLPEKbMbsFtZoHAET7S3zJ2LzXLww4d97at64xdcy0C9qcaWn
 tUK+uYwT5SoDrcZGmfsCgkyKnZ3bcOfrvI1CTIx3pn9wi7HlvNnFpoHJWX1wFhyDvNnivGAWwsD
 RVZ6G5XrvM3ngBD9A3GaObxS/hOfNl6B2cAfrLJdXQlFvhTOA7evFUwYxbSFQtREo7W9iPBbbhm
 FPNf9wlD8mSt0yJmy3Qv97MpkoT7C4YN9hgXPoJ2xU+Q0YTYJi5hf71QPpJgYQrr2aCRm06oBrf
 Hjgq3DMzHZEQL3ROMxL2wlUgUj0dpPf6JXmI4z3zSpp0POGmdgTjUGkTKUflejOTbAnUKV3SOyA
 /5BZiBlXnygsBnRlMPKDve452e/HvUePcW2dHO4oVqHDg+1C2R3xXuQyq+w8kGdgQXAlc2papvE
 ACcncgIrI/l73eXzjT29pSeE28A+OoQGnf4+ycoq2SoHHMNmrkkPY3GeJeF6nalFI2ayU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_125832_669497_038F7608 
X-CRM114-Status: GOOD (  13.29  )
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

The behaviour of pXd_page() will change with generic compile-time folded
page tables by disallowing its use and triggering a compile-time error
when it's used improperly, ensuring that the actual pXd_page() is used
instead.

To prepare fot that, skip collapse_pud_page() when
CONFIG_X86_DIRECT_GBPAGES is disabled.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/pat/set_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index a1a061d995b3..07a873775279 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1315,7 +1315,7 @@ static int collapse_pud_page(pud_t *pud, unsigned long addr,
 	pmd_t *pmd, first;
 	int i;
 
-	if (!direct_gbpages)
+	if (!IS_ENABLED(CONFIG_X86_FEATURE_GBPAGES) || !direct_gbpages)
 		return 0;
 
 	addr &= PUD_MASK;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
