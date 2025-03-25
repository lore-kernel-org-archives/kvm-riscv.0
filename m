Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BA4C35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hrgqqqqbd1/gau/MlC4P346v1K+Z8Kovq+SGeGmSAxI=; b=0EWZz2MrG0eILP
	/KQCznd+zEiLfM4Nyyfxn9gew9phaLujmLhlHLYawLgTuVcyGi3P293zH5U3yJsdrLDBJck7Mh7o5
	zkl3//IeEfl3XbM2SB7Qq/uUrrSfrSZbkLpWGi2rtmzIe+Q3ZZnJAVBpfnHfMqvUTqdUC2SKbTeuV
	HyzE6Nd846qS00/q6IkzESv3ACH0Ez/vlBrC3L/qpOLF5CVahfVM9qPpJlSzxM6EJpY3hd0eMDZ5+
	y9oRe30rVUXPy8g+Y1u7Jv6xj7YZrsTIQFYXLCfTqyaKtw3bMAUPpLU75aIYAPMRr/kt9F4i8xK1+
	Jimd1RX2Aje4P1CYZ22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Yc-00000005rbe-1Bs2;
	Tue, 25 Mar 2025 12:39:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Fq-00000005mkN-3qEr;
	Tue, 25 Mar 2025 12:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4163143492;
	Tue, 25 Mar 2025 12:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9525CC4CEE4;
	Tue, 25 Mar 2025 12:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905178;
	bh=ISWjhncK1TCy0/aI9ckRc78SEAPhWPAPLhDyLEaKeFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JljTIfo5gVHDwGhEgHhBruSFSNYbpMWvToA3rfmH1hgjQuNmceDaFgEXe/3gGSZTH
	 exytkNjTyCOkyjtIhKFOb0XGBYJ/tpWrvx6cqLa0p1rcK+JqHxqzeKhqUHGTeZz3P1
	 268w16IQAohPKFTX+GCAMPr0BXefchXZAvm7xNqRcO9DHHxQ6x1Rv1VAQxtWYoauze
	 0NzZoWSBD1Kbjn5BxOB0hY0NfP+8euHRcxIFeOdx1yFNa3b1LyV/a54VkoW3kpUbNb
	 g/Y6OJcrFuELv1f7GjT/hSs+HZj8euBQvkCNVQ43y1CvxpAwAHEzaLOslayxcIa/XB
	 KKnS677yv+Sgw==
From: guoren@kernel.org
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	torvalds@linux-foundation.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	oleg@redhat.com,
	kees@kernel.org,
	tglx@linutronix.de,
	will@kernel.org,
	mark.rutland@arm.com,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	edumazet@google.com,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	gaohan@iscas.ac.cn,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	wuwei2016@iscas.ac.cn,
	drew@pdp7.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ctsai390@andestech.com,
	wefu@redhat.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	guoren@kernel.org,
	xiao.w.wang@intel.com,
	qingfang.deng@siflower.com.cn,
	leobras@redhat.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	luxu.kernel@bytedance.com,
	david@redhat.com,
	ruanjinjie@huawei.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	qiaozhe@iscas.ac.cn
Cc: ardb@kernel.org,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-nfs@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC PATCH V3 12/43] rv64ilp32_abi: riscv: Introduce cmpxchg_double
Date: Tue, 25 Mar 2025 08:15:53 -0400
Message-Id: <20250325121624.523258-13-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051939_037161_DCA6C4DE 
X-CRM114-Status: GOOD (  11.52  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The rv64ilp32 abi has the ability to exclusively load and store
(ld/sd) a pair of words from an address. Then the SLUB can take
advantage of a cmpxchg_double implementation to avoid taking some
locks.

This patch provides an implementation of cmpxchg_double for 32-bit
pairs, and activates the logic required for the SLUB to use these
functions (HAVE_ALIGNED_STRUCT_PAGE and HAVE_CMPXCHG_DOUBLE).

Inspired from the commit: 5284e1b4bc8a ("arm64: xchg: Implement
cmpxchg_double")

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 53 ++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index da2111b0111c..884235cf4092 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -141,6 +141,7 @@ config RISCV
 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CMPXCHG_DOUBLE if ABI_RV64ILP32
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 938d50194dba..944f6d825f78 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_CMPXCHG_H
 
 #include <linux/bug.h>
+#include <linux/mmdebug.h>
 
 #include <asm/alternative-macros.h>
 #include <asm/fence.h>
@@ -409,6 +410,58 @@ static __always_inline void __cmpwait(volatile void *ptr,
 
 #define __cmpwait_relaxed(ptr, val) \
 	__cmpwait((ptr), (unsigned long)(val), sizeof(*(ptr)))
+
+#ifdef CONFIG_HAVE_CMPXCHG_DOUBLE
+#define system_has_cmpxchg_double()	1
+
+#define __cmpxchg_double_check(ptr1, ptr2)				\
+({									\
+	if (sizeof(*(ptr1)) != 4)					\
+		BUILD_BUG();						\
+	if (sizeof(*(ptr2)) != 4)					\
+		BUILD_BUG();						\
+	VM_BUG_ON((ulong *)(ptr2) - (ulong *)(ptr1) != 1);		\
+	VM_BUG_ON(((ulong)ptr1 & 0x7) != 0);				\
+})
+
+#define __cmpxchg_double(old1, old2, new1, new2, ptr)			\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	register unsigned int __ret;					\
+	u64 __old;							\
+	u64 __new;							\
+	u64 __tmp;							\
+	switch (sizeof(*(ptr))) {					\
+	case 4:								\
+		__old = ((u64)old2 << 32) | (u64)old1;			\
+		__new = ((u64)new2 << 32) | (u64)new1;			\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__tmp), "=&r" (__ret), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		__ret = (__old == __tmp);				\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	__ret;								\
+})
+
+#define arch_cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)			\
+({									\
+	int __ret;							\
+	__cmpxchg_double_check(ptr1, ptr2);				\
+	__ret = __cmpxchg_double((ulong)(o1), (ulong)(o2),		\
+				 (ulong)(n1), (ulong)(n2),		\
+				  ptr1);				\
+	__ret;								\
+})
+#endif
 #endif
 
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
