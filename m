Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD4ED3ABC4
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pE2occ8Ixs9kCzyOVaOw7jpjfOl+5j+Yun12VY+WkIs=; b=Vkdmdibkbvu4Eu
	oUFbj7sa7KSUUPmd10hwX27kkxT5yEwW1mMEaENxzgQeExWSPLH/cXpP+jbKLcj5UqEIlay8V1ncU
	OGqW+uEG7Z+PRQh3T5pHbfyhDMj5yw2L2AxLT7f7Bn3M+hOeSwHBiDwdKUZD+12CiGYCeNCqUp8Cq
	kQwWAxN1/IE2UZSJ3AmTJRlVuav3wWawCEITRdYTraJI+TYTHI3EXLY6P6+c7NIbOXAZHoV9EJfBF
	68uF4lYOgnavVm4M8Ff1V+sJEaAM1dHnVZ7/tpGtlSQ5y12s50shJikc8F7PZdpzNFaqKVPLVVULI
	Ks2+v7lIMhTWkGU0i+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2e-0000000AK8o-3XvA;
	Sat, 06 Dec 2025 00:20:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0q-0000000AGTP-3fhR
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=igvZhN+qFglUKI0D9M5DwytuE53IkpoWDDVxPCMFY70=; b=nkR3Ra75BdzPQbjK5hRW2UMF9q
	lsD/qDhQJg6DTcPoeCfLj85oOw3NbTTe2dTOqB/Wpyy/9yhXKFyxcG7uRRRrcbgWpKFJVjCyeSbQC
	xcVnlfNneyxpl3jHbrKovsUTccF3UCPXQuTftK9az9f+ka0mS7K+ID9l4MAvasrhYDheQhzkjggDQ
	bGWxd75bNlCIwanIvnsKSq57bywATtG8uOfp0mK/3iXaYphfpHWTHYZ+JMuoT4Y7iuYYOFfRJtS/2
	Dv2h83rx4MBGg4YkbcUGAwd/+/dPckMh0OwoWt+ZycNonFOPzqyXcLBfORZPWTPTTzfks8bBjlTtg
	3BCjzDkw==;
Received: from mail-pj1-f74.google.com ([209.85.216.74])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0k-00000006SoI-28wG
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:59 +0000
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-343daf0f488so2945837a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980331; x=1765585131; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=igvZhN+qFglUKI0D9M5DwytuE53IkpoWDDVxPCMFY70=;
        b=B590VdDDBmjaZeBvXfIebozpnsHny4TzX2JokZMkKvKt6JRK+4WDkxduoL0iSTbq4J
         ZOdupiphhdauR9ia4I0DgGe/zhGzTYY484p/c3mHps6uxZR1J3HWcz4nOh3oqjlvKfdk
         wsJP90ln87/9QLV25H0hKOzaBpI7Rk4HOYvYMTK4MS/TXj1/m41ijv16ihsyUe9WSTrp
         Ew5dal6blPirsppjDwOlRQaC5ETtlgMw7JwyYHJmA52Mo6I19MlcSVE3/qss9XMEMdv1
         8A/14EKGAFuSuFO94BzazwPdmxXaxwLqm6jAloaAdBWX9Gd4pVoiL41r3xrVzS4roFxE
         tKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980331; x=1765585131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igvZhN+qFglUKI0D9M5DwytuE53IkpoWDDVxPCMFY70=;
        b=GDZlMVZYlJe0+kH5H/az7Mx0YoVx220Bo1x6QLTqqq8Q/z0S8G2hT4QGMX+R5WXjKZ
         Wc43m+k8CAHGUljZPoTXd3C0FCrw+iYbeX62/GYYqDB/Fiw0pdD17Rd7NAVKFjv5J4Fl
         406/lw/ETV9CITAwxhaVPfkvKWbZ+37O7B6QTtShW8ezQ8IxRHLatiPzFtV97yxSlr5f
         +9mddVENQZchvj/jAbhwq4rGjH8+FAnpCu9j1cWFrCOyjfvQyR6nTuPL79UQWvJW0jJ7
         NZ1udx5d605l2SdcBkq0bRmTUAYCJF3uMw3e1rhZhR8X7rRe4iujwQlLRn3CgUaK2xvh
         QAFg==
