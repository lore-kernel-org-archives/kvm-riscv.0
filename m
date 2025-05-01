Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87CEC369DC
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 May 2025 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3rH/x9KDeUEXvHodBpfxKC8OWyWIEEKTZtCZdEsKsLw=; b=FnOrNPaii1QPzHfkKRPFUGdUAl
	4unzweRWiFDmKLTgq5U93+wTzr+FdzjPL1F+K3neco2b8Q7M4+YqTLxFtgaKzpvn4s2mRG/95k9JQ
	n2oVSN6r2vb6s1exx3Y7oLi3OSFZM4YAGk22jQfU6tBWb+JtB8CJqUSRpJtKfQSr6uH/8M4MAs5UD
	Ql3bA2d7Lbcm9JxPPQjK0pnq9PVf2+XXLeqylzBCu6shAA/VF+gK+68k7c2PjWndnymACBH4ATamO
	a8j5wGYxmqyrOPRDd1RNLOLMHax7m3SwVamcLifRunr7aDbO8HjGNY3HEzrDkJjGLTLyLPXmgIB0v
	O3Yc4+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYsD-0000000GP3R-2hTB;
	Thu, 01 May 2025 18:43:05 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYip-0000000GMzA-3vml
	for kvm-riscv@lists.infradead.org;
	Thu, 01 May 2025 18:33:26 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7370e73f690so1428936b3a.3
        for <kvm-riscv@lists.infradead.org>; Thu, 01 May 2025 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124403; x=1746729203; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dwX8yTVEjYARQKg5GT8PETnLBnuTSgFFjZk+zO6rJ3g=;
        b=jOuoFeVvHwlZR2iVbTl1vblxzWe23xCr3Eswe/PpotOuPY0xVF0fqaZWyullB3XmAL
         5v+quXIqHe7AW5QvmpIVZZhRGY5/adJX/mBRXaoe/Yh+qnyPyxsTO4ShM4ERuSU43M5V
         WOx/vxIsKSk+QwL5GlKz3GWVRaLhSU8w4WfSn0cVxnBg483WKGuoIeQJcb3nebV9fwWG
         L3z3Pa81p5EojjrzO65qwf60D7oj5EuQAbb/FgzSd/XEHKnxigVqMU864UQl18f1Kzqy
         jkkQFwSPfT/BIveaNKF9Dnj6O0Y2WKtfWOKJVwS26St1Cf8KKV/1dSb17mHEDlWme8xG
         Bc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124403; x=1746729203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwX8yTVEjYARQKg5GT8PETnLBnuTSgFFjZk+zO6rJ3g=;
        b=GqPaTX+yYps0XYLnr177JHhg/XYJEXTAhdjj7PP6E4gcRnbFpGZloPHjcJeh60f7Wj
         Fpp2X6Hv7S2FnOBIyqtn25lhYjWqldVsRd5+vU1lQ68utZFSNYDFDfRDbbtqLXGA8w2+
         MQOuXsIS/ODMOTOKvBmS6+Y09yWe92VmLUrSj5yE6C0sSPMhqXc81dUdOfZZlCu/dnzd
         K7DJ50L/TcrGSPGp5/SlEXK43qIdBsdUrYeaqknn1FJ7Gc5nC7/1XRmWQFqIc6FhoNbm
         nNZUjVZTwOhJ9ixtRg3FXOiciE3/1MBxRq/07uS363e9QUR9iMMEiBPEwy0UQBtp4jHP
         ZbaA==
X-Forwarded-Encrypted: i=1; AJvYcCV1oJvROX3d0T7J5pSd0WPWiIdYRdEjSNfRDziet80ur3XPkAg0vj7FL1wxGYn8h+iy5WG/qrlToBs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk+QySAO9prmOylFAu90CHqdmUmvhAXSgigkXpTO1oisi/R53Z
	mSY0RcpUX5Ep+UvJxos3gPcl2xEN4UWXqkHJvxkTm8ymB7Ay3H9Ephc89lzsd+OEY4mmw2jcFpa
	ViINNEh/ZgQ==
X-Google-Smtp-Source: AGHT+IHrbGH7WgJqSYjrU8m0rFTdpZBQGZbVJPPvyXLDCRPLb/rXqe1aqpqdcgy7q0zHlBQIvPoUiD1ozfGI2g==
X-Received: from pgjh16.prod.google.com ([2002:a63:df50:0:b0:b1f:8154:79d8])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:100d:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-20ba8c5e77bmr7447597637.35.1746124402823;
 Thu, 01 May 2025 11:33:22 -0700 (PDT)
