Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED77E7719A
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 04:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGkEiLUqnDMl7eqhoMs/er+7XhX0KmiD4hXy8P2thvo=; b=PkM17zUkhywDHr
	70YO2XylGbqlei0oCfnOj9tW9BfBKtDl7g0SM+60Ntc3rE2er8k9r1rAkNzJu1GfXc0rpy0PtM3FR
	IBEGtoQ/csMDyJ/WIr4UsytotV/AUPMS0qsruDuZ0R36DalxNj5CZXiY9OTvC+dH8j/v8IWadTA0s
	WERMiwQmDs2ZFBE8+/0Tk5I6sR8KlBNTmz3JxhLTW+N/JNEXT69kJXjLBr0st3FpVAlZ7XolnXI1I
	ez+7kZqJd6O9QjMxSQF47esuUW788HordfxmIzJujUmtgpfxpTA1R7M5YVpkOx2NZeQlKBEA2nZCR
	rvSy6xOC/E1U+x+4B/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWTFp-00000000AIf-1kZs;
	Sat, 11 Jan 2025 04:37:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiW-0000000HQQG-46bx
	for kvm-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wbJUIEbFpcT4LmqIjAYiV2s86GObQLOrAwx+1Pf2g7A=; b=csgnvTl2NpXQUEOiVKURkC6Fyr
	2N+47ZBzHLA/rI/tUQQ+Qdcf0jrJstvuLheBRo3AKD/dLflAPSKDPjZvhmGv54ZbGvMYm5ML7Tjfb
	UoFifVKiEb7nYudI1s+g/CrbwnnGtPwGknx4AFzuunrbWWW34Nc0XmApmTosRO0TGo8O8S3Js8G5f
	lg6yDBMQ0Ntl60mtIkd7mPBEA7vVhTOXWa8o0k4lKPCWvOP3ZtclW4uQk9zhfjumGl9qcv7VSPGu+
	kzCa4/RjIHmtTQcsRCrXl3v5DqYzwrJUmMqNK1Zt+wRyUzGl6cXM1dLc+Ax3fpwZSOeJuh6istTGW
	ijIyXgFw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiT-00000009yOr-26HD
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:07 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso4644123a91.0
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556663; x=1737161463; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wbJUIEbFpcT4LmqIjAYiV2s86GObQLOrAwx+1Pf2g7A=;
        b=FfssiFP0BcRe15VL0ylY8Fdny/41w6R6TdoZsXD6hyL8GOsIeAIGTLrFFQpwbYxOWZ
         9o9Zp/2kjNxAqnJGjm5VCim+5fsEnyKHGbM0NwXKNt/OPIyt6JoAOc2VBZBlg7x6ZDrG
         qy3XmKTO4XA+8aAeYLThlUeCpWcMIovo7BXlAq3D2s5eyuS23FTpQZ6VLHajShhm+O06
         t5hk+ZkfRqgw8T+Mom1kv6Xv5F1/AcDsVjTtSnWT4PGOyO0Z7X/TSckC+Irdq5XzIuKq
         Sjb2cLTYMZ1GWc7vN9Cf+jE43YuxMLhkT4mPsmusqOMgYvORs29JPUOnymwsNBk17zUJ
         a3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556663; x=1737161463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbJUIEbFpcT4LmqIjAYiV2s86GObQLOrAwx+1Pf2g7A=;
        b=kApeyVdU9WZ5tR7mMOFFIiNHde+dK4dI8DFcyHN0k55nEH9eBg++aHR17S/sfPcLU2
         OsvmEdwsEDf7KpHRppwV8zl34L/G1XLt9UcS3njfcTri34vaJLetWrKtVJpQzeZtdwdl
         U4i14frAP3+DjDKY8CGN81KV7HRQykp9iH4/6qa6QqMrLD50HJtike14BDEFBqmH0boV
         l87rUxGSDKHia38t0d3bT9fKy1ceI+8xpU9k3TeXGl4YrGYyyrttmHJe3knkR02VHW1C
         6lKyN7vYKlUu8fOv6yHY5xj/Mfr/PsavVEsNYSe3LTvyPeHwcJUtePxCRK5nTH6jA+P7
         NkVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2l7Kzs3aRZFju9Fa5NBQNY+sZbGHdipSqYnDVjLGndac+dYkoNgvo5mC13NP9959MG/WTabcG1ME=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz97O85PW+ZwLXDODp43DQaitL5i4Yepw7GO6mm/THMXQV26TOO
	aOxaeSSZOebig1miI7pagCLG5oVzH6xxVXn7CkRo2qSE5hXaGIP7EaSmlIM/P3k89tqFBaUa5yf
	v9w==
