Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D933606A31E
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sEcpujTl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWgi8/bd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9tr/h5Kk6iYoL507upoJyPzRZYCwM7SCHkHCzGRHoOM=; b=sEcpujTlFUHCHKb8MIgsISV8Jt
	QJGDk+x32mYSerony9CAEZX0QAx8slpgEFQBnXeFrRCOt9ZjbmHiC8aCLGWLYxeCR9+z1wlA+fmB0
	JInuUXRt7AR9iWrtDrB42Yp7lGYyKN4qb5lwpihbmUaFoDPlXJmHV0M+ah+A6Ih9p6qGF6I0Tvw1R
	w/3ETeFG7GlGha/5bayPK4qY1RplJ4pdRAAi/5uo1/cMzjO+u8LUD3SsARRejy7o3h5EvVj++Fs3h
	OxJI9v9/gWJjmrly+lbZOpusUdKx9jQqlP4sjEcR99pmcmey5RBOqUEEY+DFQ+17jtHZAc2w3xux2
	fImcVraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhI2-00000005RrK-1ENA;
	Tue, 24 Nov 2026 03:33:54 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHw-00000005RmR-0cFG
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:33:49 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2f0c72f9a1fso50525ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491227; x=1796096027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aG4MNfkbYBkCJSsJvADe/q3LoG/+w55119ipXSrHN0=;
        b=XWgi8/bd3lV0+t/KHi165SM/Andcy1vne7iUDJn9LpnnRaUJEU/do1O87sznVP7zL9
         /NeKTA1uYhArNpZ3uK1Q76zhKogv5E7U24lpJ/2bH7hyACm5cAAYdcx+Uhj+KjD4jWv/
         t7n5EydtVN5auetE8qKzt2VV5aWDRdii47kxbpkqtHpHVGkxyk13k0DEglgup1vpwckd
         wuoqdBia+lVyHshVIVrMVmcOtonwyTPYxjjJXGtNTjus/a9EnFwpzkn6nwg92ZclGXMx
         1+QhxxTL058xBNkepCXQ+IhuuZ3dOWFzAQLh+I/OsDBvoWQ2s70Cy/Ww4gjhoGRn/E1L
         GWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491227; x=1796096027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aG4MNfkbYBkCJSsJvADe/q3LoG/+w55119ipXSrHN0=;
        b=aCU3WTEUv+kt5T4whf3Q2/XeaesNhgvzi46LIQdN2B637BFqqfEkBQcTPddT89OI3i
         0LRKly3RUGiRM+dzHyQYx44Xcs0F8ulIrjzeXfGR3nbiTRpsUnburmSdIYNxFYxSQ4dN
         NUaXcxOkDTOVDfg5fMeqyuI5ykK782c+WJKMYECE9CpUI86LaxjMpwpqmEBaPtoLeSgt
         85DccBJirRojpw2u4KFbcX7XEf5uP/zdGE8BSTqGUQYEfm2XQ0qh+Ka8ZPb0Pm7X1Ze5
         AgnhXiFWmnFgTUiXcq9UBJdTObgwv3TZuHP7hFCfqZHTf51vQ+Jv5T42g/TsXY5DhXsk
         d9EA==
X-Forwarded-Encrypted: i=1; AL+hErF8imBHrVePIYJVQflcZ5/aQR57wEbgzVngXm63Z8Rx9jjk9+CcwMe8bAKoyTJ/KGMwpKGDmFsS+as=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ecCfW5lSlo1rxgK2GHn0gHvJoHlGKMFGjEwgzeffPBaThYldV
	NU8HeN8SFZfPjB4vm08E3C7T19z+3in2YDaHs2NlXO6iMeMbe9o5T8mq
