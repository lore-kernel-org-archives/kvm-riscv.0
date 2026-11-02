Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEFD606CEED
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ByIyHDjb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BrPb0hXu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6YpeRhw0yG1QI4m2WhpAwP27lfaYl6kf5UV8rZpCgs0=; b=ByIyHDjbvyxA7TYZZYRnuOkjuw
	2EUWE9S8Pfzc/A/vbKq3WfYsKEdCc7LBjyNCxlz3BGOt7ECU6MjqDs9OjYbwj4OS6tu0mj0DkCBtG
	oN7Orp+uD1E3LY5GtheSzZ4MIlCBz4UQeJEjP/BOrV0ROFODLT0n213brYFptjT7WeiTWaeQsSuju
	aviaEyAM3zEurSmvDUFey5BdglmpLgnLH67xIOvMGwGxfXInTk+bbA37mOcq0ecA40w4xdyDShOQb
	EHgh9ahrI3vR+FH2JEQmV9AJlPKz8yDKreRpKqdAknFZXH6YZUapmUcdMd03CGVPxNtVegNp4qBaE
	jA6g+dUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8o-0000000GKTM-3GYT;
	Mon, 02 Nov 2026 11:23:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8k-0000000GKNt-1TIi;
	Mon, 02 Nov 2026 11:23:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91B02293B;
	Mon,  2 Nov 2026 03:23:46 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4ED03F632;
	Mon,  2 Nov 2026 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618629; bh=iiExwLtobXiDRkDzhCd4KbgedHi6eyqTW5J2A3p/GoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BrPb0hXuYg5FDqnQoxAoQEPqwy35W9QWkiKSZbg3KsrD0XEabz16DkjubK7JqGSV0
	 OPWT8B5k/j69iFU4lw32ZN1FbqKVhYkgINnZSpuVpHWynTxUVdsXn3n2gXh0w8vpHx
	 C1xoy3anV4D+fDsKAX6O+jB+JolHrc1sf7sWdpz8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:34 +0000
Subject: [PATCH RESEND v2 21/21] Documentation: mm: clarify behaviour of
 compile-time folded page tables
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-21-78840b2ec73c@arm.com>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
In-Reply-To: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5250; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=we33pLaWTEXUzxN2eli55cmCuITu+4r4z0c6wIrOlvY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HI5puhw5lGPEsqL2+0oxYQ14ZUvSogy1dQY7
 mbhixVweFqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyOQAKCRBt1cPRWsUx
 M0LeC/9Cq0L+HoSCeEcxKHvRuuTb6eN/i826KAV+hkrcMfVFIULPPvwRKY9kYk3gsbK8opHg/qM
 eDSlKtSYplqrFvRLwGt/ddDHCU47Hi1VZGw8A2j1HDaCHffEGl6C5FzzdErrZCIBrMIUlrZZARQ
 u4fy1wwWXQu9IYjXnyF3BI07Y05Is6jHXzw5ApmalBxBp85sr1oFlR45kHuQxi8Ma67ye23pU+i
 0ZfEc1HgiqWjEanyJvQQFiIUwn7+lmt+sYCHqncaafdCYo3KHgQaHetYAneCx7X14vidrudgq+u
 C2LEDT0pu3GVJlMya52voqvBocPv07v+yrOMkc2yrVlibFvy72hf8cXhXucoMOtYi9Ac6p0nTbH
 UBsr8OB8/MJYoiHCzkYACf6uE2qyNGCqCwApVpfGBocJ8Tm4THZDDTv79sd4Sr7B2Fo2BrLYn9V
 xgmHiHS71tqPIlx4VRSha2GekLQlQUXLnzYAP7xJLSeoiFrOZwyfxUMXye+TMGvJSDGiQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032350_536629_7C7E3244 
X-CRM114-Status: GOOD (  20.61  )
X-Spam-Score: -4.4 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 126c876282509..d4f3e2e343ca2 100644
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
+  table.
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
