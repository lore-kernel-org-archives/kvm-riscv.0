Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBBDD3ABC6
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnH1HofixloBJZFQP15NYu/SJ1xfuCG8GQ2JUgZ1oQU=; b=h9leoAWOZdQgyu
	+Aa/GcqNvnm3yWZYfz5D7bCosRvhyBlEzhHqDEVeHah6p9RVssjdBUg7mM4AVfCZQaV0VUQ0M9vUL
	9pv4vSunqHVJsWWTvf0nuHPD0QAdJGji8x+zJFrfAp2vsyLdHqUd0vxgl9p2Z/maMn/VzS9thqfVn
	0bypUjj6HWUItzY+3NfmwOKwKvUTIwsuys1NwRHV6Fz/+c91hr76K9en76Bd9EeGKpgfZQS+s31xr
	VhZ1jLPOULRNWZmqghnTIu09u6dhMpx91KCMJRZMO+OaEFcWDTYZWYpdZHAny93EN/ta8WEejeIIZ
	pImSpzmmZLGHj4MMANWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2R-0000000AJmt-3nAo;
	Sat, 06 Dec 2025 00:20:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0o-0000000AGPC-1rt0
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QTKuKPWFr6bVN6iN1gTHfORH5j78nQLhYRuj2ERNrVM=; b=rDteROy5ANJ58b4woGlArjcKHS
	WFeSaNhs2KcfjCzXWDjha3lmk+bX3Pt+u0a8O1Dk32h5hDgLQ0LnwNa8MeSz1A8LnJ21yL9vML0QS
	UG9BEk2cUxcqFLTWKlIfbP1YCQ0FESLgMxxBVswo3D2CNfJtR6BciDoEzGHFus8D/4tTCL7tb5r4V
	EVmYy+6ontlD0CJ8NCRtNyLnBJd2wBZEMUVy0pi/4Xn3iBEnjh+OgZee2HcDL2sNsPGYXLL6HXX5Y
	MikYJLwa2NXqX28FRvkVEXtD3Q4wl80o0v3Ikg+F/qy2rcSiCcVJXKaKeHInT+i6TPO+SgV+rtrQZ
	apuYYz4A==;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf9C-000000072rX-1jMW
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:36 +0000
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7aa148105a2so2494378b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980330; x=1765585130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QTKuKPWFr6bVN6iN1gTHfORH5j78nQLhYRuj2ERNrVM=;
        b=EVwjnNVNzsGNuLoNrHYLxH8YU2vkb48uJ3gvXQ9QVnc9tblmZMrZjgDbK4VmypxbVY
         xEx1GkuFlyKP4gi/UVVay0bMSmf4MX3F10jJWbiArREUlW7GIDjmZQ3BQhY57CCtGSSt
         IgfQfzMDIj+JjgLIFm+B8pGjMRVJISNYINpT6A8eXDdmA7ObokdOQNaZgu/z/jSSM2Ev
         GCoElyi7NcByqGLUkw1DiUp0PG3JfYV2QI3nWO8v8wQqN/8h6q+ZS2wkgmFIHC7cg24M
         v7A4xJw2H5csIJXA2ZpBmE6gB97hK9l3j3YLAuWjmqeht8KSRmzQLqkf3unIrf7tzaOV
         iC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980330; x=1765585130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTKuKPWFr6bVN6iN1gTHfORH5j78nQLhYRuj2ERNrVM=;
        b=jl+gRP1wMfB4BQEYhNWQR4JvAsWiaKVtej2jEI664YiaA9yKgohT2nD63lwtF3+4/O
         w/I16xYCixyjOd8+/inmiOsSVi82bEgtEajaVsQugaMDvHZQOBN4tnA3MfPqm4NWwUUt
         Ja37RRMZuFH8f9dVQv36QDpgwCgDYd8qf9NVawOg9uafm0KtDsMOfpY0OD/JItWwuBnN
         yPPyqcY8UgFoin1OwwJ0WGzautIokrevIwjqVQdAgN1uVpOsyDqLmCQICe2RmRoy6oxL
         wuS5XGi+tLoPKR7izUdUDMWtWK/VLaaDkxTJX0NvjxjcWmMkbzfEKTDwlPannM7xO/tx
         N0Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW6HgOCmbPaTw+7oW+BO2E9SnvNTHlM5GAreRFYn6DpcqTmwB4TMqDBk1bbFWGLV7O8KcTeOst89Jw=@lists.infradead.org
X-Gm-Message-State: AOJu0YydtdFOIh2k7FPMkO1X0gaivWZlKSNIv0zwjFNvDqmMncWETf+2
	lKSrnUWuYDkZgpdaFp0yECyv7Haihac5Q7vvtkNjL8f+UHXlW/8cxElFSsV/vPnz+ipWrB6lRSS
	ZAnkwmQ==
X-Google-Smtp-Source: AGHT+IHwEgCif9QeztnHlCZf32TA1mft1ORkKdnbi9mkgV4eyxEEshqnwgTA7OOXOPfobSPR/sGAg/rO4Do=
X-Received: from pfjc12.prod.google.com ([2002:a05:6a00:8c:b0:7e5:49a7:f55f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f91:b0:363:cd5e:8f87
 with SMTP id adf61e73a8af0-36617ea8befmr929454637.13.1764980329483; Fri, 05
 Dec 2025 16:18:49 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:17 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-42-seanjc@google.com>
Subject: [PATCH v6 41/44] KVM: VMX: Compartmentalize adding MSRs to host vs.
 guest auto-load list
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
X-CRM114-CacheID: sfid-20251205_232335_044133_D095BAA2 
X-CRM114-Status: GOOD (  12.44  )
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

Undo the bundling of the "host" and "guest" MSR auto-load list logic so
that the code can be deduplicated by factoring out the logic to a separate
helper.  Now that "list full" situations are treated as fatal to the VM,
there is no need to pre-check both lists.

For all intents and purposes, this reverts the add_atomic_switch_msr()
changes made by commit 3190709335dd ("x86/KVM/VMX: Separate the VMX
AUTOLOAD guest/host number accounting").

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index be2a2580e8f1..018e01daab68 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1096,9 +1096,9 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
 static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 				  u64 guest_val, u64 host_val)
 {
-	int i, j = 0;
 	struct msr_autoload *m = &vmx->msr_autoload;
 	struct kvm *kvm = vmx->vcpu.kvm;
+	int i;
 
 	switch (msr) {
 	case MSR_EFER:
@@ -1133,25 +1133,26 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	}
 
 	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	j = vmx_find_loadstore_msr_slot(&m->host, msr);
-
-	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
-	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
-		return;
-
 	if (i < 0) {
+		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
+			return;
+
 		i = m->guest.nr++;
 		m->guest.val[i].index = msr;
 		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
 	}
 	m->guest.val[i].value = guest_val;
 
-	if (j < 0) {
-		j = m->host.nr++;
-		m->host.val[j].index = msr;
+	i = vmx_find_loadstore_msr_slot(&m->host, msr);
+	if (i < 0) {
+		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
+			return;
+
+		i = m->host.nr++;
+		m->host.val[i].index = msr;
 		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
 	}
-	m->host.val[j].value = host_val;
+	m->host.val[i].value = host_val;
 }
 
 static bool update_transition_efer(struct vcpu_vmx *vmx)
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
