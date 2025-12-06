Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94922D3ABC6
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvmQadBdG78V1wVxz3qPpgOsGHs2rOPGuZQcpZBUCSs=; b=bPeCk1DjUIpW0i
	sKkenmHdQ4mUXgKoIebzZo+VBakPk/b+VtsFnMo1blvlqPUiFbxZH2lrfCa265qLK01uKGFIKsITv
	GazLazq7MuTpMrr2d+9WsdpeO1x+vDKcsa6m6Mt8Sf+okdx6vy1tJ7kdBn6M5XN7pee0WsISEQAbR
	3X3+spN/iDHxqOv5ZSorQYVu2JAZdVrP9uEWWIZF6I3osn7qFfovhrBOSQRGNeRfMPt5gHrscnzgy
	eibjFa9CkpD14ldxz/+/WroNd1fhrwcfIOTc6W47t5qdIOsshvVLwBuPu4p2KAnwfryyGDgGPlfwi
	FvLwJYNv0c5/BczR3r8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2I-0000000AJTq-32Q6;
	Sat, 06 Dec 2025 00:20:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0i-0000000AGFt-22pT
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0alQNA5MnRougM8104k8mY12SAXvJNUdA/VqOuM31LI=; b=mQmaORGqBSIxeoZvwkZeUPch40
	deAai2FRFz352VklSbMO5ecfrQUjmeIRNU6OdsrQwKbWVyOvD2xJhXZy1Phbr4+wDjPMafziM3RyA
	UawIY24+s935Y258H6SJq+8l2b2GaRpxDUbICAMqtGzwVqABWt6C8vT3DUB5/p38AqyWP66N285pC
	jmNi0+HRp3jiElcFGwXqexbUreWeiVAcakFe+YqiAVcf1XNpWQXdGqTUdOeDCCJWJGxeYfoHauhT8
	pIwJZE8GghGRkOPzNpnQSd89cZCoCAq/v9z8DqYB1IdMhj26I5ehjsBBFKriCcPTLzBYgkNRcIA6l
	P7oPZg/A==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf96-000000072nf-2BHi
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:31 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso4938483b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980324; x=1765585124; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0alQNA5MnRougM8104k8mY12SAXvJNUdA/VqOuM31LI=;
        b=TpuCIbyFQ89yixdtfcwu/98zsmetX1DHDp7mT+KPT3lN2/MtV0Yt3nRYYQFmX8D6KQ
         dhJ3z2kI8YT+78D13ZWgvSLAecoO5AUtM25LJCxNW0g6hjL/1qghkIItb2sv3acJBvgL
         hSZSp80Q3vieghQMg2Y65/dhwh8+LFBBIHBUbNQ4MXxwi8gvlH8SZ2P/xKZEr5M5pTmA
         1jF06XyOZ/5ySxz6hqVqDFhL4KcCfMairNnOBD4k4F+N6RZbhfXWs3AWuVa9BfYEkt7Z
         5op7jMjLgY1V+hYcwoh58AanF1PhT8nnYZlX5mOIowPMn4pEnH5tnfKk5Ad+002HsRcT
         B9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980324; x=1765585124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0alQNA5MnRougM8104k8mY12SAXvJNUdA/VqOuM31LI=;
        b=H0JexDW0FnQr8IoiPBHQYzidaLqUeflDrfCoaT8JuVmfCkWes05g3ulKpM7pDBQe7A
         hlqoiRKCrQVAG8/yUaBfMLHcFq7HleOliMM/En/KHWbJPi6s9aHpXYrllR3EpmlaFaDZ
         dCcAkK8X1S4lQS7zf8YmV9eRbcKxRb+8RWNqjrGwxr3EGAO4+3btDNwXlDy8PVu92xBU
         z2ZsAjOmphV2HNd6DSq1SZ7FzVITkoaq9/kjETlzTga+AkLqTufGIfeKaf39U1jgdVOq
         QWY/ksSBiFkoBacFSkd4kMW8odrxHZQXHxXitT8tEGkppSdw+8DgQk3/o6eIh+pnX2Ps
         DFrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7uOTjaxRg7iAfNu/Q4BMZ68guIpz1d7zY0CapPjgrOi9bks9hhXVbAHkBE+mvCP7xap2ZcfBQF5I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4KuBRiNG2isgOIpqXkDiGiFL0ShHO873/AyE8O7E8VvzimXLX
	7xGiP/kD438hZBf+ZfQA6Fzz72Bi4MV70RkmppdgmW/XSnf5n4lKUC8Z39sHAVrFHulQbpyoGrF
	Wg1sz8w==
