Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A140CCD8C9D
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MymtadbOeELU05X1ZacDmWYwuyJLPgirVNsSQ411Ai8=; b=k1gWaekPbj/Aui
	gpqxkivkguYU8vOX3AHiS6mVrZnVURT5yu31AlhZjiBlGQ2b90ib9NfbYfR/QQ/vV6j+LYZgj4WOz
	ABKqsFTItinqNbTqK9FYWuTOZTle48cgK4OerBofvXnSRtgoerg0KNwkBe56dMvADpXWFLd9Gr8SA
	+WdiWap3SC19cp2oSk6jVEmZ6DV62vehB1igYmlhXYb5Vmg40Ubai3UoTeAls1VfKPs6263+x9csy
	qt0lMgaa7gUhPuIErTBk4+GuUKMmlmUXJ/CBbvm3bJ6vu9bhZ+FPcXX9BKFef3xKTy7btiEHj4fF9
	WTe3t0HLJ6Ej3c8tbqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcHf-000000040Ph-3jia;
	Mon, 08 Jun 2026 15:53:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcHc-000000040Ob-1EQn
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 15:53:02 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso44207065ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 08 Jun 2026 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780933979; x=1781538779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVMcV2amC0zCzG7WFGyPAc9k2b2Mh+czO6Q9ao0kqOA=;
        b=S+wUasjNQWwXHwWEl1JvjVhSr894TQHrAN9SgVkUII6HAepPNNQ0bD5jZ4jq17j/F/
         l45bfbzlKEmIXdArw2MO+YRX7pb2zmlNZtkxLyBgtHA6I4D+KWK351/4M2UkESsHZehj
         SlK/mRlhcb0g80jZsT65b6eYtC3aU0tMpu7MRnUnT1h+l+9GuRzKlLw1PmTQQ0dayuXP
         DNycsqbNYj/qnSg3I1AtPXqQ8V5RvlR1TW7EX14UUR5Ds1VnV6CzUwn75RSXcbuIvtDr
         GcyNl1Yfxg8ilZG9jb5ue8kxhtC0tQ5COWQdtqGDpPpC78Olg2RmXJSGBXlJBwdYOy4d
         4EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780933979; x=1781538779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVMcV2amC0zCzG7WFGyPAc9k2b2Mh+czO6Q9ao0kqOA=;
        b=GCyb8k2cTBfIXqX7Ue0bGcyCrgzJYOKufmEsTyYKF3GKbxlYA2vcySk28obEKGB5mb
         wjMqWZ6DuUZDVcOQcT3owSHOQrnHaJA6Okabou1B+n8FaVsJi2d0NqLEf6Y8rOJ9kNcd
         JE6Ff40K5/703oBd/+9ld+dOmDIznkRH5XItfm9ISjv7ZYrHXw+YN+yWCxM+RNH6pexG
         QABe0DCAtc83XLmVbdu/Xfh/qfIGXbKH1ZZyMhxE+AR+sergjHIqP/iuvi5ZdpAxHi8m
         0zr6d3WzxB48f4c/h3IzGwKlZNLy8zFPYw5wKDjZe+KTQiNiN8TN0jd6Wqi/MqAgvGEG
         iPiw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZZSl3YON1sH/7oZ6X6kp0nXvzfs9AG/8QEycRiGMKeog2NgrbKv5ryjh5rPshGbtJDQp5Z0w/8C8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzekM4pR59RldfBJUpTqZKCtNRhn+sNTuCm5NxTR/6s5Fx+7hMy
	IF1HdXjA880q3wVdqHV2mp9k8uVpV1i6OAA2qw9SSXy9j3dq910q13Kb
X-Gm-Gg: Acq92OGdwwFT8DSyYJV8KgXw1vXgcUVnnlDHALM4rdkG+N5Pw8TwcxCGBOoBtWJ+Dsc
	IGFuwl1YysrvgBLhKoEBGZiWJUNoDh+kKQ58IIvuBjNUPCJ/pbcuPcTvXm4ZWmCPN11WhVx07zO
	k6/bZY3/N+dTCujk3ueUu1cHTndJR0bW/EDw7nsPnhX1IK3eKeXKQtEOv2+XXTgg5eSkSeWZajf
	+oxsR46WJ1VgMx6ZOdnI7670r659gn5MCWorN4giPv+bSf3Jc8iIh2etabubnJ0DEpf0Xcrghmo
	EqexnN/QaIUL+lj9nvSsfhxUOiZNBpy7zND4mFEaICRCf57ZoVQLtgLYxc2dKGQhkGN/P4AtIXS
	a+SxcCDfH7lWuR6LR8dlfTCG3kiW8HQwjNsGZChi4UyXlD3UqJE0c2Du55+haf5EuSlnwfiYLn+
	sPcD27b/sVtN74yNmZ/HW0F5DD0f13GbOnHBpHS/lm93lwRMNW8XoY/wo+yBoStp+4ofmvSeZOD
	B278bg66p+RufW8XvPJegRQ4kVc1xwBBKd58WGsgA==
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr175246605ad.36.1780933979031;
        Mon, 08 Jun 2026 08:52:59 -0700 (PDT)
