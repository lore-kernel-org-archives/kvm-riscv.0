Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF0EC624D6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzSAR74dqJOLrhyjEWxMFzgJsNplIZiaOcOoJSKX0lY=; b=cVVvxxfRxDZRX5
	kzokfxRmuek/Okfhj3ACwJbJ4R8iSu6aHZ+MwhZPe8hJQLyA3kY/Hm0IEPpvIwCf7wSzwAxazatFl
	WZAcr/+Pm7TvQG6yAX16m/P3PvoBMST0WoJZ8ULYD85fpvTyKbZ6z0gxhpvnycB6Q13udygXQt+DX
	KswPqtz7C+QxXpoY0F02X9Zu3l3WLLps1dpXLFmV/Oz71fu0+iZjbaT4HhsxUJNcMOiNxaq+BLye8
	jK1op14HcFJyM7wC0Ck72ALwxNpOY9s0T7c6KzHVtNDqG/vGgOnyp6MLOqqoE714HDC21xYdUrvvW
	w9xE8Ct+bv7fkT7pC/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jc0-0000000Eauu-39A0;
	Wed, 02 Sep 2026 11:58:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbx-0000000EaqY-0oYA;
	Wed, 02 Sep 2026 11:58:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8A7D1E32;
	Wed,  2 Sep 2026 04:58:32 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61C613F85F;
	Wed,  2 Sep 2026 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350316; bh=bvSJZEYuUzSfTp3lnl+FWsv3APh8RUXfn9Dgh5TGgK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VQDp4hB/Qs/Re5WMKT8eqfXJiFXvWLSISYhYoKX0hMDsRtHpHjqO21RHcFTSnCFI6
	 9b+/JcPwiTaEGulcsFqpFvAx1qS0KIMrLmFTc0tWPd7LPxqmE8dpefCsYzCMnCsR6B
	 zJuttsNkz19sQCyKpC+z6xj4ZDKTo0Dv3LF3T3PE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:18 +0100
Subject: [PATCH RFC v3 16/21] openrisc/pgtable: drop __pmd_offset()
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-16-5d8f5b17c25c@arm.com>
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
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=4wz8+CbWxbmBm+0duGq5oUD3gG+4iNNsSmDgW/+hufM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7pv10L56yITmkv7MZ8IOM5fh/CxySzocw7K
 IjEcsCxfDiJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO6QAKCRBt1cPRWsUx
 M5aWDADYxAtyl+y2LxVBunlEjk46XhMmo1UlcGdl5tNFIppFTuiJhVz3RKSgMUkVVjwS56w3C6T
 coZfHX4bmgmO43d/gJSuWdFh5kXUDgY3QDfBeyzp08Id41DqlxVCwLPqhJgCg9mdV4NVbgU2rZ/
 djZdFPPzSc4qfWSpf4+UrquyNsHCkCs5hq/y21rF4TFaVoWijqkePHGMpxzH+V79M7kExoU/SFB
 FWmz5Ktb5Wb/6bBN51Y9ONW/XgI2o/yHg0AX6Qu6ruJZa8qUy/820NP3j+vAEwIov4Di6GdoEUW
 aQG1oDixs8oGNV1tSkB7ssu4WZWi8YnyYkh1I1atY36mS9tFc+8MQLVUp23sR1G1fI6wFq7Vqo7
 tQV07xnn9hKFxLcHFuE5sIW6ZidPx1NmbpwiInknq1O6vZx2+kWeRvJ3YDLVOwWgriq+mUt0CZ9
 lS/JZhKiBZfe66sAP6+SVS/mcsN8zk74Y9THLHnG8h9J8pKbVkhKBC2T2rVPfu8txo4SY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045837_335730_89CCCB67 
X-CRM114-Status: UNSURE (   9.52  )
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
index 13afcc0bd863..7fceed641610 100644
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