X-Forwarded-Encrypted: i=1; AJvYcCVmnFiNIM8W1h/f/P0qYKDvP72ofIa1XrG5rBcIZ8zFLGpKB1pux0sm13oIHh8qFvK/MvoAAKl4AMA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXNjvlUvBi678XijtHAj5WWUFMy0LpbHlhGazm5LrA6gWDfDfT
	9GHm/bePLxIOHsGNzA7d6VTHBO3QXQb4vAc4GBevmB2Wq67XAQy3ST+wWqrPYP9/SuejlWCWch3
	tYeGhlg==
X-Google-Smtp-Source: AGHT+IELoQ04EyxWWYOkaKJLtcnZ6DpPNmUnBZcM+48DKxRjXGIekKbShjkFhb2K5/ObBWXw0pAx2mabe98=
X-Received: from pjbsk6.prod.google.com ([2002:a17:90b:2dc6:b0:340:a5c6:acc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc47:b0:343:d70e:bef0
 with SMTP id 98e67ed59e1d1-349a267fbc8mr680584a91.21.1764980331409; Fri, 05
 Dec 2025 16:18:51 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:18 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-43-seanjc@google.com>
Subject: [PATCH v6 42/44] KVM: VMX: Dedup code for adding MSR to VMCS's auto list
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
X-CRM114-CacheID: sfid-20251206_001854_690573_C80A5F90 
X-CRM114-Status: GOOD (  10.86  )
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

Add a helper to add an MSR to a VMCS's "auto" list to deduplicate the code
in add_atomic_switch_msr(), and so that the functionality can be used in
the future for managing the MSR auto-store list.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 018e01daab68..3f64d4b1b19c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1093,12 +1093,28 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
 	vm_exit_controls_setbit(vmx, exit);
 }
 
+static void vmx_add_auto_msr(struct vmx_msrs *m, u32 msr, u64 value,
+			     unsigned long vmcs_count_field, struct kvm *kvm)
+{
+	int i;
+
+	i = vmx_find_loadstore_msr_slot(m, msr);
+	if (i < 0) {
+		if (KVM_BUG_ON(m->nr == MAX_NR_LOADSTORE_MSRS, kvm))
+			return;
+
+		i = m->nr++;
+		m->val[i].index = msr;
+		vmcs_write32(vmcs_count_field, m->nr);
+	}
+	m->val[i].value = value;
+}
+
 static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 				  u64 guest_val, u64 host_val)
 {
 	struct msr_autoload *m = &vmx->msr_autoload;
 	struct kvm *kvm = vmx->vcpu.kvm;
-	int i;
 
 	switch (msr) {
 	case MSR_EFER:
@@ -1132,27 +1148,8 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 		wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
 	}
 
-	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	if (i < 0) {
-		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
-			return;
-
-		i = m->guest.nr++;
-		m->guest.val[i].index = msr;
-		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
-	}
-	m->guest.val[i].value = guest_val;
-
-	i = vmx_find_loadstore_msr_slot(&m->host, msr);
-	if (i < 0) {
-		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
-			return;
-
-		i = m->host.nr++;
-		m->host.val[i].index = msr;
-		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
-	}
-	m->host.val[i].value = host_val;
+	vmx_add_auto_msr(&m->guest, msr, guest_val, VM_ENTRY_MSR_LOAD_COUNT, kvm);
+	vmx_add_auto_msr(&m->guest, msr, host_val, VM_EXIT_MSR_LOAD_COUNT, kvm);
 }
 
 static bool update_transition_efer(struct vcpu_vmx *vmx)
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
