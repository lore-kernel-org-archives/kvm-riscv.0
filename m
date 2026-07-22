Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C586C44536
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/1mjArzhTvjOSe99uOnJSHEdLDcMviqmghkkqhGRZY=; b=OBWQVjGWZZwi6u
	avBy34t2nsCm6a+PGqbt5jYsESNS5jpU/UFYwR1BnOhpiKMpWz7s6BtA4hKpyNRn5HbgdmkyZXflG
	GVob8JlYaCjfWpVn+MUw9xBtaNaLOfNiP0kC2tB742lN6N7vQH35JX8kWiU8aqKaB/CDtTAsu3MpC
	OatrHEY+4kCdZhsmcRdozB5bW1m0QddhLRFTnSjIY0FVK6k9qFIOBd+122HLbOxpu8wVYkRM0VUf8
	95Nzkdo9GyVY4f0HTW/1CrxSwsnsMKaWujNOSYSRGXGCEWdyW8ZCxmkhDsnACmSYXd5VSIiL3+GS9
	LF58nCepiQZQZmGyyXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuz-0000000CARn-3pbE;
	Wed, 22 Jul 2026 15:31:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYux-0000000CAPU-1KDz;
	Wed, 22 Jul 2026 15:31:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AF1D168F;
	Wed, 22 Jul 2026 08:31:26 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72B903F66F;
	Wed, 22 Jul 2026 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734290; bh=EDS9AlMeDxpN0DuuA4Bhb7IK1Ve/HomsYNUzHrnpR4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eo9nYy+06fIf8UQQOHpRhtRbtJUHdIHU5M4nAex7G3P7astgDStgdt2hMeQyYAqSe
	 yo8B2FWjYpXyyHByHNmKAvHBdA0m4zv6FwrlLGp/vPnM/Thugqw0A32y7kI2is2ohe
	 HBjlOUMx1+Pk6p1UZMYZKJxrrKYZ3iaYd/Q0V6kQ=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:15 +0100
Subject: [PATCH RFC v2 07/20] mm/pgtable: define
 (pgd|p4d|pud)_offset_lockless() for folded page tables
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-7-d9e4bad31e0a@arm.com>
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
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=cKWNMRXsJxpGGQUCO3dJXUBeTYEap08Ll2GdMvnbC84=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOISgRJKMSvsCYR1STuAZc/EAmMgILlkU4XaH
 4rLJvbb3vSJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiEgAKCRBt1cPRWsUx
 MzugC/42IcDVD5LxkniPNsBlkfghPK1wDyrSWxWr7TeFTU6ejjtMKTztgT4RF+0h3SxczGZ3zfL
 m8DyL1Z/YOze8tkRyHQ+9aaZuP1UcIWo0J068oU8zBIGy/e1xo0qcFy+HNb5ifhKaSp/vqXVq7I
 /CORT3klFa/PhxiK1FiYRxln768srrbd+G4S7s/j5I0VRIJHf7rkLAoGqbP2sLn+dZ0b1UlggYJ
 1wr6TMPzn4sfrdgq6Hj8WYTYdddMWcODgOQkHiW0s0qaJW6UZo5f6Jqfonw5Wmhlqb7wj0c3MBq
 kjZxDGOUKw4fVaREwFlSqCNq/Rx7z7Kd4iwRp4lIuNcc0KPeY7Gpo3D67A+mXQmj2oItT5Oe4h5
 mJKipfT4xSDeBAnIDui/JSryAXoNEcWeMA/xfJfC1YGH7hZDa5rWPdbWplDOCWyd/9urEXKuKNo
 jIZ/6eL7alizPWnvSAgA0uJjIti7vbu5VdGE9+KfBk/IAandrmJNpv3QYgD22NJ68bnqY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083131_465764_9EDD31FC 
X-CRM114-Status: GOOD (  10.14  )
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

The default helpers fallback to pud_offset(), passing a pointer to the
stack value.

Let's provide variants that do exactly what (pgd|p4d|pud)_offset() do,
but ignore the passed pgd_t/p4d_t/pud_t, consequently not working on a
pointer to the stack value like the default handlers would.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/asm-generic/pgtable-nop4d.h | 7 +++++++
 include/asm-generic/pgtable-nopmd.h | 7 +++++++
 include/asm-generic/pgtable-nopud.h | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index c6a5a43899b5..019c3f074b77 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -39,6 +39,13 @@ static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
 	return (p4d_t *)pgd;
 }
 
+static inline p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd,
+		unsigned long address)
+{
+	return (p4d_t *)pgdp;
+}
+#define p4d_offset_lockless p4d_offset_lockless
+
 #define p4d_val(x)				(pgd_val((x).pgd))
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index dbd38b4c3a05..ae2eff44889a 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -50,6 +50,13 @@ static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
 }
 #define pmd_offset pmd_offset
 
+static inline pmd_t *pmd_offset_lockless(pud_t *pudp, pud_t pud,
+		unsigned long address)
+{
+	return (pmd_t *)pudp;
+}
+#define pmd_offset_lockless pmd_offset_lockless
+
 #define pmd_val(x)				(pud_val((x).pud))
 #define __pmd(x)				((pmd_t) { __pud(x) } )
 
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 6c9bca78047c..5a2b0a81ae19 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -47,6 +47,13 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 }
 #define pud_offset pud_offset
 
+static inline pud_t *pud_offset_lockless(p4d_t *p4dp, p4d_t p4d,
+		unsigned long address)
+{
+	return (pud_t *)p4dp;
+}
+#define pud_offset_lockless pud_offset_lockless
+
 #define pud_val(x)				(p4d_val((x).p4d))
 #define __pud(x)				((pud_t) { __p4d(x) })
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