Date: Thu,  1 May 2025 11:32:59 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501183304.2433192-6-dmatlack@google.com>
Subject: [PATCH 05/10] KVM: selftests: Use s64 instead of int64_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, James Houghton <jthoughton@google.com>, 
	Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_113323_982535_E3DF085D 
X-CRM114-Status: GOOD (  17.97  )
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

Use s64 instead of int64_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int64_t/s64/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c  |  2 +-
 tools/testing/selftests/kvm/guest_print_test.c   |  2 +-
 tools/testing/selftests/kvm/include/test_util.h  |  4 ++--
 tools/testing/selftests/kvm/lib/test_util.c      | 16 ++++++++--------
 .../testing/selftests/kvm/lib/userfaultfd_util.c |  2 +-
 tools/testing/selftests/kvm/lib/x86/processor.c  |  4 ++--
 tools/testing/selftests/kvm/memslot_perf_test.c  |  2 +-
 tools/testing/selftests/kvm/steal_time.c         |  4 ++--
 tools/testing/selftests/kvm/x86/kvm_clock_test.c |  2 +-
 .../selftests/kvm/x86/vmx_tsc_adjust_test.c      |  6 +++---
 10 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index d2b689d844ae..502b8e605048 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -36,7 +36,7 @@ struct reg_ftr_bits {
 	 * For FTR_EXACT, safe_val is used as the exact safe value.
 	 * For FTR_LOWER_SAFE, safe_val is used as the minimal safe value.
 	 */
-	int64_t safe_val;
+	s64 safe_val;
 };
 
 struct test_feature_reg {
diff --git a/tools/testing/selftests/kvm/guest_print_test.c b/tools/testing/selftests/kvm/guest_print_test.c
index 894ef7d2481e..b059abcf1a5b 100644
--- a/tools/testing/selftests/kvm/guest_print_test.c
+++ b/tools/testing/selftests/kvm/guest_print_test.c
@@ -25,7 +25,7 @@ static struct guest_vals vals;
 
 /* GUEST_PRINTF()/GUEST_ASSERT_FMT() does not support float or double. */
 #define TYPE_LIST					\
-TYPE(test_type_i64,  I64,  "%ld",   int64_t)		\
+TYPE(test_type_i64,  I64,  "%ld",   s64)		\
 TYPE(test_type_u64,  U64u, "%lu",   u64)		\
 TYPE(test_type_x64,  U64x, "0x%lx", u64)		\
 TYPE(test_type_X64,  U64X, "0x%lX", u64)		\
diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index 7cd539776533..e3cc5832c1ad 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -82,8 +82,8 @@ do {									\
 
 size_t parse_size(const char *size);
 
-int64_t timespec_to_ns(struct timespec ts);
-struct timespec timespec_add_ns(struct timespec ts, int64_t ns);
+s64 timespec_to_ns(struct timespec ts);
+struct timespec timespec_add_ns(struct timespec ts, s64 ns);
 struct timespec timespec_add(struct timespec ts1, struct timespec ts2);
 struct timespec timespec_sub(struct timespec ts1, struct timespec ts2);
 struct timespec timespec_elapsed(struct timespec start);
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index a23dbb796f2e..06378718d67d 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -76,12 +76,12 @@ size_t parse_size(const char *size)
 	return base << shift;
 }
 
-int64_t timespec_to_ns(struct timespec ts)
+s64 timespec_to_ns(struct timespec ts)
 {
-	return (int64_t)ts.tv_nsec + 1000000000LL * (int64_t)ts.tv_sec;
+	return (s64)ts.tv_nsec + 1000000000LL * (s64)ts.tv_sec;
 }
 
-struct timespec timespec_add_ns(struct timespec ts, int64_t ns)
+struct timespec timespec_add_ns(struct timespec ts, s64 ns)
 {
 	struct timespec res;
 
@@ -94,15 +94,15 @@ struct timespec timespec_add_ns(struct timespec ts, int64_t ns)
 
 struct timespec timespec_add(struct timespec ts1, struct timespec ts2)
 {
-	int64_t ns1 = timespec_to_ns(ts1);
-	int64_t ns2 = timespec_to_ns(ts2);
+	s64 ns1 = timespec_to_ns(ts1);
+	s64 ns2 = timespec_to_ns(ts2);
 	return timespec_add_ns((struct timespec){0}, ns1 + ns2);
 }
 
 struct timespec timespec_sub(struct timespec ts1, struct timespec ts2)
 {
-	int64_t ns1 = timespec_to_ns(ts1);
-	int64_t ns2 = timespec_to_ns(ts2);
+	s64 ns1 = timespec_to_ns(ts1);
+	s64 ns2 = timespec_to_ns(ts2);
 	return timespec_add_ns((struct timespec){0}, ns1 - ns2);
 }
 
@@ -116,7 +116,7 @@ struct timespec timespec_elapsed(struct timespec start)
 
 struct timespec timespec_div(struct timespec ts, int divisor)
 {
-	int64_t ns = timespec_to_ns(ts) / divisor;
+	s64 ns = timespec_to_ns(ts) / divisor;
 
 	return timespec_add_ns((struct timespec){0}, ns);
 }
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 516ae5bd7576..029465ea4b0b 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -27,7 +27,7 @@ static void *uffd_handler_thread_fn(void *arg)
 {
 	struct uffd_reader_args *reader_args = (struct uffd_reader_args *)arg;
 	int uffd = reader_args->uffd;
-	int64_t pages = 0;
+	s64 pages = 0;
 	struct timespec start;
 	struct timespec ts_diff;
 	struct epoll_event evt;
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index e06dec2fddc2..33be57ae6807 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -293,8 +293,8 @@ u64 *__vm_get_page_table_entry(struct kvm_vm *vm, u64 vaddr, int *level)
 	 * Based on the mode check above there are 48 bits in the vaddr, so
 	 * shift 16 to sign extend the last bit (bit-47),
 	 */
-	TEST_ASSERT(vaddr == (((int64_t)vaddr << 16) >> 16),
-		"Canonical check failed.  The virtual address is invalid.");
+	TEST_ASSERT(vaddr == (((s64)vaddr << 16) >> 16),
+		    "Canonical check failed.  The virtual address is invalid.");
 
 	pml4e = virt_get_pte(vm, &vm->pgd, vaddr, PG_LEVEL_512G);
 	if (vm_is_target_pte(pml4e, level, PG_LEVEL_512G))
diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index 7ad29c775336..75c54c277690 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -1039,7 +1039,7 @@ static bool parse_args(int argc, char *argv[],
 
 struct test_result {
 	struct timespec slot_runtime, guest_runtime, iter_runtime;
-	int64_t slottimens, runtimens;
+	s64 slottimens, runtimens;
 	u64 nloops;
 };
 
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 3370988bd35b..57f32a31d7ac 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -114,7 +114,7 @@ struct st_time {
 	u64 st_time;
 };
 
-static int64_t smccc(uint32_t func, u64 arg)
+static s64 smccc(uint32_t func, u64 arg)
 {
 	struct arm_smccc_res res;
 
@@ -131,7 +131,7 @@ static void check_status(struct st_time *st)
 static void guest_code(int cpu)
 {
 	struct st_time *st;
-	int64_t status;
+	s64 status;
 
 	status = smccc(SMCCC_ARCH_FEATURES, PV_TIME_FEATURES);
 	GUEST_ASSERT_EQ(status, 0);
diff --git a/tools/testing/selftests/kvm/x86/kvm_clock_test.c b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
index e986d289e19b..d885926c578d 100644
--- a/tools/testing/selftests/kvm/x86/kvm_clock_test.c
+++ b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
@@ -18,7 +18,7 @@
 
 struct test_case {
 	u64 kvmclock_base;
-	int64_t realtime_offset;
+	s64 realtime_offset;
 };
 
 static struct test_case test_cases[] = {
diff --git a/tools/testing/selftests/kvm/x86/vmx_tsc_adjust_test.c b/tools/testing/selftests/kvm/x86/vmx_tsc_adjust_test.c
index ed32522f5644..450932e4b0c9 100644
--- a/tools/testing/selftests/kvm/x86/vmx_tsc_adjust_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_tsc_adjust_test.c
@@ -52,9 +52,9 @@ enum {
 /* The virtual machine object. */
 static struct kvm_vm *vm;
 
-static void check_ia32_tsc_adjust(int64_t max)
+static void check_ia32_tsc_adjust(s64 max)
 {
-	int64_t adjust;
+	s64 adjust;
 
 	adjust = rdmsr(MSR_IA32_TSC_ADJUST);
 	GUEST_SYNC(adjust);
@@ -111,7 +111,7 @@ static void l1_guest_code(struct vmx_pages *vmx_pages)
 	GUEST_DONE();
 }
 
-static void report(int64_t val)
+static void report(s64 val)
 {
 	pr_info("IA32_TSC_ADJUST is %ld (%lld * TSC_ADJUST_VALUE + %lld).\n",
 		val, val / TSC_ADJUST_VALUE, val % TSC_ADJUST_VALUE);
-- 
2.49.0.906.g1f30a19c02-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
