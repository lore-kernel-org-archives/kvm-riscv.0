Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF919F5A8BC
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5l+TlunLsuLIdrIz9uP+hF8SOpHkObNtocGfGiDIw6w=; b=kjpWLmT4LXtkVc
	XeHEr+ALPIsWB6TvrQxH5wIep/5eBnZBKsIBV0VlZP0UEgxZtOVwhex3dzfbj0THCO++c0xm5yEzI
	nXVe1I9Ucn4ZS7VQ52XDlbq8rrYL8KlISnaGiYxw7BdxJwKA8+owXBHZM9dCaVCCKCUTIUa1i4C+z
	EgtV9w/ZqJ/7q7VMt08bwpufiq/n3q/b/0eMcctCD8w1x3NHshPDzwABLKtcGAYwYq0+M1oMHsCm1
	0DpGAhbQCohL3PVtOfWRb20NQ/90xY32kjTYeOAFnrM8VxdXDrU72aYAeIyzpw64cF+PAnh4Qku9P
	v8U+bNEBxWb2N3fjS/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2i-00000007frn-2vYj;
	Mon, 20 Apr 2026 21:20:32 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2T-00000007fYg-0pH8
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:21 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c7976ded5c5so3300500a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720016; x=1777324816; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LgSbE/Mgjmr5sEfkbBcIyWDe7SVs47UFLiamE2DA5JI=;
        b=WtnaL0rXoRjTO3mGlrNft5CKHwULJ5pSjGHmsuAD/DxQeNgx8plt6NEgKD62vdaGUa
         6AdENKLIVMrsUfK95DBBRb1FJYigd4KdqZhuqCDmiNJ2aEfiF+CDNmslPfK11HEkjWpd
         CLFrP2hTes+3wnABiIZ9AdiZxXqgc8MY0WCegsR2j+jDHFSg3LSw72cZsU30f2kuS0Gy
         4SG5MEPZTX5GshYqNiDDdffDmxcjLc74NcfTo86fdNK/SLNU7B3WWfmdjgMt9HgB78cs
         AJc6DiEvsWPmr48SGTWq+Xlh3eS7HoFFItoibgxW1p133C5KYrtvxjoSfmrF9aASHF2j
         A+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720016; x=1777324816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgSbE/Mgjmr5sEfkbBcIyWDe7SVs47UFLiamE2DA5JI=;
        b=dwX51aASLIknFdg8yCv8pDrw6kuNctuigppUkOxLU6h7cDjtkK5KVxjuk4Y5zh8gTp
         MWrQjiGJsrGTi08ixfWJpGPxghDDMA31XXNOkxa2/krHFO3ERJkiVxyiCIEWzt/KzMlj
         FwP9pUmZuX82julqbIqiGcheySpSd8ljRrrpAvO1WvdBFHwh6a3SIBj6GvgJH1IHnXZM
         zOp0YL+rrgYuwEAtjtorAJRlT49FKw96WVPYhrfAY6yv02B3YbF4z95TWKS4DFJ2A7IA
         pyU1/GMPdl+ftTZURF/8Dji59VvjLKcY04L7RFimlwiHey68mjPkIB3Za1Jc8BpGhQXj
         co8A==
X-Forwarded-Encrypted: i=1; AFNElJ+uW6fJFXY6J3ezbOYwyjeHmU21z32fBUYZCPbzjkiolggyCyjBZx19hzjniDzmgh3kcHgwT6tkTHw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/kSpwAHma2mApcoOgN5J+iUqxtmDtlAQIiEKLc6EdNlGmcjZS
	qKlz9F6gVJnGhb47qju4CGdkRtuRAsFrSgkhSGQyDKFNuLubDQB7Ni1IXSqQgJKJDUFGIxZL69D
	L4wUTWw==
