Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0829DC4451C
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6EhSiwDFuaoWBDkR5HUYpXGcIxUYxDzesbZpQCo5dsg=; b=qWsmLopSC7WgcF
	SJkdId8YJWqZyLtSiMwq9uAKvDYup2XbTlOpu+2YcXLIECc6e29DzEk60OxQ5EBSsc8VjfGJ3EZ4c
	R16avthm4fbVcBPxLBu2neIkrsuSLGdNNsGKR91IcR4Es9BYtwD1R3MZOE6CGOHPQLeuLyjDUUH0i
	hD10aksHy9G/bRvmrvNeBGYIchY1Rvw+pLiYKNy7ciGn/8qnwneeCJ5T2yHoUQrDnM97N/okSShDp
	BhJKymMUgVRcSQ4xRNFB9hLDRJmNQYjXMI1sORQ5WlJ/LxnDoDe8YVkdL+cEa7TxI5PmrwphFc3O9
	04FuYO7YTxEKaaw7GncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklR7-00000002jwa-1LSf;
	Fri, 17 Jul 2026 16:29:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklR3-00000002jvt-3tHO
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 16:29:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so4555744a12.2
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Jul 2026 09:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784305753; x=1784910553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DEr5HrFCxcvmv99sNHbFWPBTdDmCHwXF9XTon2pDmFY=;
        b=KO09+BIwmHTUWxh66ckJpXqlAWQC+SjJm64qbziA3DX+yemlYLr24PTOBeobk/H7wR
         eWvETMr5zE8WsJI6glzAaZ0Ulo1QiIFsLSP38KSLxWlLSpiba8m7+kuGISC62Vmq15bt
         BKLtZAdYs4YuMPKx+2OF8uZHiWGxQEJD/GR+M1UySHtJN80PrMY5Y1zdz5pAQQeomoqB
         wQJRieKQcC6btkwLD4ji9DpWxrNuAjANnevqtYexVJ3JmuSB43oCN6piCgXSFEKIz10g
         F/TCK4VWnM6jLwCBwhCbmM3qaUx7iKP8hPcZdUxBTmbs3CCt2suK1Nnwi+ItUxuIcYe3
         U1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784305753; x=1784910553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEr5HrFCxcvmv99sNHbFWPBTdDmCHwXF9XTon2pDmFY=;
        b=Pt6y+EuCcq7EOyBGxoWScQGHCKsbfkNhDwq48u+YgE+pUWSCKsFUTakX85pF1h3w0u
         B/ZQHGwyRviLmFkItEFL2eHP9mJOZfb8nepoCiVH8Xs5RdUez+RgwFyuzw7a9ZobcMfc
         PA0OcqP+htHfOsU1pfTabGcHwrePyrumXETD/Q0CwL4iVyT3vYWuOEsQPhLtliBHmg10
         hlKgwVcm6NcV9/Bvm4juOTT1XIIcvH5cuw8Yu1ieHFhpsG4n600okmcn+DS5DvbiKotV
         se0ErMGk9CzpLHzQ5de88Kcev+r5B4kOOZWlsBltDm0W1w+MDvb/0aMYWjcWrxV/xX3U
         lGhw==
X-Forwarded-Encrypted: i=1; AHgh+RqjiN9txHv0L/yETXTi+NtwSoMNLPSYti4mzpLJyQ97sLBISj/Uj3Dn3Lk+EahJrWxLPYvAXslHfDU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnLnuVBoI9hNhpAv4cucgigp7ekdWRIxPJzdMbtnXljB1HDV7f
	G8CDElTzzZU3uzxgmWaC9xbCAZwqV0OrSZw7ZgTfssp+Rg0dtLCxVVYr
X-Gm-Gg: AfdE7ckGzSCW7EsUIoykKFsjxQc6qzQR8sQelMQnbsx1eISnY/SGcQVnxMLBWN+UgRo
	q2wiNjtOvhZ0gbeeJDQ9XJQMHqUBEm2CKMOy7k1RrGFF0V+E7Lg6PtmK1qO6ipb5v8mhquaXsCv
	qF2Q1aVkbiurrJ72GTZuHsOec6QQqRNyUUVYnkiMZRkhrx6BrkJE7r63UZVSXwOdknroso4eUoV
	Ffb7NcF1Jjs5zCN9+3yPpCim0/orzJ8BOvqazbyyKMqVfeT8pOtavD8NU5Douar6yCg0QJ/8NtP
	HgDR59F7OJN6+S0/I8NP2hsFbJrqnbPcYinyf9brcBdmVP+WTDSvmx3X2bjzLXkn4QTG+Hffc5d
	3z79jvWAVLGcpH4fRWpVrXFd9kiKveWmj+FE4rbfjVC7Obj5yAFO1mHdsXIn7p12ZtDeW95UToR
	VVy+Wcp7nzWvF4Jzvub6i/Eqi2g+IOgGqEgL+yS+8=
X-Received: by 2002:a05:6a21:6b16:b0:3c3:88a5:83e4 with SMTP id adf61e73a8af0-3c3ad5f55ccmr3830156637.10.1784305752399;
        Fri, 17 Jul 2026 09:29:12 -0700 (PDT)
