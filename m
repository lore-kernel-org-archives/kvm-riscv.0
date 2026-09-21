Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7305C982F7
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6QTva+VVrT1bf7GOXVVoDOSfx9D+nBlu2Sj9iDcl3k=; b=Pp5RsuKnRW+0Uv
	DeiBycAGCDUbdE2EV6T9+Kk8dGTBHxrMLtqQrJgmbWCxh8OjrpvR+NzUp1iKE1JZmJGyJ/B4A14fT
	R2NlZheXhbt2VOA5mYWVvD92ugZS6s/RZl4MbzqlrJbk8l/Oz4M77g9mtBZqNCrT/rDsHOeX9A7ai
	QqPcn8kbDmsouNFmdKyKfYB5iHHwzRjMcEzJouj0XvX3v4kzUFnaezpfaaY1NFRb/euxQvBYWX49z
	WBhcZjeenVwP970opXzeFb+KH8O31bjxBxq2eKc9h7mIqOE/XHLLQSrvWG4cb8OTFsquRcOr4tAo5
	v/XEgCVETzkHqaKYRMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bjH-00000001n6D-22FT;
	Mon, 21 Sep 2026 10:58:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bjG-00000001n3y-0w43;
	Mon, 21 Sep 2026 10:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=61mOQB/NPnyS6WFT1v6qj3vnbL64UK7nj4+n5n9dFHw=; b=FNfh2yovr/Sko1RIEOfgneE7RS
	pZQEmEsQ9gduj326SWsImf2azeSfDEIxGuQv9EmmbKbVdKfN3hLo3SObWpRNGK68bsSCmNT7jLpcd
	V+wdDmuTGok9ZkoTXYvnxFcLiDRZASzXGKe17rul8elgMlTm3B8CxoKaI5Gvf98NcAzJSHKD3fvhx
	zxoasuFnC+w4bZVY0FfLmWrSjcQ2HfwbwxrFYfgZbYU68vlGf0jlYd4i3dM7xe7ecEUB/BD639NWV
	SprbB1wCrJx1Zptwr0vhCO2XPC58hXFhes8+Zx77pk2MlIDooiEApykHaZXNG8UlMnFQN5PKZqmXa
	4wWN1HwQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8bjD-0000000C9Zv-0FED;
	Mon, 21 Sep 2026 10:58:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D1441CE0;
	Mon, 21 Sep 2026 03:58:26 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD2943F9AB;
	Mon, 21 Sep 2026 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988309; bh=fSF1q0uZ2D6D7eSotmHP8T3BZdnaiPG7UdplRIp/5/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X3s/HhVMmwzSQHhqq9MFWj0m6FUOVQG5sixXBNURROyV6ePF/1f5WSnJzpvwZBNK1
	 QqsYNRvkgifOqK8lofwytBap6NlT+LrwggMFa6+2446aU5pOoBTY1kIi1cGTtqCZTN
	 uHkua1WMDV/dmcg1aD+uOrvLGLVf0dKrwSWDm1Ag=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:55:38 +0100
Subject: [PATCH 16/21] openrisc/pgtable: drop __pmd_offset()
MIME-Version: 1.0
Message-Id: <20260921-dummy_ptxp3-v1-16-cd40cf68242e@arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
In-Reply-To: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
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
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=HHmjFCiPkfuAa6Yg+gCAN1VqpmgkbnXOKSW8+pCvqDs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQ1SPbcNzmztqXWyqwma14L9CzqkX4tJ7x7vo
 vWbJ/HD30CJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarENUgAKCRBt1cPRWsUx
 M4PADAC4wQdqV+mgxWbIBoHOjsRsIdJ4n1uUYYBv3wqYHNgh5+2Lk0XLqzv6zPlZye8658zEGXj
 vgxv0IMjozo9kMQmRzUvCUgqElgfOwU8DUeEQsA3jlvHIGAwe+qRaQ0TO2J/59o6qpcHgJbdXh+
 z/NlcJc72jKMSnH9rNqp4ajPHyXuddYrsjENQBZPndlr23wfYGGcWekO6uC2NH2OLbvRUOOySX9
 FdxnXJVw3frabk+zVNtsYakl4/mWXZrhXG/zWh3Jnvq+4m6Dv0K4EUAtlRwizkYXph78QlNH4I1
 R63HWezZlORLk45PXkp9zwMCQmssS+rzDgQf5tMm3+uvh8QGnqinH/0+s+zCmR4NZSeFg0JYM/9
 Y2NbE8DNZ95kpUtUWkPyYG/9VYQNEejRP8eCknF95Fy7xSmh1ANcZfr515q2JunHbDNQJBtNjpr
 g4qJObrzFSR+5ZGT/ylRR9xgwQuj6B6Ug3pDRerJOBlq011A/stSkRMHiOCGWaN60k+y8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_115831_527476_0B39A464 
X-CRM114-Status: UNSURE (   8.73  )
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

From: "David Hildenbrand (Arm)" <david@kernel.org>

The macro is unused, and will collide with a folded page table helper.
Let's just remove it.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/openrisc/include/asm/pgtable.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 13afcc0bd8631..7fceed641610c 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -331,9 +331,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK));
 }
 
-#define __pmd_offset(address) \
-	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
-
 #define PFN_PTE_SHIFT		PAGE_SHIFT
 #define pte_pfn(x)		((unsigned long)(((x).pte)) >> PAGE_SHIFT)
 #define pfn_pte(pfn, prot)  __pte((((pfn) << PAGE_SHIFT)) | pgprot_val(prot))

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