X-Received: from pfbjw21.prod.google.com ([2002:a05:6a00:9295:b0:82f:a4cc:2fb3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:bd0a:b0:82c:9897:70e6
 with SMTP id d2e1a72fcca58-82f8c8e8aaemr16257900b3a.34.1776720015506; Mon, 20
 Apr 2026 14:20:15 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:50 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-6-seanjc@google.com>
Subject: [PATCH v3 05/19] KVM: selftests: Use s64 instead of int64_t
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_142017_279611_744F5B64 
X-CRM114-Status: GOOD (  17.41  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: David Matlack <dmatlack@google.com>

Use s64 instead of int64_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int64_t/s64/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c  |  2 +-
 tools/testing/selftests/kvm/arm64/set_id_regs.c  |  2 +-
 tools/testing/selftests/kvm/guest_print_test.c   |  2 +-
 tools/testing/selftests/kvm/include/test_util.h  |  4 ++--
 tools/testing/selftests/kvm/lib/test_util.c      | 16 ++++++++--------
 .../testing/selftests/kvm/lib/userfaultfd_util.c |  2 +-
 tools/testing/selftests/kvm/lib/x86/processor.c  |  2 +-
 tools/testing/selftests/kvm/memslot_perf_test.c  |  2 +-
 tools/testing/selftests/kvm/steal_time.c         |  4 ++--
 tools/testing/selftests/kvm/x86/kvm_clock_test.c |  2 +-
 .../selftests/kvm/x86/nested_tsc_adjust_test.c   |  6 +++---
 11 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index 61954f2221e4..7285eade4acf 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -59,7 +59,7 @@ static bool far_invalid;
 static u64 translate_to_host_paddr(unsigned long vaddr)
 {
 	u64 pinfo;
-	int64_t offset = vaddr / getpagesize() * sizeof(pinfo);
+	s64 offset = vaddr / getpagesize() * sizeof(pinfo);
 	int fd;
 	u64 page_addr;
 	u64 paddr;
diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 9b9c04c963a1..4402f317f7d9 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -36,7 +36,7 @@ struct reg_ftr_bits {
 	 * For FTR_EXACT, safe_val is used as the exact safe value.
 	 * For FTR_LOWER_SAFE, safe_val is used as the minimal safe value.
 	 */
-	int64_t safe_val;
+	s64 safe_val;
 
 	/* Allowed to be changed by the host after run */
 	bool mutable;
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
index 62fe83763021..d7489db738bf 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -101,8 +101,8 @@ do {										\
 
 size_t parse_size(const char *size);
 
-int64_t timespec_to_ns(struct timespec ts);
-struct timespec timespec_add_ns(struct timespec ts, int64_t ns);
+s64 timespec_to_ns(struct timespec ts);
+struct timespec timespec_add_ns(struct timespec ts, s64 ns);
 struct timespec timespec_add(struct timespec ts1, struct timespec ts2);
 struct timespec timespec_sub(struct timespec ts1, struct timespec ts2);
 struct timespec timespec_elapsed(struct timespec start);
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index d863705f6795..f5b460c445be 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -83,12 +83,12 @@ size_t parse_size(const char *size)
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
 
@@ -101,15 +101,15 @@ struct timespec timespec_add_ns(struct timespec ts, int64_t ns)
 
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
 
@@ -123,7 +123,7 @@ struct timespec timespec_elapsed(struct timespec start)
 
 struct timespec timespec_div(struct timespec ts, int divisor)
 {
-	int64_t ns = timespec_to_ns(ts) / divisor;
+	s64 ns = timespec_to_ns(ts) / divisor;
 
 	return timespec_add_ns((struct timespec){0}, ns);
 }
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 2f069ce6a446..ef8d76f71f83 100644
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
index 81f5dea51fc3..802543aa588c 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -379,7 +379,7 @@ static u64 *__vm_get_page_table_entry(struct kvm_vm *vm,
 	 * Check that the vaddr is a sign-extended va_width value.
 	 */
 	TEST_ASSERT(vaddr ==
-		    (((int64_t)vaddr << (64 - va_width) >> (64 - va_width))),
+		    (((s64)vaddr << (64 - va_width) >> (64 - va_width))),
 		    "Canonical check failed.  The virtual address is invalid.");
 
 	for (current_level = mmu->pgtable_levels;
diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index d5161e8aee14..bf62b522d32e 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -1040,7 +1040,7 @@ static bool parse_args(int argc, char *argv[],
 
 struct test_result {
 	struct timespec slot_runtime, guest_runtime, iter_runtime;
-	int64_t slottimens, runtimens;
+	s64 slottimens, runtimens;
 	u64 nloops;
 };
 
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 6379f47af422..d0a41a2bcccb 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -123,7 +123,7 @@ struct st_time {
 	u64 st_time;
 };
 
-static int64_t smccc(uint32_t func, u64 arg)
+static s64 smccc(uint32_t func, u64 arg)
 {
 	struct arm_smccc_res res;
 
@@ -140,7 +140,7 @@ static void check_status(struct st_time *st)
 static void guest_code(int cpu)
 {
 	struct st_time *st;
-	int64_t status;
+	s64 status;
 
 	status = smccc(SMCCC_ARCH_FEATURES, PV_TIME_FEATURES);
 	GUEST_ASSERT_EQ(status, 0);
diff --git a/tools/testing/selftests/kvm/x86/kvm_clock_test.c b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
index 5df0cceec03b..2b8a3feee1f8 100644
--- a/tools/testing/selftests/kvm/x86/kvm_clock_test.c
+++ b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
@@ -18,7 +18,7 @@
 
 struct test_case {
 	u64 kvmclock_base;
-	int64_t realtime_offset;
+	s64 realtime_offset;
 };
 
 static struct test_case test_cases[] = {
diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c
index db0d44b8fbd6..a18b0cfd42e2 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_adjust_test.c
@@ -53,9 +53,9 @@ enum {
 /* The virtual machine object. */
 static struct kvm_vm *vm;
 
-static void check_ia32_tsc_adjust(int64_t max)
+static void check_ia32_tsc_adjust(s64 max)
 {
-	int64_t adjust;
+	s64 adjust;
 
 	adjust = rdmsr(MSR_IA32_TSC_ADJUST);
 	GUEST_SYNC(adjust);
@@ -117,7 +117,7 @@ static void l1_guest_code(void *data)
 	GUEST_DONE();
 }
 
-static void report(int64_t val)
+static void report(s64 val)
 {
 	pr_info("IA32_TSC_ADJUST is %ld (%lld * TSC_ADJUST_VALUE + %lld).\n",
 		val, val / TSC_ADJUST_VALUE, val % TSC_ADJUST_VALUE);
-- 
2.54.0.rc1.555.g9c883467ad-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