X-Gm-Gg: AZFdTZed+KjS5yxDTnyUjdsp32WaklEvD4YqvpOiw8NzNQKvzCgtCE8eFPxNjC/hDmt
	WOJdZPd55ePOO6/1IWvWywj/9P8vgkGS5xpgmX0rHP2+K5MAkRUUcuqrJYIHzwP/fC86hsrgogF
	a/Lj7VllFx2l8yY0knnbWWNalkL83v08Cc7kPgKWucDLvgT/bVXlWpqxJiSf5x07q5taSIm3QmV
	bEQxxWVJkZmdp44942JEt8g5KHBjPK34bZ3hHlXRI9/nUjJLtmYoZ7eJozGtHbZfOLUhSR7Rw9N
	untR5mOoaNxZqhNeIE+wIdzkZoYowGkHRfeOkcBNTPjCPud5iuTymPiizyckTOZAHyDj8KwOu4H
	eaKugvce7TErCsGjC3cQRJ6t+23fnIS6EqNXU6QkoG3VPdhZ0P0qGDHBA3Rcz32YX9RU5ufHk3x
	lHO8Fw+g6SmLzcHf+n2vzX5nvMZToy+gasnoeV9xryDgzN9Ss1CiXqXmoBavW1/RLt0vEYf0pQG
	1Q5qszeknyhS9HGU1sBxZNAtCjFh7mXLkt+jRGsLdUikT/xy+vcKrFQ2HB1V36a282907eLHlME
	YC1Jiq3wRhlhFzB3xh1NJc4KQ48BICBxn74ipgmtNQ==
X-Received: by 2002:a05:6300:218b:b0:3f8:f0b1:e7c0 with SMTP id adf61e73a8af0-4014da5fc3emr12855841637.59.1795491227174;
        Mon, 23 Nov 2026 19:33:47 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6495773b3a.3.2026.11.23.19.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:46 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: selftests: Test steal-time dirty logging and RISC-V STA transitions
Date: Tue, 24 Nov 2026 11:33:28 +0800
Message-Id: <20261124033328.612894-3-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124033328.612894-1-shanbeeyoo@gmail.com>
References: <20261124033328.612894-1-shanbeeyoo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193348_212330_4B6DD60D 
X-CRM114-Status: GOOD (  22.40  )
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM writes to a guest steal-time structure must be recorded in the guest
RAM dirty log. Enable dirty logging on the shared-area memslot in the
common per-vCPU test path, clear initialization dirty bits after the
first run, and force runnable scheduling delay before checking that the
subsequent accounting write marks the expected page dirty.

On RISC-V, additionally exercise three SBI STA transitions: disabling an
active shared area, re-enabling the same area, and replacing an active
registration directly with a new area at the end of a second host page.
Clear the dirty log after each transition, arrange runnable contention on
the pinned CPU with a bounded monotonic timeout, and compare sequence and
stolen time against a stopped-vCPU snapshot so valid zero-increment skips
are permitted. After active replacement, verify that the old page remains
both unchanged and clean.

Use per-architecture hooks for protocol-specific lifecycle cases instead of
adding #ifdefs in main(). These SBI enable/disable operations match those
used by the Linux RISC-V guest CPU online and CPU-down callbacks, while the
selftest exercises the SBI protocol directly rather than booting Linux.
Drop the v1 MADV_DONTNEED check, which discarded guest page contents and
did not model migration.

Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
Changes in v2:
- Move accounting dirty-log checks into the common per-vCPU loop and
  remove the added #ifdefs from main().
- Test RISC-V disable, re-enable of the same area, and direct active
  replacement separately; drop the v1 MADV_DONTNEED case.
- Isolate registration dirty bits with kvm_vm_get_dirty_log() and arrange
  bounded runnable contention instead of assuming unconditional updates.
- Align the two-page region and boundary offset to getpagesize().

 tools/testing/selftests/kvm/steal_time.c | 233 ++++++++++++++++++++---
 1 file changed, 206 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 82b94a82d..276eb03a6 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -8,6 +8,7 @@
 #include <time.h>
 #include <sched.h>
 #include <pthread.h>
+#include <linux/bitmap.h>
 #include <linux/kernel.h>
 #include <asm/kvm.h>
 #ifdef __riscv
@@ -29,11 +30,17 @@ static u64 guest_stolen_time[NR_VCPUS];
 
 static struct kvm_vm *vm_create_steal_time(u32 nr_vcpus, void *guest_code,
 					   struct kvm_vcpu *vcpus[]);
+static long force_steal_time(void);
 
 #if defined(__x86_64__)
 
 /* steal_time must have 64-byte alignment */
 #define STEAL_TIME_SIZE		((sizeof(struct kvm_steal_time) + 63) & ~63)
