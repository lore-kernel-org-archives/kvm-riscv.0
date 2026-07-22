Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB0FC44536
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4fvgGrK7pKCNgSGir6kwzLunanHwffNS+zMVeIevHk=; b=vMsxA78CyYRfuv
	eBVtpWCUiARithnPDf4R2S8x9SWRFsTkcGHdarr9w8eQ61b2XmkA6z24JfbZWfyZgho/+ZiZdYO7V
	TwBJn0ix/sPxrvzpebxB+51NuTErm0XEG0uAxokaP/J3LuBMENB97A1dz+r188iCgYvxnZ9mCfSVf
	r1erOJ9qgWQZ151rZ+b42yCCoHoMEBJtcFVBvGgQTprT3gVH4F4rXnB98FXeXJthHu/izRatvqRQs
	PpX8C/NP/7N2poUW8QSpVSOXc8uqTp0FgB3jd4zJm7H4p765c3aTWYhd/8A7K/xu6c0AXoOadwPWr
	vIpx5GzPJiE6d3yZHz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYv7-0000000CAYZ-1Yf4;
	Wed, 22 Jul 2026 15:31:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYv4-0000000CAWL-358n;
	Wed, 22 Jul 2026 15:31:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55A83168F;
	Wed, 22 Jul 2026 08:31:33 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EEAE3F66F;
	Wed, 22 Jul 2026 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734297; bh=YcD0jzoOahG6x/x7befgYnktlqrNhCa1TVm2jqZpY/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YB+ECKku/PoYq2WT0AjK5FWjpwHm5WhvpyBL9iss6rJkCx9EWxGy5Xj4MUWQUp/nc
	 bB/WO9swVClnAHd0CCdiTAWlLHW6My7AKAaZCl2lFEqQMRkMNS2H2HjRUcp/qutLrl
	 XMv+zI5+luxlx6Hkz3AiZYLUrcxHFci+B5d421/c=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:16 +0100
Subject: [PATCH RFC v2 08/20] mm: vmscan: remove stack copy address of pud
 pass in wallk_pud_range()
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-8-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=931; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=YcD0jzoOahG6x/x7befgYnktlqrNhCa1TVm2jqZpY/w=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOITGIRilBrCRHcB2LdtqoEOmFgxIF6Hd+Vnk
 IFCao2dq7WJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiEwAKCRBt1cPRWsUx
 M9rNDACPX1gvLIbSeFSgpsXYw5fiwtsaAo8fF9fow2EFQfuqsIXmDvvDuGvc+tGU4BaWuGH0mzM
 eklxLiUek0JNBF0GJ2x3A4Kq/ui/Kd9sAqMqxOPWurPgfQayM/59RN2xzFcJzTZhoDSZjVcP8Ru
 FK3kg4Bd/FVwqL91rO7uKn8nVD/occoSK5fX2tc1M7dm/Z484Oq0dzF8MCB+CDCrvRkASH5o8fR
 7OBG17OYADT6CJpJ30NG3tnWw/z18SHM2Ho6dtWlczbf93oHjLBn9TtaJJ6TvsI6HevcytP/R4s
 mPt0zU94Gtx1B3c6i5b/GMxplXDdm1GNMjqlqgeIzBVATylzMaefHkFdkR/Ep2mCZJRH0hgBYvX
 M/U0vigKgKdlCN76Y4jnDC3QQ+LXNhIy8HWUDZKioYXWffW32R7/0W3xLPN4De5MFGGNUwfftWV
 WcWIiT/h7TzBoZGus/gSVNMHtcSBu9NwtPvLEQDo4Q8vWWR7vsw4ZNL4ki05RrlcOBNyM=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083138_874302_80599E2C 
X-CRM114-Status: GOOD (  11.58  )
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
page tables. To prepare for that, replace passing the address of a stack
copy of a pXd to walk_pmd_range() with passing the pud pointer directly,
allowing folded entries to be ignored.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 06e103f9781e..0c9c4ac89e09 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3727,7 +3727,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
 		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
 			continue;
 
-		walk_pmd_range(&val, addr, next, args);
+		walk_pmd_range(pud + i, addr, next, args);
 
 		if (need_resched() || walk->batched >= MAX_LRU_BATCH) {
 			end = (addr | ~PUD_MASK) + 1;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