X-Google-Smtp-Source: AGHT+IE9VOcwrfHydwxf79golQ2o2etTa7qJp+DbC2tY99Fupcp+X66ru5yHSbM1504AJSJDzZlYcA1+Jcw=
X-Received: from pgdc11.prod.google.com ([2002:a05:6a02:510b:b0:bd9:6028:d18c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4ed2:10b0:361:4ca3:e17d
 with SMTP id adf61e73a8af0-36617e37b3fmr739726637.13.1764980324070; Fri, 05
 Dec 2025 16:18:44 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:14 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-39-seanjc@google.com>
Subject: [PATCH v6 38/44] KVM: VMX: Drop unused @entry_only param from add_atomic_switch_msr()
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
X-CRM114-CacheID: sfid-20251205_232329_186451_F334AB0F 
X-CRM114-Status: GOOD (  13.90  )
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

Drop the "on VM-Enter only" parameter from add_atomic_switch_msr() as it
is no longer used, and for all intents and purposes was never used.  The
functionality was added, under embargo, by commit 989e3992d2ec
("x86/KVM/VMX: Extend add_atomic_switch_msr() to allow VMENTER only MSRs"),
and then ripped out by commit 2f055947ae5e ("x86/kvm: Drop L1TF MSR list
approach") just a few commits later.

  2f055947ae5e x86/kvm: Drop L1TF MSR list approach
  72c6d2db64fa x86/litf: Introduce vmx status variable
  215af5499d9e cpu/hotplug: Online siblings when SMT control is turned on
  390d975e0c4e x86/KVM/VMX: Use MSR save list for IA32_FLUSH_CMD if required
  989e3992d2ec x86/KVM/VMX: Extend add_atomic_switch_msr() to allow VMENTER only MSRs

Furthermore, it's extremely unlikely KVM will ever _need_ to load an MSR
value via the auto-load lists only on VM-Enter.  MSRs writes via the lists
aren't optimized in any way, and so the only reason to use the lists
instead of a WRMSR are for cases where the MSR _must_ be load atomically
with respect to VM-Enter (and/or VM-Exit).  While one could argue that
command MSRs, e.g. IA32_FLUSH_CMD, "need" to be done exact at VM-Enter, in
practice doing such flushes within a few instructons of VM-Enter is more
than sufficient.

Note, the shortlog and changelog for commit 390d975e0c4e ("x86/KVM/VMX: Use
MSR save list for IA32_FLUSH_CMD if required") are misleading and wrong.
That commit added MSR_IA32_FLUSH_CMD to the VM-Enter _load_ list, not the
VM-Enter save list (which doesn't exist, only VM-Exit has a store/save
list).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index a51f66d1b201..38491962b2c1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1094,7 +1094,7 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
 }
 
 static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
-				  u64 guest_val, u64 host_val, bool entry_only)
+				  u64 guest_val, u64 host_val)
 {
 	int i, j = 0;
 	struct msr_autoload *m = &vmx->msr_autoload;
@@ -1132,8 +1132,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	}
 
 	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	if (!entry_only)
-		j = vmx_find_loadstore_msr_slot(&m->host, msr);
+	j = vmx_find_loadstore_msr_slot(&m->host, msr);
 
 	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
 	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
@@ -1148,9 +1147,6 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	m->guest.val[i].index = msr;
 	m->guest.val[i].value = guest_val;
 
-	if (entry_only)
-		return;
-
 	if (j < 0) {
 		j = m->host.nr++;
 		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
@@ -1190,8 +1186,7 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
 		if (!(guest_efer & EFER_LMA))
 			guest_efer &= ~EFER_LME;
 		if (guest_efer != kvm_host.efer)
-			add_atomic_switch_msr(vmx, MSR_EFER,
-					      guest_efer, kvm_host.efer, false);
+			add_atomic_switch_msr(vmx, MSR_EFER, guest_efer, kvm_host.efer);
 		else
 			clear_atomic_switch_msr(vmx, MSR_EFER);
 		return false;
@@ -7350,7 +7345,7 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
 			clear_atomic_switch_msr(vmx, msrs[i].msr);
 		else
 			add_atomic_switch_msr(vmx, msrs[i].msr, msrs[i].guest,
-					msrs[i].host, false);
+					      msrs[i].host);
 }
 
 static void vmx_update_hv_timer(struct kvm_vcpu *vcpu, bool force_immediate_exit)
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
