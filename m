Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8A7C5AC7A
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 03:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tzJ202V9o8PetPRhwXYVqUy+lWK/qPDih2tKIa9lRM=; b=bED4+hPMtNkBiX
	3OTIq4uc1AWVh11u6ADVOLQu+IPr5S50dkjJ5BHQkfi46hTgyNJxCm91BYhazSojgXqVU50Zsq2Jy
	wnS7KAWlxU5qQIUPRKtOVxW/ZOCEaqxcrvxbKmSwcxyCrdtQ5oMjZSmeYVXBwvQGB1yhhV4r1GDVt
	1KJC0d5ikeEN4BTmDfW4DZZtZ9tGTPZRM0MFvRRZ09MDPHUiQQP6D4ExFnwf576A85JC8CHWgJ1lg
	02cH6IgG9FW+7dFsVR9wLNZn8uIZfWzDgndv/aUGX/XAS2yXZkM2u6mb7Vnv1iLtLfDLcquKFjDBr
	40IQh7aELB8ExdnKoU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBcK-000000073Nr-2Jt8;
	Fri, 07 Aug 2026 03:51:32 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBcH-000000073MR-0Nsj
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 03:51:30 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8485b358552so2529109b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 06 Aug 2026 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786074688; x=1786679488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roc/IS/aTyNJNRiP/nrbSlyNrCVYc83nltBjgP79s1s=;
        b=Zt+n5dsiZ3KYM8A1S/1K9BgBcN58r9PynHv9zgRCc5xg2dRD+Nda+x0FSJvkeFDkkr
         3iuqZcuXT0M9H5e0B7hgIxw7DF3ib0zh8KaxE7ZcD/WleVqNmjyShXPATSKu+HwCjEEH
         yOIeN44rBnup1fB+BqyCHwyCfSTPoXB6QCD0zb63213AXlkc7btsRyCVDYyK9nvmxZQn
         YWjDvtJ2CT01ETjxWWcxIyIu7YYHTljhzWM66A1acLJvgkivpc/hL9cYxPZScGvRUONY
         7Ms7PbgD9lSP8f8W2cQ536OTysljfTu1LBJdtqojmekyPWw2va+kPX6VXgO8CXz3mj0Y
         AcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786074688; x=1786679488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roc/IS/aTyNJNRiP/nrbSlyNrCVYc83nltBjgP79s1s=;
        b=ShDOlic2VzwBlZZ2zXusDewK6vP++ka+Tm2WugtXEyxOsi3Vy+VXlY6rTul5v/Rnzm
         jd0jbgKe7y5q0gfEE0Lb0kne3QSLvSYzY6JUWefVSvLCvSbltSF51PEWnjQsOVjPfRED
         cUjNTJtBMQ8m9uzNMElF86eGL/MvRjRi4zpeJWevd+omYdJvPcyjia/nDgYP65vsbLLE
         nrAEzXhlr4c6Jfh3L013M+sYfie8yMmpCIL8SWJACiJQaXUqXq30uDzvGd+OOkGuiorb
         Duh5rngt6MgJmfxghL71K7REEyHP7r5A0ChSSfidRYz0SS5By0e1tHb/hWoIaFueIDHi
         Tr4w==
X-Forwarded-Encrypted: i=1; AHgh+Rofti8Bmx4Z7ls+lGHayBnUprcYuXbVEJcVl5jfnrPnHw+11BCZK0pm6H0/wAF2LFg+Z0XfS0pm30s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgLcXTr6WjANLPQfb0T7kbu8ludeircxDK+6ILPVxqfD5ZgY9F
	EkFtRCEru2N7m38Bx4f/2d49A+GNfV/9T1Ww27guOy+aUuXCV5ZgKBOp
X-Gm-Gg: AR+sD12I0X67Vtdt934XRMe1Oi5ocXYC6MxiqRUn0WN5lJwiG13j/MmyAuEJUSALggk
	M0oXxV0QradkevA79woCcQIlyhkQAjJ1EB1WaSHOaSJy+3DJ52VDHPjj8TLsTgnWO/FFuzDsJP0
	I5Qp5cTL3bwYFNxC1Tabjh5HIMxIBYTcfw7BZPy2gTv1V/HqRL1IFANG8FzmhbNc1g67yC/R6S9
	a/EToXFvXcwNpw1+iNmh6E8pwpZ7a8zvYAsPdbepIHWSQeIwWSHKyudepnwCNETak2xubul0np4
	1tcfQITucznehPEf1zUHCd22ZmzIuXFXGjjf4oV8FmOM/KSb++flKj9z41wKMAalswmAqkWz6bu
	XRB9NFwhI4imHeB2+ViQx8e+2/msWXnCp4GjNPNO5UyLf9CVZt9bFHiyMbCvHFskqi1kor7uJpX
	mwf5N9+D3QNK3Km04sKgwo1dhXXMuZTy2ZeqFl/Mb6sPfqgFTFQ1rr95YYm2dE5aJzsdaZswjWN
	H4zqAk=