+#define NR_LIFECYCLE_TESTS	0
+
+static void check_steal_time_lifecycle(void)
+{
+}
 
 static void check_status(struct kvm_steal_time *st)
 {
@@ -115,6 +122,11 @@ static void check_steal_time_uapi(void)
 
 /* PV_TIME_ST must have 64-byte alignment */
 #define STEAL_TIME_SIZE		((sizeof(struct st_time) + 63) & ~63)
+#define NR_LIFECYCLE_TESTS	0
+
+static void check_steal_time_lifecycle(void)
+{
+}
 
 #define SMCCC_ARCH_FEATURES	0x80000001
 #define PV_TIME_FEATURES	0xc5000020
@@ -239,6 +251,7 @@ static void check_steal_time_uapi(void)
 
 /* SBI STA shmem must have 64-byte alignment */
 #define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
+#define NR_LIFECYCLE_TESTS	3
 
 static gpa_t st_gpa[NR_VCPUS];
 
@@ -329,6 +342,129 @@ static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
 	pr_info("\n");
 }
 
+static gpa_t lifecycle_second_gpa;
+
+static void sta_lifecycle_guest(void)
+{
+	sta_set_shmem(ST_GPA_BASE, 0);
+	GUEST_SYNC(0);
+	GUEST_SYNC(1);
+
+	sta_set_shmem(INVALID_GPA, 0);
+	GUEST_SYNC(2);
+	GUEST_SYNC(3);
+
+	/* Re-enable the same area, as the guest CPU online callback does. */
+	sta_set_shmem(ST_GPA_BASE, 0);
+	GUEST_SYNC(4);
+	GUEST_SYNC(5);
+
+	/* Replace the active registration without disabling it first. */
+	sta_set_shmem(lifecycle_second_gpa, 0);
+	GUEST_SYNC(6);
+	GUEST_SYNC(7);
+	sta_set_shmem(INVALID_GPA, 0);
+	GUEST_DONE();
+}
+
+static void sta_lifecycle_run(struct kvm_vcpu *vcpu, unsigned int stage)
+{
+	struct ucall uc;
+
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_SYNC:
+		TEST_ASSERT_EQ(uc.args[1], stage);
+		break;
+	case UCALL_DONE:
+		TEST_ASSERT_EQ(stage, 8);
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+	default:
+		TEST_FAIL("Unexpected STA lifecycle exit at stage %u", stage);
+	}
+}
+
+static void check_sta_page(struct sta_struct *st, struct sta_struct *before)
+{
+	TEST_ASSERT(st->sequence != before->sequence && !(st->sequence & 1),
+		    "Expected a completed STA update, sequence=%u", st->sequence);
+	TEST_ASSERT(st->steal > before->steal, "STA stolen time did not advance");
+	TEST_ASSERT_EQ(st->flags, 0);
+	TEST_ASSERT_EQ(st->preempted, 0);
+}
+
+static void check_steal_time_lifecycle(void)
+{
+	struct sta_struct snapshot, before, *first, *second;
+	size_t host_page_size = getpagesize();
+	unsigned long dirty = 0;
+	unsigned int gpages;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, sta_lifecycle_guest);
+	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, 2 * host_page_size);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    1, gpages, KVM_MEM_LOG_DIRTY_PAGES);
+	/* Also exercise an STA structure ending at a host page boundary. */
+	WRITE_AND_SYNC_TO_GUEST(vm, lifecycle_second_gpa,
+				ST_GPA_BASE + 2 * host_page_size - sizeof(struct sta_struct));
+	first = addr_gpa2hva(vm, ST_GPA_BASE);
+	second = addr_gpa2hva(vm, lifecycle_second_gpa);
+
+	/* Establish active updates on the first page before testing disable. */
+	sta_lifecycle_run(vcpu, 0);
+	before = *first;
+	/* Registration writes zeroes and dirties the page independently. */
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	force_steal_time();
+	sta_lifecycle_run(vcpu, 1);
+	check_sta_page(first, &before);
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT_EQ(dirty, BIT(0));
+
+	sta_lifecycle_run(vcpu, 2);
+	snapshot = *first;
+	/* Entry before the disable call may have updated the old area. */
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	force_steal_time();
+	sta_lifecycle_run(vcpu, 3);
+	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
+		    "Disabled STA shared page was modified");
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT_EQ(dirty, 0);
+	ksft_test_result_pass("STA disable stops shared page updates\n");
+
+	sta_lifecycle_run(vcpu, 4);
+	before = *first;
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	force_steal_time();
+	sta_lifecycle_run(vcpu, 5);
+	check_sta_page(first, &before);
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT_EQ(dirty, BIT(0));
+	ksft_test_result_pass("STA re-enable resumes shared page updates\n");
+
+	sta_lifecycle_run(vcpu, 6);
+	/* Snapshot after the last entry that could still update the old area. */
+	snapshot = *first;
+	before = *second;
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	force_steal_time();
+	sta_lifecycle_run(vcpu, 7);
+	check_sta_page(second, &before);
+	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
+		    "Old STA shared page was modified after replacement");
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT_EQ(dirty, BIT(1));
+	ksft_test_result_pass("STA active replacement updates only the new page\n");
+
+	sta_lifecycle_run(vcpu, 8);
+	kvm_vm_free(vm);
+}
+
 static void check_steal_time_uapi(void)
 {
 	struct kvm_vm *vm;
@@ -368,8 +504,13 @@ static void check_steal_time_uapi(void)
 
 /* steal_time must have 64-byte alignment */
 #define STEAL_TIME_SIZE		((sizeof(struct kvm_steal_time) + 63) & ~63)
+#define NR_LIFECYCLE_TESTS	0
 #define KVM_STEAL_PHYS_VALID	BIT_ULL(0)
 
+static void check_steal_time_lifecycle(void)
+{
+}
+
 struct kvm_steal_time {
 	__u64 steal;
 	__u32 version;
@@ -466,22 +607,58 @@ static void check_steal_time_uapi(void)
 }
 #endif
 
+struct steal_time_worker {
+	bool stop;
+	struct timespec deadline;
+};
+
 static void *do_steal_time(void *arg)
 {
-	struct timespec ts, stop;
+	struct steal_time_worker *worker = arg;
+	struct timespec ts;
 
-	clock_gettime(CLOCK_MONOTONIC, &ts);
-	stop = timespec_add_ns(ts, MIN_RUN_DELAY_NS);
-
-	while (1) {
+	while (!READ_ONCE(worker->stop)) {
 		clock_gettime(CLOCK_MONOTONIC, &ts);
-		if (timespec_to_ns(timespec_sub(ts, stop)) >= 0)
+		if (timespec_to_ns(timespec_sub(ts, worker->deadline)) >= 0)
 			break;
 	}
 
 	return NULL;
 }
 
+/* The caller is pinned; its worker inherits the same CPU affinity. */
+static long force_steal_time(void)
+{
+	struct steal_time_worker worker = {};
+	struct timespec ts;
+	pthread_t thread;
+	cpu_set_t cpuset;
+	long start, delay;
+	int cpu = sched_getcpu();
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	worker.deadline = timespec_add_ns(ts, 5 * NSEC_PER_SEC);
+	start = get_run_delay();
+	kvm_pthread_create(&thread, NULL, do_steal_time, &worker);
+	kvm_pthread_getaffinity(thread, &cpuset);
+	TEST_ASSERT(CPU_COUNT(&cpuset) == 1 && CPU_ISSET(cpu, &cpuset),
+		    "Worker failed to inherit parent's CPU affinity");
+
+	do {
+		sched_yield();
+		delay = get_run_delay() - start;
+		clock_gettime(CLOCK_MONOTONIC, &ts);
+	} while (delay < MIN_RUN_DELAY_NS &&
+		 timespec_to_ns(timespec_sub(ts, worker.deadline)) < 0);
+
+	WRITE_ONCE(worker.stop, true);
+	kvm_pthread_join(thread, NULL);
+	TEST_ASSERT(delay >= MIN_RUN_DELAY_NS,
+		    "Timed out waiting for runnable delay: expected >= %lu ns, got %ld",
+		    MIN_RUN_DELAY_NS, delay);
+	return delay;
+}
+
 static void run_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct ucall uc;
@@ -509,7 +686,8 @@ static struct kvm_vm *vm_create_steal_time(u32 nr_vcpus, void *guest_code,
 	/* Create a VM and an identity mapped memslot for the steal time structure */
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
 	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE * nr_vcpus);
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    1, gpages, KVM_MEM_LOG_DIRTY_PAGES);
 	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, gpages);
 
 	return vm;
