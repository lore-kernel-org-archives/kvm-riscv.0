Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD2EC4453E
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5T3bjwIik9VtCgBtKfieFvjhCAYCPvEYEaKaTr57V7Y=; b=5C2TWlvodAfbBK
	8X5pQvrjSYbXNvCm+U3qbVG1gOtK0ss4bACC5NRM3J2GarPqVW9vgGnRsGoty5KvmsDkFoIh3BZa1
	mOHxPxgkw6ANOUOTvbPIV+YZi6joNf+PpsEDlyy93sKWlpOsj9wJjz+an3RGm12LkX+3X9ZGdSYCM
	Fve1R+L8P8qP5ybSnavaZ89ezA0bN7RxRZmpCcyN6gyBzZ+5juD6J4zfiX/dCR7Y921Fkj5Hg7JOm
	texsM9Gb9FiT/BSCPL++ENW8nuVDL9fuvYELmmB62v9UvNRelM2l/VUDa2SCgo3d73LbiuB8x8qZO
	J1A4M2suxcGxTHD+pZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvc-0000000CB3t-2bvi;
	Wed, 22 Jul 2026 15:32:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvb-0000000CB2a-20kg;
	Wed, 22 Jul 2026 15:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pSQKp0u4WCyMjI7rDFyHG0HCA2/rWwWJg9VdMF576lU=; b=nOnFlgRVbs76yNmKsoRascIZ/V
	Bo5ljwZ3jWsYjor2Qwc4H72/qwkGbNcvdYIGOpy2N8+t2cqyBNfLMjLss7aAPPWTQKaZta6N6nuvJ
	MGEzBbVi6/ZrH/BO1pwAIZifkgmgQ5eUF79nsPSyS4FQ5wnYh793UBmilwqOfJUKHAyMAIz8PLg11
	y3XMgMrCmfWf4Qh/azaaWjVFp0YQwhoRZRoh7F98cIJHrc0JYGQaY9VNcuiTFXSYytIns0b0ALRvr
	cV8AsWNnfE8316JDvrZ/X86gbkSjE2C/S7sAj6SSCccQr0DCrS7yvCigv1LtZZU61WkDYxLTBDMi9
	B3X1aPSQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmYvY-00000000x17-1fB4;
	Wed, 22 Jul 2026 15:32:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4C4168F;
	Wed, 22 Jul 2026 08:32:02 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749C13F66F;
	Wed, 22 Jul 2026 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734326; bh=wmJtmiPytl3HyZyDqwtjxdRsUOFgZxGgVlONXYHiJqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f6SmQojqGR7brRiEZavDDkmTWbw75QsPyhFd4pAG4O5+6Ju2I8ri3QCdZWN2rXkyN
	 DCTNnGSdIhw7z2ehWnVgZaQ2zE6WyM6dw1A5orUEziWCCg2RkmxAjlcAHyBQDq35NO
	 soM9uXuZ1k30ziofw8vM4Eb1IcYS6m8WnZbnkIfw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:20 +0100
Subject: [PATCH RFC v2 12/20] x86: mm: define pudp_set_access_flags() when
 CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD is enabled only.
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-12-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=wmJtmiPytl3HyZyDqwtjxdRsUOFgZxGgVlONXYHiJqA=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIVfJAQ0bxNGFW5YSiAzNm7IwBxCLOqc80gj
 i7axQ/7jfKJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiFQAKCRBt1cPRWsUx
 M8CyC/9q4ATnNzBRhzDxRuqLX64PSTzrSfdIPjo8WlRytut8ZrhHFMfgcsu1OWhST0JPWq+r22v
 zJ6g8PXhJN5GkfC/aA5WFgbNDhiJO9mfOY4WJaWFSoB5qLe4rVE8KL1nSOeHn4he5thhorlk+FZ
 o1l4TLcbjqnpdwBpnKy9yw8hjMCo1D5TlY7XD6cf4nX6YeSoQzJK3j77HvuaM/zd+70XJcuZkfL
 5Oyds34g83k0HLkkrjLBNu0DPunfEw8czmxodjY9Gvre/8CMOBUGGPSoNrCzTLjf/vjX5PWo3Rc
 oIGj8lh9egTAe+ruiexvMFVgMd62WeL/DvqiV/9KgLIluHYqsG7i7w9KvNOtjtUQ0XjkMtGcuOO
 nZVxKCU95sKFoKLDo5eYIJEZMubYpNqePB4xQQofkIs0yKScpMw20O2n7w64nCyFnn7uV86yb9N
 uOyUjDcvEWXUFQO0OPQ0pIwg21NrgYutufdstDwZ9vqKWkJclvbzJ9HKcNZlfdJcGaxsM=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163208_882457_76C2E14D 
X-CRM114-Status: GOOD (  10.27  )
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

pudp_set_access_flags() is not used when
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD is disabled.

Therefore, define pudp_set_access_flags() only when
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD is enabled.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/pgtable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index f32facdb3035..edad847a2ecd 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -411,6 +411,7 @@ int pmdp_set_access_flags(struct vm_area_struct *vma,
 	return changed;
 }
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 			  pud_t *pudp, pud_t entry, int dirty)
 {
@@ -430,6 +431,7 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 
 	return changed;
 }
+#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 #endif
 
 bool ptep_test_and_clear_young(struct vm_area_struct *vma,

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
