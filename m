Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF43C87FDA
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 22:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeGf5FacFltfVO+BIagBxJMnZWzmycnst/3JcLCdsJ4=; b=2OgaOL10pTow12
	qPNYJkSovXfQ1LH6blL5sjT/I2DHJUfc7mYtKpT47LBxlgvJp2SCtfOvmkqYjfKN3UHF6/ZEjtaFb
	NB/krRjK6g0swZqN3RkZtkKPXhPfBWATGi+k87xjaGGc/SCveyLeuDaLEPeVxZynhJAqbWWQmRPuy
	lDgJ8UCJn1gbD+/NJqe3JO5nLQ/f27tmwW5n4fV54dsaDPRLOT1/5W+YCJDxPadDP7K18hPZSxF5Q
	m7Rz/4YIRgenXdVYFmgZ5sWccgZk+axdI9eyaf3fiy/dvqikgG3pAqG3smSg7uyuHob0DRgqldqMT
	eZvx08PZUIM7H2p3DWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmPP-0000000GhRW-1AEw;
	Wed, 06 Aug 2025 22:14:55 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHC-0000000GGhq-0fTT
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:19 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b421b03d498so121495a12.3
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510297; x=1755115097; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=z6mRW3QO5+v30hMhQPo0nMlPZQjpAzxmFKtx3JiIrDs=;
        b=vSYNEFQIq6Bi5csdwv6GPueRi/G5Zc4fjVkFc5CP35AeplywyFEFYU4DI4MwoUXHfV
         XAf1y7fwll4CIVJOa/8RB29EEfbABKrsA5wN8RKn2t/DP31WD//XzHEQlM+UmB4omwsj
         2//7vppYpGbPLO+OaI6FDEv1e0jIw9Un1EvhUAr+KS6hgKHdHcrgANAaMIdbAqiOd/cN
         nMTKDiLliKzQKXjvnloBF0c3uaghg8r21xwgAaGm75jy66WeqUzcVzvzK3jSN+q6FYcn
         f+Y0ywFHpE93r744R0IqbB7REJDii0ay9yx8f7fwPvoxHk79H+9rfZI+8vsBMHks2IuW
         1M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510297; x=1755115097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6mRW3QO5+v30hMhQPo0nMlPZQjpAzxmFKtx3JiIrDs=;
        b=oSRJ3s6zCVovwfl8TAZ1QtRB0HH850gFPInBc05ZD9UJzwKk7IrycM6vlmZ0p/Zeuw
         Ms88Ec0q5bCxeuKyJwZhrUlUyTKpYZtxm+DFENPvrGI+eeslEx6ixDfn7kqZzs6nlbXV
         XT4Yxsca0hdyS64fJw9f/z+P592IuLA8chb9mdMyfhqkV5pliK2Y/sw6ejEoiAihyXsE
         Yqbusdde6vowd6wH4Pm/UMznIRJxn411dz8jtV7AUZWeOWuYgkYFNmKUcixVQSqqtfIT
         W184k9y1kFo3u/LXA3Mxl12mNEi7QvzicU9oYgN8PM0j0gCKG27bCo//XcqfX3KriIOg
         Ipgg==
X-Forwarded-Encrypted: i=1; AJvYcCVoYbSpj8rzbB01DqIiXjwi850lpcbNIW5NqUs2tokKdQcohIHla4b5kARh5a/V2sRr9qQTE8sU1qU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrM4gWy/6HUKlf7IxOxoz2VNOEVuFoli4awV53IpuqXrC4Q80+
	/IrGYxXbKLU4MOMC/dj9SmkFYjjCKzoYRwsMebE2wOEcQrisQhPI1LExW/6GIEEs8+ngzwJ9y11
	Cpd4cBg==
X-Google-Smtp-Source: AGHT+IF1L5jDO3EJUjPLOXu/s6M1eVdU0dJDtzEbPUmRbyNFn2oUqefjt3C97kWpA7IvjzuPBYgNpNpIe1I=
X-Received: from pgbcv5.prod.google.com ([2002:a05:6a02:4205:b0:b42:49c8:5488])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:548d:b0:23f:faa0:2c27
 with SMTP id adf61e73a8af0-240330367c3mr5937028637.20.1754510296766; Wed, 06
 Aug 2025 12:58:16 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:48 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-27-seanjc@google.com>
Subject: [PATCH v5 26/44] KVM: VMX: Add helpers to toggle/change a bit in VMCS
 execution controls
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125818_206120_F019DEB4 
X-CRM114-Status: GOOD (  12.01  )
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

Expand the VMCS controls builder macros to generate helpers to change a
bit to the desired value, and use the new helpers when toggling APICv
related controls.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 20 +++++++-------------
 arch/x86/kvm/vmx/vmx.h |  8 ++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6094de4855d6..baea4a9cf74f 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4356,19 +4356,13 @@ void vmx_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 
 	pin_controls_set(vmx, vmx_pin_based_exec_ctrl(vmx));
 
-	if (kvm_vcpu_apicv_active(vcpu)) {
-		secondary_exec_controls_setbit(vmx,
-					       SECONDARY_EXEC_APIC_REGISTER_VIRT |
-					       SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY);
-		if (enable_ipiv)
-			tertiary_exec_controls_setbit(vmx, TERTIARY_EXEC_IPI_VIRT);
-	} else {
-		secondary_exec_controls_clearbit(vmx,
-						 SECONDARY_EXEC_APIC_REGISTER_VIRT |
-						 SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY);
-		if (enable_ipiv)
-			tertiary_exec_controls_clearbit(vmx, TERTIARY_EXEC_IPI_VIRT);
-	}
+	secondary_exec_controls_changebit(vmx,
+					  SECONDARY_EXEC_APIC_REGISTER_VIRT |
+					  SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY,
+					  kvm_vcpu_apicv_active(vcpu));
+	if (enable_ipiv)
+		tertiary_exec_controls_changebit(vmx, TERTIARY_EXEC_IPI_VIRT,
+						 kvm_vcpu_apicv_active(vcpu));
 
 	vmx_update_msr_bitmap_x2apic(vcpu);
 }
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index d3389baf3ab3..a4e5bcd1d023 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -608,6 +608,14 @@ static __always_inline void lname##_controls_clearbit(struct vcpu_vmx *vmx, u##b
 {												\
 	BUILD_BUG_ON(!(val & (KVM_REQUIRED_VMX_##uname | KVM_OPTIONAL_VMX_##uname)));		\
 	lname##_controls_set(vmx, lname##_controls_get(vmx) & ~val);				\
+}												\
+static __always_inline void lname##_controls_changebit(struct vcpu_vmx *vmx, u##bits val,	\
+						       bool set)				\
+{												\
+	if (set)										\
+		lname##_controls_setbit(vmx, val);						\
+	else											\
+		lname##_controls_clearbit(vmx, val);						\
 }
 BUILD_CONTROLS_SHADOW(vm_entry, VM_ENTRY_CONTROLS, 32)
 BUILD_CONTROLS_SHADOW(vm_exit, VM_EXIT_CONTROLS, 32)
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