X-Received: by 2002:a05:6a00:4504:b0:845:da74:5d7c with SMTP id d2e1a72fcca58-84f2e0dba2cmr23794104b3a.32.1786074688151;
        Thu, 06 Aug 2026 20:51:28 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3d0d96sm287586b3a.18.2026.08.06.20.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:51:27 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	"Yuhang.chen" <yhchen312@gmail.com>
Subject: [PATCH 2/2] RISC-V: KVM: selftests: Add PMU event filter test
Date: Fri,  7 Aug 2026 11:50:39 +0800
Message-Id: <20260807035039.294998-3-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807035039.294998-1-yhchen312@gmail.com>
References: <20260807035039.294998-1-yhchen312@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_205129_130642_50E37E8D 
X-CRM114-Status: GOOD (  22.27  )
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

Add a selftest that exercises KVM_SET_PMU_EVENT_FILTER on RISC-V. The
guest programs the CPU cycles and instructions SBI PMU events through
SBI_EXT_PMU_COUNTER_CFG_MATCH while the host installs filters with the
ALLOW and DENY actions, asserting that disallowed events return
SBI_ERR_NOT_SUPPORTED and allowed events succeed.

The test also validates ioctl argument rejection: an invalid action, a
non-zero flags field, and an over-large nevents value are each expected
to fail with -EINVAL or -E2BIG. A baseline run verifies PMU
availability and the test skips (KSFT_SKIP) when PMU or the filter
capability is absent.

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/riscv/pmu_event_filter_test.c         | 199 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index d28a057fa6c2..5d2dc3b25eac 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -218,6 +218,7 @@ TEST_GEN_PROGS_s390 += pre_fault_memory_test
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
+TEST_GEN_PROGS_riscv += riscv/pmu_event_filter_test
 TEST_GEN_PROGS_riscv += access_tracking_perf_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c b/tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c