X-Google-Smtp-Source: AGHT+IGH6342S92kOvdYD94+ymoteQzN/cfHIZ0hJZS0WFG0jyjicN3k4eAbOT3Lbu+t8kUVV+/QXmvVvSI=
X-Received: from pjboi12.prod.google.com ([2002:a17:90b:3a0c:b0:2eb:12c1:bf8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:270c:b0:2ee:6e22:bfd0
 with SMTP id 98e67ed59e1d1-2f548ee48demr16948021a91.21.1736556663692; Fri, 10
 Jan 2025 16:51:03 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:47 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-8-seanjc@google.com>
Subject: [PATCH v2 7/9] KVM: selftests: Adjust number of files rlimit for all
 "standard" VMs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_005105_721719_14CE4A19 
X-CRM114-Status: GOOD (  14.95  )
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

Move the max vCPUs test's RLIMIT_NOFILE adjustments to common code, and
use the new helper to adjust the resource limit for non-barebones VMs by
default.  x86's recalc_apic_map_test creates 512 vCPUs, and a future
change will open the binary stats fd for all vCPUs, which will put the
recalc APIC test above some distros' default limit of 1024.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 ++
 .../selftests/kvm/kvm_create_max_vcpus.c      | 28 +--------------
 tools/testing/selftests/kvm/lib/kvm_util.c    | 34 +++++++++++++++++++
 3 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 9a64bab42f89..d4670b5962ab 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -966,6 +966,8 @@ static inline struct kvm_vm *vm_create_shape_with_one_vcpu(struct vm_shape shape
 
 struct kvm_vcpu *vm_recreate_with_one_vcpu(struct kvm_vm *vm);
 
+void kvm_set_files_rlimit(uint32_t nr_vcpus);
+
 void kvm_pin_this_task_to_pcpu(uint32_t pcpu);
 void kvm_print_vcpu_pinning_help(void);
 void kvm_parse_vcpu_pinning(const char *pcpus_string, uint32_t vcpu_to_pcpu[],
diff --git a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
index c78f34699f73..c5310736ed06 100644
--- a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
+++ b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
@@ -10,7 +10,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/resource.h>
 
 #include "test_util.h"
 
@@ -39,36 +38,11 @@ int main(int argc, char *argv[])
 {
 	int kvm_max_vcpu_id = kvm_check_cap(KVM_CAP_MAX_VCPU_ID);
 	int kvm_max_vcpus = kvm_check_cap(KVM_CAP_MAX_VCPUS);
-	/*
-	 * Number of file descriptors reqired, KVM_CAP_MAX_VCPUS for vCPU fds +
-	 * an arbitrary number for everything else.
-	 */
-	int nr_fds_wanted = kvm_max_vcpus + 100;
-	struct rlimit rl;
 
 	pr_info("KVM_CAP_MAX_VCPU_ID: %d\n", kvm_max_vcpu_id);
 	pr_info("KVM_CAP_MAX_VCPUS: %d\n", kvm_max_vcpus);
 
-	/*
-	 * Check that we're allowed to open nr_fds_wanted file descriptors and
-	 * try raising the limits if needed.
-	 */
-	TEST_ASSERT(!getrlimit(RLIMIT_NOFILE, &rl), "getrlimit() failed!");
-
-	if (rl.rlim_cur < nr_fds_wanted) {
-		rl.rlim_cur = nr_fds_wanted;
-		if (rl.rlim_max < nr_fds_wanted) {
-			int old_rlim_max = rl.rlim_max;
-			rl.rlim_max = nr_fds_wanted;
-
-			int r = setrlimit(RLIMIT_NOFILE, &rl);
-			__TEST_REQUIRE(r >= 0,
-				       "RLIMIT_NOFILE hard limit is too low (%d, wanted %d)",
-				       old_rlim_max, nr_fds_wanted);
-		} else {
-			TEST_ASSERT(!setrlimit(RLIMIT_NOFILE, &rl), "setrlimit() failed!");
-		}
-	}
+	kvm_set_files_rlimit(kvm_max_vcpus);
 
 	/*
 	 * Upstream KVM prior to 4.8 does not support KVM_CAP_MAX_VCPU_ID.
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 16ee03e76d66..f49bb504fa72 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -12,6 +12,7 @@
 #include <assert.h>
 #include <sched.h>
 #include <sys/mman.h>
+#include <sys/resource.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
@@ -411,6 +412,37 @@ static uint64_t vm_nr_pages_required(enum vm_guest_mode mode,
 	return vm_adjust_num_guest_pages(mode, nr_pages);
 }
 
+void kvm_set_files_rlimit(uint32_t nr_vcpus)
+{
+	/*
+	 * Number of file descriptors required, nr_vpucs vCPU fds + an arbitrary
+	 * number for everything else.
+	 */
+	int nr_fds_wanted = nr_vcpus + 100;
+	struct rlimit rl;
+
+	/*
+	 * Check that we're allowed to open nr_fds_wanted file descriptors and
+	 * try raising the limits if needed.
+	 */
+	TEST_ASSERT(!getrlimit(RLIMIT_NOFILE, &rl), "getrlimit() failed!");
+
+	if (rl.rlim_cur < nr_fds_wanted) {
+		rl.rlim_cur = nr_fds_wanted;
+		if (rl.rlim_max < nr_fds_wanted) {
+			int old_rlim_max = rl.rlim_max;
+
+			rl.rlim_max = nr_fds_wanted;
+			__TEST_REQUIRE(setrlimit(RLIMIT_NOFILE, &rl) >= 0,
+				       "RLIMIT_NOFILE hard limit is too low (%d, wanted %d)",
+				       old_rlim_max, nr_fds_wanted);
+		} else {
+			TEST_ASSERT(!setrlimit(RLIMIT_NOFILE, &rl), "setrlimit() failed!");
+		}
+	}
+
+}
+
 struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_vcpus,
 			   uint64_t nr_extra_pages)
 {
@@ -420,6 +452,8 @@ struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_vcpus,
 	struct kvm_vm *vm;
 	int i;
 
+	kvm_set_files_rlimit(nr_runnable_vcpus);
+
 	pr_debug("%s: mode='%s' type='%d', pages='%ld'\n", __func__,
 		 vm_guest_mode_string(shape.mode), shape.type, nr_pages);
 
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