Received: from fedora ([2a09:bac5:3aec:1a96::2a6:33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm6363056c88.9.2026.07.17.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:29:12 -0700 (PDT)
From: Shivank Sharma <shivanksharma2376543@gmail.com>
To: pbonzini@redhat.com,
	seanjc@google.com,
	anup@brainfault.org
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Shivank Sharma <shivanksharma2376543@gmail.com>
Subject: [PATCH] KVM: selftests: Fix typos in x86 and riscv tests
Date: Fri, 17 Jul 2026 21:58:38 +0530
Message-ID: <20260717162838.1562808-1-shivanksharma2376543@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_092913_996832_547338BC 
X-CRM114-Status: GOOD (  12.92  )
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

Fix spelling typos found by an automated checker in the KVM
selftests for x86 and RISC-V.

Signed-off-by: Shivank Sharma <shivanksharma2376543@gmail.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c              | 4 ++--
 tools/testing/selftests/kvm/x86/hyperv_clock.c                | 4 ++--
 tools/testing/selftests/kvm/x86/hyperv_evmcs.c                | 2 +-
 .../selftests/kvm/x86/vmx_invalid_nested_guest_state.c        | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index e56a3dd6a..20388f0b9 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -492,7 +492,7 @@ static void test_pmu_events_snaphost(void)
 	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
 	int i;
 
-	/* Verify presence of SBI PMU and minimum requrired SBI version */
+	/* Verify presence of SBI PMU and minimum required SBI version */
 	verify_sbi_requirement_assert();
 
 	snapshot_set_shmem(snapshot_gpa, 0);
@@ -518,7 +518,7 @@ static void test_pmu_events_overflow(void)
 {
 	int num_counters = 0, i = 0;
 
-	/* Verify presence of SBI PMU and minimum requrired SBI version */
+	/* Verify presence of SBI PMU and minimum required SBI version */
 	verify_sbi_requirement_assert();
 
 	snapshot_set_shmem(snapshot_gpa, 0);
diff --git a/tools/testing/selftests/kvm/x86/hyperv_clock.c b/tools/testing/selftests/kvm/x86/hyperv_clock.c
index c083cea54..d5d779623 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_clock.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_clock.c
@@ -56,7 +56,7 @@ static inline void check_tsc_msr_rdtsc(void)
 	tsc_freq = rdmsr(HV_X64_MSR_TSC_FREQUENCY);
 	GUEST_ASSERT(tsc_freq > 0);
 
-	/* For increased accuracy, take mean rdtsc() before and afrer rdmsr() */
+	/* For increased accuracy, take mean rdtsc() before and after rdmsr() */
 	r1 = rdtsc();
 	t1 = rdmsr(HV_X64_MSR_TIME_REF_COUNT);
 	r1 = (r1 + rdtsc()) / 2;
@@ -181,7 +181,7 @@ static void host_check_tsc_msr_rdtsc(struct kvm_vcpu *vcpu)
 	tsc_freq = vcpu_get_msr(vcpu, HV_X64_MSR_TSC_FREQUENCY);
 	TEST_ASSERT(tsc_freq > 0, "TSC frequency must be nonzero");
 
-	/* For increased accuracy, take mean rdtsc() before and afrer ioctl */
+	/* For increased accuracy, take mean rdtsc() before and after ioctl */
 	r1 = rdtsc();
 	t1 = vcpu_get_msr(vcpu, HV_X64_MSR_TIME_REF_COUNT);
 	r1 = (r1 + rdtsc()) / 2;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index c7fa114ae..5cc71658f 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -129,7 +129,7 @@ void guest_code(struct vmx_pages *vmx_pages, struct hyperv_test_pages *hv_pages,
 	/*
 	 * NMI forces L2->L1 exit, resuming L2 and hope that EVMCS is
 	 * up-to-date (RIP points where it should and not at the beginning
-	 * of l2_guest_code(). GUEST_SYNC(9) checkes that.
+	 * of l2_guest_code(). GUEST_SYNC(9) checks that.
 	 */
 	GUEST_ASSERT(!vmresume());
 
diff --git a/tools/testing/selftests/kvm/x86/vmx_invalid_nested_guest_state.c b/tools/testing/selftests/kvm/x86/vmx_invalid_nested_guest_state.c
index a2eaceed9..a07968c16 100644
--- a/tools/testing/selftests/kvm/x86/vmx_invalid_nested_guest_state.c
+++ b/tools/testing/selftests/kvm/x86/vmx_invalid_nested_guest_state.c
@@ -81,7 +81,7 @@ int main(int argc, char *argv[])
 		    ARBITRARY_IO_PORT, run->io.port);
 
 	/*
-	 * Stuff invalid guest state for L2 by making TR unusuable.  The next
+	 * Stuff invalid guest state for L2 by making TR unusable.  The next
 	 * KVM_RUN should induce a TRIPLE_FAULT in L2 as KVM doesn't support
 	 * emulating invalid guest state for L2.
 	 */
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
