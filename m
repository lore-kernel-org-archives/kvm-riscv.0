Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDA6C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UHmz9n/29FFMXQldKNgH2o/9NKVuthy3s2M4rGsK40=; b=vhQvRiN13OXEI0
	fsMo7f41ZbyY2VjQNmqKUDI3e+HBn3HxeyWBZ2kime3SSh651rCn7AJge5CL/HZka0tWuf26x0xvI
	HkDSleiHU1/WWTh4L1c0xOHjdfD1+KqypRIn90mlr/EE5KSnQPNiNvvc7dGh3Y4VyjIRpHnGrJPqh
	zigA6fFXoGj6d2T6BaebToj3tj0r/uFIiBvmw2dchVH5kAG68ScOQvq02I8IFZjiES9lNVJKammbH
	eiB0WR8wgEQVmxJVHpAoy5EAeX2U6n69lkRZ+YOgcW8l7Sr7YrnFqe7OhHhp16N3WkCDrv329EDZg
	cqh4hatMgKZQGAK/nfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jce-0000000EbVP-3Iy9;
	Wed, 02 Sep 2026 11:59:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jcd-0000000EbUI-2REK;
	Wed, 02 Sep 2026 11:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mrBct1ISMak5bjABJ9a0QZ572O4KmXxSTLwo8amtM1I=; b=RFX1boRqCxFmnHy2kmn0JugU95
	ldXlvVFam66q1+KLgazxd+NQLTu/0i7ur5uyTBnyDjxS56z4wLESsNQZnxzRmWWecldFlmc1ye2cP
	fjwLeHB/PlvYXSdVMDrzKSCSCY9fRvenNLvxfTCdIiaOT+1XV9Au08wm0cfZaUrf3FW4b7K8U5m27
	5MZ9C1JOmYVwmIHaOqGWkd0Q2idCnenoonJQDkV9Y56raqUc+rc9qJmErnAa7jcF0K8995bJRIeCE
	g5uL7rS9bOWuzShw8fkVp3Jh+1XaOOAtB0574qnWVYsc4o25WvpkzVuCj0UlYCK/21538e+uHa5cd
	Fb+0M1eQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jcZ-0000000Bw3b-36fL;
	Wed, 02 Sep 2026 11:59:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CC611E32;
	Wed,  2 Sep 2026 04:59:10 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6C6E3F85F;
	Wed,  2 Sep 2026 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350354; bh=Br/cs+FpftnQOol6BErs3frU8GfYo1jZb/nBuxpBEq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YNIufYY97B6qUu57kfR8nwRxcLtpS+O6ostRIi/nQOuKLD58rztHwSAiT1AAYOntl
	 fxPaSMddAYwDW8STJc6MsE8WWxYq2NPYdK+F0yYS0HcTTtt1ra7YEAriOl0DmEf2lo
	 zM0F0pNqICHzqI3Xh+hnQZNMeBEPTobb3bXedcbs=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:23 +0100
Subject: [PATCH RFC v3 21/21] Documentation: mm: clarify behaviour of
 compile-time folded page tables
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-21-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5247; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=QkuS96DAgeRV++qcxLUFqnS2tbZYgjub9eHsvrXmSd4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7r6ZZHyXCpThNLcIh389noXapBmN0QtJRA/
 0G6xN7Ry3uJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO6wAKCRBt1cPRWsUx
 M58/C/9U9B6FfYQ/fupAFaXvIw1Mnt9yYqNpnlfNtC6NDeZsWkfEpD8g8rzw/ZmT9NJlS4YfPs1
 Qx6kcjhDR9PAeBJBPGh8BxQwaeLNn1ssBbAQxNDfX7yrRLWPxHK9wZ7XBK+0+Y5Lk3lgdRQJ6qI
 p4F+YbpHGfi22XGen2K3KAJo4nzOC2nru7i6LL5wr8wAlWshB+2+4MqDHojeNHwLITRml9jgLu1
 /5lqRtOqA/q+Qf0MpV0tPwdATl3vJk5GSkq2yFyzkMR4LYpE4C4fuh5kWjMReGy62Non6aPXFa8
 +6UdHtXQ4V3qp9smbO5LbcLD7qQUPFqBTFktH5C1HQXXAvjDBzouhN5N4kjlLCeCrRwIwAVEVZR
 TNUIXv8PMlOojSv+isqEwSGFr+0lJ0ySAkyPAXIRh55obtZ2bBmU/KQx8c+65rZmmgDb4nJ57+G
 Vajqff8eVIyX0IvBrlsknDMl32bDAWeQx3n/WwlNzdx1iu6CzzjQqt5l1s9+zYKYR23pU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_125916_051936_8E72DCDE 
