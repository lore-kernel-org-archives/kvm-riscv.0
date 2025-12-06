Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C48D3ABC5
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMcaRE+tj5pzkk93gVzA+8t1fh5nDYZfhvpy1No+sNg=; b=KPsZ+OHK68Lwp7
	C+pdShEWRUXaJjBjxJLgJTRH2MJS8G0+kA8tvgfOwagNJe8rJqPIFl1Jvu6DgXfcq71ytqb9kJGrG
	287dtNbCvQtWZ8GP5nYQp9+X1NbqsEw9505+z41ZtAyuRbfyFkP++Nb2nEQvN6y97xo+nCi2L41KO
	fV0TEIwHzz0rNzR8teWMCkG5XjGcZg5wEsW4GHCDBP+BIuz/QvSme/l6fJBmTUrcu9Jug1ZkQfXCp
	6LyvShx3dFGzyhAStWQmC0IFV7hEe5bX/PlyeEe+NfR/Ts019I/AYVp4TqTwEufEYFvPAZpmOFakN
	B7CvyymyqF1GEGPn/kPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0l-0000000AGN2-2bT0;
	Sat, 06 Dec 2025 00:18:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzu-0000000AEtd-1KLQ
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:04 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3436d81a532so4711219a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980280; x=1765585080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hhYBOxKMeDA97YbyTKBhQywJKJiMZ56sAPho58tY+oI=;
        b=hzQWoQshQ2LMvi0gbSNjpFOKB5fFwQKtlG2KxsvAWu3Pg7Yw3U/6Tm5DtivW2PPQ8v
         zEkar2/cHzvt0hNZU5JAqY0AVi8XxkTOl0hRCPfuuZiV++nenkfsfUuN+Zw6UMpWiA78
         tQSg9XHkriWjTOZBr2skvm0gs0q5JWXjWX7vAgboP6x14/PImn2A4SdfmAFYYCdXOQKt
         Q9cZ5ew+gEftBEsYXPIPeLSTLNUtYZaN9blrXUjFbODJEgHlgxFjb3VtH2SdHJnxYzvj
         nFDztz1gnMUG8igllh60naYJ13ZQHevqwu5xZq7opz0qTxB4YtxcR1Orgq+7ge349lxd
         w6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980280; x=1765585080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhYBOxKMeDA97YbyTKBhQywJKJiMZ56sAPho58tY+oI=;
        b=gmlYYeJTiQNjPly0bvNPAJS57buy6Gl1kfa+/PerwF1566bD0LfAs/RKBK51okXzBD
         B4TRIO6xvJSQbgITxtUPoErY+eUl0s+oz0y0JIvWR9SfvC6S4UbiRKQpI7x+MnuRyuU4
         6cFGsQ8q6NyUieh0ivugn+0P0y0aEgJavHk/z8RVgYCb36ja2YUKu8faLmUjVpqtXl9K
         JP21VvdjCOBPVSbfWzMaByxEr6r9yKZTir5DdAjbQPvS9QD2Q0qOaM/A152THc4UP92W
         W5HpXpR/Bb7vIzFoJIw22skVWDsvZQiqRy41FXmPAkBPQJBnIKQeKzWzZCUJpPe/9q+/
         BD4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdKqYgkgAR1m6gnQXa7ISLNohlaTqAtbBXUn+jaWakUS1ePyMhPG31KmLkFu7KR/TvQQCeNgZzhWk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtX0aaO17fx77+POxC1CAJAzOnHnbuCwWnOEAC+O6QJRLOo8P1
	icWWeHL7zuUDwYnHc224sdGRLEPD3ulCbpk51P91DLAbPCY80T5CCxhhhDfX9irRLLkGnnTAgp2
	S8ozwqQ==