Received: from LAPTOP-M4N25KQ5.tail73068d.ts.net (1-160-247-151.dynamic-ip.hinet.net. [1.160.247.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm192371645ad.82.2026.06.08.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:52:58 -0700 (PDT)
From: Sean Chang <seanwascoding@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Chang <seanwascoding@gmail.com>
Subject: [PATCH v1] riscv: kvm: Use endian-specific __lelong for NACL shared memory
Date: Mon,  8 Jun 2026 23:52:52 +0800
Message-ID: <20260608155252.4292-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_085300_337970_28F2B5ED 
X-CRM114-Status: GOOD (  13.33  )
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

When compiling with sparse enabled (C=2), bitwise type warnings are
triggered in the RISC-V KVM implementation. This occurs because the
user-space data unboxing macro '__get_user_asm' performs implicit
casting on restricted types without forcing the compiler's compliance.

Additionally, raw 'unsigned long *' pointers are used to access the
SBI NACL shared memory, whereas the RISC-V SBI specification mandates
that these structures must follow little-endian byte ordering.

Fix these by:
1. Adding a '__force' cast to '__get_user_asm()' to safely suppress
   implicit cast warnings during user-space data fetching.
2. Introducing the '__lelong' type macro, which dynamically resolves to
   '__le32' or '__le64' depending on XLEN, and replacing 'unsigned long *'
   with '__lelong *' to enforce proper compile-time endianness checks.

Signed-off-by: Sean Chang <seanwascoding@gmail.com>
---
 arch/riscv/include/asm/kvm_nacl.h | 14 ++++++++------
 arch/riscv/include/asm/uaccess.h  |  2 +-
 arch/riscv/kvm/nacl.c             |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_nacl.h b/arch/riscv/include/asm/kvm_nacl.h
index 4124d5e06a0f..f45407bcaa26 100644
--- a/arch/riscv/include/asm/kvm_nacl.h
+++ b/arch/riscv/include/asm/kvm_nacl.h
@@ -60,9 +60,11 @@ int kvm_riscv_nacl_init(void);
 #ifdef CONFIG_32BIT
 #define lelong_to_cpu(__x)	le32_to_cpu(__x)
 #define cpu_to_lelong(__x)	cpu_to_le32(__x)
+#define __lelong                __le32
 #else
 #define lelong_to_cpu(__x)	le64_to_cpu(__x)
 #define cpu_to_lelong(__x)	cpu_to_le64(__x)
+#define __lelong                __le64
 #endif
 
 #define nacl_shmem()							\
@@ -70,7 +72,7 @@ int kvm_riscv_nacl_init(void);
 
 #define nacl_scratch_read_long(__shmem, __offset)			\
 ({									\
-	unsigned long *__p = (__shmem) +				\
+	__lelong *__p = (__shmem) +					\
 			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
 			     (__offset);				\
 	lelong_to_cpu(*__p);						\
@@ -78,7 +80,7 @@ int kvm_riscv_nacl_init(void);
 
 #define nacl_scratch_write_long(__shmem, __offset, __val)		\
 do {									\
-	unsigned long *__p = (__shmem) +				\
+	__lelong *__p = (__shmem) +					\
 			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
 			     (__offset);				\
 	*__p = cpu_to_lelong(__val);					\
@@ -87,7 +89,7 @@ do {									\
 #define nacl_scratch_write_longs(__shmem, __offset, __array, __count)	\
 do {									\
 	unsigned int __i;						\
-	unsigned long *__p = (__shmem) +				\
+	__lelong *__p = (__shmem) +					\
 			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
 			     (__offset);				\
 	for (__i = 0; __i < (__count); __i++)				\
@@ -168,7 +170,7 @@ __kvm_riscv_nacl_hfence(__shmem,					\
 
 #define nacl_csr_read(__shmem, __csr)					\
 ({									\
-	unsigned long *__a = (__shmem) + SBI_NACL_SHMEM_CSR_OFFSET;	\
+	__lelong *__a = (__shmem) + SBI_NACL_SHMEM_CSR_OFFSET;		\
 	lelong_to_cpu(__a[SBI_NACL_SHMEM_CSR_INDEX(__csr)]);		\
 })
 
@@ -176,7 +178,7 @@ __kvm_riscv_nacl_hfence(__shmem,					\
 do {									\
 	void *__s = (__shmem);						\
 	unsigned int __i = SBI_NACL_SHMEM_CSR_INDEX(__csr);		\
-	unsigned long *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
+	__lelong *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
 	u8 *__b = (__s) + SBI_NACL_SHMEM_DBITMAP_OFFSET;		\
 	__a[__i] = cpu_to_lelong(__val);				\
 	__b[__i >> 3] |= 1U << (__i & 0x7);				\
@@ -186,7 +188,7 @@ do {									\
 ({									\
 	void *__s = (__shmem);						\
 	unsigned int __i = SBI_NACL_SHMEM_CSR_INDEX(__csr);		\
-	unsigned long *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
+	__lelong *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
 	u8 *__b = (__s) + SBI_NACL_SHMEM_DBITMAP_OFFSET;		\
 	unsigned long __r = lelong_to_cpu(__a[__i]);			\
 	__a[__i] = cpu_to_lelong(__val);				\
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 11c9886c3b70..5d4ec15584cf 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -112,7 +112,7 @@ do {								\
 		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
 		: "=&r" (__tmp)					\
 		: "m" (*(ptr)) : : label);			\
-	(x) = (__typeof__(x))(unsigned long)__tmp;		\
+	(x) = (__force __typeof__(x))(unsigned long)__tmp;	\
 } while (0)
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #define __get_user_asm(insn, x, ptr, label)			\
diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
index 08a95ad9ada2..6f9f8963e9dd 100644
--- a/arch/riscv/kvm/nacl.c
+++ b/arch/riscv/kvm/nacl.c
@@ -20,7 +20,7 @@ void __kvm_riscv_nacl_hfence(void *shmem,
 			     unsigned long page_count)
 {
 	int i, ent = -1, try_count = 5;
-	unsigned long *entp;
+	__lelong *entp;
 
 again:
 	for (i = 0; i < SBI_NACL_SHMEM_HFENCE_ENTRY_MAX; i++) {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