X-CRM114-Status: GOOD (  21.07  )
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

Compile-time folded page tables are not necessarily easy to understand, and even
people the were once familiar with the concept might need to refresh their memory.

Add proper documentation, including a nice diagram, for the current design.
Mention details about dummy functions, including the recently changed pXdp_get()
helpers.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/mm/page_tables.rst | 84 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 9 deletions(-)

diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
index 126c87628250..84f2715c7de0 100644
--- a/Documentation/mm/page_tables.rst
+++ b/Documentation/mm/page_tables.rst
@@ -143,15 +143,81 @@ pointers on each level is architecture-defined.::
 Page Table Folding
 ==================
 
-If the architecture does not use all the page table levels, they can be *folded*
-which means skipped, and all operations performed on page tables will be
-compile-time augmented to just skip a level when accessing the next lower
-level.
-
-Page table handling code that wishes to be architecture-neutral, such as the
-virtual memory manager, will need to be written so that it traverses all of the
-currently five levels. This style should also be preferred for
-architecture-specific code, so as to be robust to future changes.
+Not all architectures support 5-level page tables; while for some of them
+the exact number of supported page table levels is known at compile time,
+others can determine the number of page table levels at runtime based on
+hardware support and address space sizes.
+
+Generic page table walking code always assumes that 5 levels of page table
+exist. To make page table walking code not have to worry about that,
+`compile-time folding` and `runtime folding` of page tables are used.
+Compile-time folding is mostly handled in common code, whereas runtime folding
+is exclusively handled in architecture code.
+
+This description focuses on generic compile-time folded page tables; for
+architecture-specific variants, some details can vary, however, without
+affecting common page table walkers.
+
+When walking folded page tables, all upper page table levels up to the supported
+level are skipped in page table walkers: this is achieved by (a) treating
+entries in upper page table levels as present and pointing at a page table; and
+(b) having page table walkers cast the entry pointer to the next-level entry
+instead of dereferencing that table. From the perspective of a page table
+walker, the entry points at itself.
+
+Assuming compile-time folded 4-level page tables, to achieve (a), pgd_present()
+and pgd_leaf() are hard-coded to indicate a present page table entry that
+points at a page table, and to achieve (b) p4d_offset() and
+p4d_offset_lockless() simply cast the page table entry pointer to the next
+lower level.
+
+In the current design, this is further modeled by having the P4D have a
+single page table entry::
+
+        PGD
+  --> +------+          NOP4D
+      | ptr0 |-------> +------+           PUD
+      | ptr1 |-        | ptr0 |-------> +-----+
+      | ptr2 | \       +------+         | ptr |-------> ...
+      | ptr3 |  \                       | ptr |
+        ...      \                        ..
+                  \        NOP4D
+                   +----> +------+           PUD
+                          | ptr1 |-------> +-----+
+                          +------+         | ptr |-------> ...
+                                           | ptr |
+                                             ...
+
+Note that the arrows from PGD to NOP4D represent page-table-walker
+transitions, not pointers stored in the pgd entries.
+
+Using p4d as an example, `nop4d`/`p4d folded` translates to the following:
+
+- p4d is considered folded into pgd; both are operating on the same page
+ table.
+
+- Most pgd_* helpers are hard-coded dummy functions that ignore the passed
+  pgd_t values entirely. Exceptions are pgd_val() and low-level helpers
+  set_pgd() + pgd_page_vaddr(), which effectively translate to set_p4d()/
+  p4d_pgtable() to keep existing arch code working.
+
+  Architectures must provide p4d_* helpers (unless further common
+  compile-time folding applies).
+
+- PTRS_PER_P4D is hard-coded to 1. Architectures must define PTRS_PER_PGD.
+
+To avoid reading a value that will never be used but cannot be entirely
+optimized out, compile-time folded page table code also makes pXdp_get()
+return a constant dummy value.
+
+In common code, this only affects pXd_val() when used for printing page
+table entries for debugging purposes. As we don't want architecture code
+that uses set_pXd(), pgd_page_vaddr() or pXd_pgtable() to accidentally
+operate on dummy values, the compiler will error out if it detects that the
+helpers are used with dummy values. For a folded level, pXd_page() must not
+be used and unconditionally triggers a compiler error. Architecture code must
+instead call the helpers on the proper first page table level: e.g., set_p4d()
+instead of set_pgd().
 
 
 MMU, TLB, and Page Faults

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