X-Google-Smtp-Source: AGHT+IFFMAhL4pZP/9HCypRtffNLi9XXG9wzK7MTQvl2xq8p68VDBLvLazIKhLosMJgd33GPPNkDHe8jMow=
X-Received: from pjbbo18.prod.google.com ([2002:a17:90b:912:b0:33b:c211:1fa9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ce07:b0:32d:d5f1:fe7f
 with SMTP id 98e67ed59e1d1-349a24f3283mr493681a91.15.1764980280055; Fri, 05
 Dec 2025 16:18:00 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:53 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-18-seanjc@google.com>
Subject: [PATCH v6 17/44] KVM: x86/pmu: Implement Intel mediated PMU
 requirements and constraints
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161802_466733_90FDBFD0 
X-CRM114-Status: GOOD (  13.51  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Implement Intel PMU requirements and constraints for mediated PMU support.
Require host PMU version 4+ so that PERF_GLOBAL_STATUS_SET can be used to
precisely load the guest's status value into hardware, and require full-
width writes so that KVM can precisely load guest counter values.

Disable PEBS and LBRs if mediated PMU support is enabled, as they won't be
supported in the initial implementation.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: split to separate patch, add full-width writes dependency]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/capabilities.h |  3 ++-
 arch/x86/kvm/vmx/pmu_intel.c    | 17 +++++++++++++++++
 arch/x86/kvm/vmx/vmx.c          |  3 ++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
index 02aadb9d730e..26302fd6dd9c 100644
--- a/arch/x86/kvm/vmx/capabilities.h
+++ b/arch/x86/kvm/vmx/capabilities.h
@@ -395,7 +395,8 @@ static inline bool vmx_pt_mode_is_host_guest(void)
 
 static inline bool vmx_pebs_supported(void)
 {
-	return boot_cpu_has(X86_FEATURE_PEBS) && kvm_pmu_cap.pebs_ept;
+	return boot_cpu_has(X86_FEATURE_PEBS) && kvm_pmu_cap.pebs_ept &&
+	       !enable_mediated_pmu;
 }
 
 static inline bool cpu_has_notify_vmexit(void)
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index de1d9785c01f..050c21298213 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -767,6 +767,20 @@ void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu)
 	}
 }
 
+static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_pmu)
+{
+	u64 host_perf_cap = 0;
+
+	if (boot_cpu_has(X86_FEATURE_PDCM))
+		rdmsrq(MSR_IA32_PERF_CAPABILITIES, host_perf_cap);
+
+	/*
+	 * Require v4+ for MSR_CORE_PERF_GLOBAL_STATUS_SET, and full-width
+	 * writes so that KVM can precisely load guest counter values.
+	 */
+	return host_pmu->version >= 4 && host_perf_cap & PERF_CAP_FW_WRITES;
+}
+
 struct kvm_pmu_ops intel_pmu_ops __initdata = {
 	.rdpmc_ecx_to_pmc = intel_rdpmc_ecx_to_pmc,
 	.msr_idx_to_pmc = intel_msr_idx_to_pmc,
@@ -778,6 +792,9 @@ struct kvm_pmu_ops intel_pmu_ops __initdata = {
 	.reset = intel_pmu_reset,
 	.deliver_pmi = intel_pmu_deliver_pmi,
 	.cleanup = intel_pmu_cleanup,
+
+	.is_mediated_pmu_supported = intel_pmu_is_mediated_pmu_supported,
+
 	.EVENTSEL_EVENT = ARCH_PERFMON_EVENTSEL_EVENT,
 	.MAX_NR_GP_COUNTERS = KVM_MAX_NR_INTEL_GP_COUNTERS,
 	.MIN_NR_GP_COUNTERS = 1,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 4cbe8c84b636..fdd18ad1ede3 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7958,7 +7958,8 @@ static __init u64 vmx_get_perf_capabilities(void)
 	if (boot_cpu_has(X86_FEATURE_PDCM))
 		rdmsrq(MSR_IA32_PERF_CAPABILITIES, host_perf_cap);
 
-	if (!cpu_feature_enabled(X86_FEATURE_ARCH_LBR)) {
+	if (!cpu_feature_enabled(X86_FEATURE_ARCH_LBR) &&
+	    !enable_mediated_pmu) {
 		x86_perf_get_lbr(&vmx_lbr_caps);
 
 		/*
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