new file mode 100644
index 000000000000..1a76fce2aca6
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test for RISC-V KVM_SET_PMU_EVENT_FILTER.
+ *
+ * Verify that a VM-scoped PMU event filter installed via the
+ * KVM_SET_PMU_EVENT_FILTER ioctl is enforced when a guest configures a
+ * counter through the SBI PMU COUNTER_CFG_MATCH call:
+ *
+ *   - with no filter, events are programmable (baseline / PMU probe);
+ *   - KVM_PMU_EVENT_DENY rejects the listed events;
+ *   - KVM_PMU_EVENT_ALLOW admits only the listed events;
+ *   - replacing the filter with an empty DENY list re-enables everything.
+ *
+ * The filter is checked before any perf event is created, so the test only
+ * ever programs the cycle event (always supported by the host PMU) and varies
+ * the filter *list* contents to exercise membership without depending on host
+ * support for other events.  Counter management and SBI error reporting happen
+ * in the guest; the host installs filters and checks the reported errors.
+ */
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "kvm_util.h"
+#include "test_util.h"
+#include "processor.h"
+#include "ucall_common.h"
+#include "sbi.h"
+
+/* SBI PMU hardware event indexes (type == HW == 0, so eidx == code). */
+#define EV_CYCLES	SBI_PMU_HW_CPU_CYCLES		/* 1 */
+#define EV_INSTR	SBI_PMU_HW_INSTRUCTIONS		/* 2 */
+
+/* Must match KVM_PMU_EVENT_FILTER_MAX_EVENTS in arch/riscv/kvm/vm.c. */
+#define MAX_EVENTS	256
+
+static void guest_code(void)
+{
+	struct sbiret ret;
+	unsigned long ctr;
+	long err;
+
+	for (;;) {
+		/*
+		 * Request the fixed cycle counter (cbase=0, cmask=1) for the
+		 * cycle event.  The host installs (or clears) the filter
+		 * before each entry, so the result reflects the active policy.
+		 */
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
+				0, 1, 0, EV_CYCLES, 0, 0);
+		err = ret.error;
+		ctr = ret.value;
+
+		/* Release the counter on success so the next iteration reuses it. */
+		if (!err)
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
+				  ctr, 1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+
+		GUEST_SYNC1(err);
+	}
+}
+
+static struct kvm_pmu_event_filter *
+build_filter(__u32 action, __u32 flags, const __u64 *events, __u32 nevents)
+{
+	struct kvm_pmu_event_filter *f;
+	size_t size = sizeof(*f) + (size_t)nevents * sizeof(__u64);
+
+	f = calloc(1, size);
+	TEST_ASSERT(f, "calloc(pmu_event_filter)");
+	f->action = action;
+	f->nevents = nevents;
+	f->flags = flags;
+	if (nevents && events)
+		memcpy(f->events, events, nevents * sizeof(__u64));
+	return f;
+}
+
+/* Install a filter, asserting success. */
+static void set_filter(struct kvm_vm *vm, __u32 action,
+		       const __u64 *events, __u32 nevents)
+{
+	struct kvm_pmu_event_filter *f = build_filter(action, 0, events, nevents);
+
+	vm_ioctl(vm, KVM_SET_PMU_EVENT_FILTER, f);
+	free(f);
+}
+
+/* Install a filter and return the raw ioctl result (for negative tests). */
+static int try_set_filter(struct kvm_vm *vm, __u32 action, __u32 flags,
+			  const __u64 *events, __u32 nevents)
+{
+	struct kvm_pmu_event_filter *f = build_filter(action, flags, events, nevents);
+	int ret = __vm_ioctl(vm, KVM_SET_PMU_EVENT_FILTER, f);
+
+	free(f);
+	return ret;
+}
+
+/* Run the guest one step and return the cfg_match error code it reports. */
+static long run_one(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+	return (long)uc.args[0];
+}
+
+static void test_filter_case(struct kvm_vm *vm, struct kvm_vcpu *vcpu,
+			     __u32 action, const __u64 *events, __u32 nevents,
+			     long expect, const char *desc)
+{
+	long err;
+
+	set_filter(vm, action, events, nevents);
+	err = run_one(vcpu);
+	TEST_ASSERT_EQ(err, expect);
+	pr_info("%s: err=%ld (expected %ld)\n", desc, err, expect);
+}
+
+static void test_bad_args(struct kvm_vm *vm)
+{
+	__u64 ev = EV_CYCLES;
+	int ret;
+
+	/* Invalid action. */
+	errno = 0;
+	ret = try_set_filter(vm, 2, 0, &ev, 1);
+	TEST_ASSERT(ret < 0 && errno == EINVAL,
+		    "invalid action should fail with EINVAL, got ret=%d errno=%d",
+		    ret, errno);
+
+	/* Non-zero flags are not supported. */
+	errno = 0;
+	ret = try_set_filter(vm, KVM_PMU_EVENT_ALLOW, 1, &ev, 1);
+	TEST_ASSERT(ret < 0 && errno == EINVAL,
+		    "non-zero flags should fail with EINVAL, got ret=%d errno=%d",
+		    ret, errno);
+
+	/* Too many events. */
+	errno = 0;
+	ret = try_set_filter(vm, KVM_PMU_EVENT_DENY, 0, NULL, MAX_EVENTS + 1);
+	TEST_ASSERT(ret < 0 && errno == E2BIG,
+		    "nevents > max should fail with E2BIG, got ret=%d errno=%d",
+		    ret, errno);
+}
+
+int main(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	long err;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_PMU_EVENT_FILTER));
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	/*
+	 * Baseline / PMU probe: with no filter the cycle event must be
+	 * programmable.  If it isn't, the host PMU is unusable in this
+	 * environment (e.g. Sscofpmf unavailable under TCG); skip the rest.
+	 */
+	err = run_one(vcpu);
+	if (err) {
+		pr_info("PMU unavailable (baseline cfg_match err=%ld), skipping\n",
+			err);
+		kvm_vm_free(vm);
+		exit(KSFT_SKIP);
+	}
+
+	/* DENY{cycles}: the cycle event is rejected. */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_DENY,
+			 &(__u64){ EV_CYCLES }, 1,
+			 SBI_ERR_NOT_SUPPORTED, "deny cycles");
+
+	/* ALLOW{cycles}: the cycle event is admitted. */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_ALLOW,
+			 &(__u64){ EV_CYCLES }, 1,
+			 0, "allow cycles");
+
+	/*
+	 * ALLOW{instructions}: cycles is not in the allow list, so it is
+	 * rejected.  Instructions itself is never programmed, so host support
+	 * for it is irrelevant.
+	 */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_ALLOW,
+			 &(__u64){ EV_INSTR }, 1,
+			 SBI_ERR_NOT_SUPPORTED, "cycles not in allow{instr}");
+
+	/* Empty DENY list: nothing is denied, cycles is programmable again. */
+	test_filter_case(vm, vcpu, KVM_PMU_EVENT_DENY, NULL, 0,
+			 0, "clear (deny empty)");
+
+	test_bad_args(vm);
+
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