@@ -518,26 +696,31 @@ static struct kvm_vm *vm_create_steal_time(u32 nr_vcpus, void *guest_code,
 int main(int ac, char **av)
 {
 	struct kvm_vcpu *vcpus[NR_VCPUS];
+	unsigned long *dirty_log;
+	unsigned int dirty_npages, page;
 	struct kvm_vm *vm;
-	pthread_t thread;
-	cpu_set_t cpuset;
 	long stolen_time;
 	long run_delay;
 	bool verbose;
-	int i, cpu;
+	int i;
 
 	verbose = ac > 1 && (!strncmp(av[1], "-v", 3) || !strncmp(av[1], "--verbose", 10));
 
 	/* Set CPU affinity so we can force preemption of the VCPU */
-	cpu = pin_self_to_any_cpu();
+	pin_self_to_any_cpu();
 
 	vm = vm_create_steal_time(NR_VCPUS, guest_code, vcpus);
 
 	ksft_print_header();
 	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
-	ksft_set_plan(NR_VCPUS);
+	TEST_REQUIRE(!access("/proc/self/schedstat", R_OK));
+	ksft_set_plan(2 * NR_VCPUS + NR_LIFECYCLE_TESTS);
+	dirty_npages = memslot2region(vm, 1)->region.memory_size / getpagesize();
+	dirty_log = bitmap_zalloc(dirty_npages);
+	TEST_ASSERT(dirty_log, "Failed to allocate dirty log");
 
 	check_steal_time_uapi();
+	check_steal_time_lifecycle();
 
 	/* Run test on each VCPU */
 	for (i = 0; i < NR_VCPUS; ++i) {
@@ -547,30 +730,24 @@ int main(int ac, char **av)
 
 		/* First VCPU run initializes steal-time */
 		run_vcpu(vcpus[i]);
+		/* Exclude initialization writes from the accounting dirty log. */
+		kvm_vm_get_dirty_log(vm, 1, dirty_log);
+		force_steal_time();
 
 		/* Second VCPU run, expect guest stolen time to be <= run_delay */
 		run_vcpu(vcpus[i]);
+		kvm_vm_get_dirty_log(vm, 1, dirty_log);
+		for (page = 0; page < dirty_npages; page++)
+			TEST_ASSERT_EQ(!!test_bit(page, dirty_log),
+				       page == i * STEAL_TIME_SIZE / getpagesize());
+		ksft_test_result_pass("vcpu%d shared page update is marked dirty\n", i);
 		stolen_time = SYNC_FROM_GUEST_AND_READ(vm, guest_stolen_time[i]);
 		run_delay = get_run_delay();
 		TEST_ASSERT(stolen_time <= run_delay,
 			    "Expected stolen time <= %ld, got %ld",
 			    run_delay, stolen_time);
 
-		/* Steal time from the VCPU. The steal time thread has the same CPU affinity as the VCPUs. */
-		run_delay = get_run_delay();
-		kvm_pthread_create(&thread, NULL, do_steal_time, NULL);
-		kvm_pthread_getaffinity(thread, &cpuset);
-		TEST_ASSERT(CPU_COUNT(&cpuset) == 1 && CPU_ISSET(cpu, &cpuset),
-			    "Worker failed to inherit parent's CPU affinity");
-
-		do
-			sched_yield();
-		while (get_run_delay() - run_delay < MIN_RUN_DELAY_NS);
-		kvm_pthread_join(thread, NULL);
-		run_delay = get_run_delay() - run_delay;
-		TEST_ASSERT(run_delay >= MIN_RUN_DELAY_NS,
-			    "Expected run_delay >= %ld, got %ld",
-			    MIN_RUN_DELAY_NS, run_delay);
+		run_delay = force_steal_time();
 
 		/* Run VCPU again to confirm stolen time is consistent with run_delay */
 		run_vcpu(vcpus[i]);
@@ -588,6 +765,8 @@ int main(int ac, char **av)
 		}
 		ksft_test_result_pass("vcpu%d\n", i);
 	}
+	free(dirty_log);
+	kvm_vm_free(vm);
 
 	/* Print results and exit() accordingly */
 	ksft_finished();
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
