Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D0DC87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T//qTu39KyuNwnzABOFElC9A3W1H1aGLJuft6JZYD3E=; b=TDTs+3BqvjAoZQ
	XBzvF45Z8mM5FwYHFKYvF05UUmaG5HU65jRJ26+rf3/s5oGH9Eoin3LIxJFsabjwoceW4mTkTOsS3
	TD8JZ0uEciL/nXikrk7cz4RD5TcOIB0VgpzqGARXqhjADgQ4UCjLNNZtmGAM5gtpWvwPEYH2RzcVu
	qDceSThUTqB2ubh8BMPptfT9ZjbkHMKcj9+Zfo2Vb7zcHcjdUZ/wd8duRz3NYTwmH7m/Ae1t7KBjG
	yXaSQdlR8Li2aR+WFmvchGSQiMqKGJRt4fncBlumMBpMU/Tjjs2Mcblne1yi3V0k8v75dLySI8hX3
	QRU7o3jInjCIOQMRDNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkdt-0000000GNs1-1Bat;
	Wed, 06 Aug 2025 20:21:45 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGe-0000000GGE4-0iz1
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:45 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-76b6d359927so179075b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510263; x=1755115063; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj/oFQFNyss4LK4I6PYkReCFuQkjKCIa3E/WRuXwHJ0=;
        b=v/UhlPlaiceErMeIETmHJ2bHCnz6KkHfHNwvzgOAepE2KfvYhXRbK4JK74th3Ljkho
         STk8ohkoz+y3PT70BFzvPK6Y2LMCiFBRklKvvTW/x2qBFtEJTJ+QKjKLFqhBxSCbqc5t
         FKNW4trM80TeMJ3UIUSVNK/IP8UoGD/0sOd2fSS906Np24NPK77IT6auZiprd2gw3yuJ
         44ojM6tx9htPjxBtl41pniN6wu3fBQMUnM/ijsOAxD3lehPZxRy1Dnq0QZxNCwBtVXL2
         xkWrZB8kimTmLE0JM255JfcfhRNtxb3FLk5IGopt2D9ZbfsgQHzQKHuOL0jXUBQHaZ8L
         0MKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510263; x=1755115063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uj/oFQFNyss4LK4I6PYkReCFuQkjKCIa3E/WRuXwHJ0=;
        b=kshHn3/Dp32HQnkR2d/iWVFELFOC8SkEcXg4w4NezvkT5wYIxlUA24j3Pd1XufwhJX
         q8Vb19UUPsQJTZeVaLe03pi7OnTYHDoUtmEfS5FkCo2liFlfZB+PU6S7HutBH2kWkINt
         zyJFITwAmPi2REpIlAI3YN1uN3qD5HwuVI48fvLW4f1xh1jtWoJqXvGICyZuy+wh8wci
         LsoQqTczXtL90+TkeL64rQozmnto2LIX9iPjgO0vYwDkiwPtNyyRtPgVnoWjADswJoEz
         3QUxVfv+VkWIWFDwNP7VumBUFsVzhMZ8xRJ9cUaLz5xKyoZZEqIISs5xb2+gkZaMF8mC
         bQrA==
X-Forwarded-Encrypted: i=1; AJvYcCX0iPmufcre55a1YhSIqKWMXHE/vjaHuNBkz1LdpILUX/3ibsEu5i+xEnLTyJDddKHYyW79jtU3q8M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrrRU3vEpV/SZ88Q54aTKQHug61VgY81jnRQ0c9GdpvyD5HzYh
	DshtUVM5Mzc0OHMWy5OvHQ6+CNKPa6IepUwirR91tytEFt+VuraJt47FUEu4dxz2FAJ+OhaArln
	YIDOVkg==
X-Google-Smtp-Source: AGHT+IGQB+bLhnxiIawVNn7HfRXPwF1XDhXBfLBplnIbWM9gXArdsZ1WUOqr9MNOZqSoFpP4ppFPeoHjojo=
X-Received: from pfhh8.prod.google.com ([2002:a05:6a00:2308:b0:76b:c5af:cd3d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2293:b0:76b:d363:4a3f
 with SMTP id d2e1a72fcca58-76c2af6ace2mr5675237b3a.3.1754510263031; Wed, 06
 Aug 2025 12:57:43 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:30 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-9-seanjc@google.com>
Subject: [PATCH v5 08/44] perf: core/x86: Register a new vector for handling
 mediated guest PMIs
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
X-CRM114-CacheID: sfid-20250806_125744_208091_FE8ED466 
X-CRM114-Status: GOOD (  19.85  )
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

Wire up system vector 0xf5 for handling PMIs (i.e. interrupts delivered
through the LVTPC) while running KVM guests with a mediated PMU.  Perf
currently delivers all PMIs as NMIs, e.g. so that events that trigger while
IRQs are disabled aren't delayed and generate useless records, but due to
the multiplexing of NMIs throughout the system, correctly identifying NMIs
for a mediated PMU is practically infeasible.

To (greatly) simplify identifying guest mediated PMU PMIs, perf will
switch the CPU's LVTPC between PERF_GUEST_MEDIATED_PMI_VECTOR and NMI when
guest PMU context is loaded/put.  I.e. PMIs that are generated by the CPU
while the guest is active will be identified purely based on the IRQ
vector.

Route the vector through perf, e.g. as opposed to letting KVM attach a
handler directly a la posted interrupt notification vectors, as perf owns
the LVTPC and thus is the rightful owner of PERF_GUEST_MEDIATED_PMI_VECTOR.
Functionally, having KVM directly own the vector would be fine (both KVM
and perf will be completely aware of when a mediated PMU is active), but
would lead to an undesirable split in ownership: perf would be responsible
for installing the vector, but not handling the resulting IRQs.

Add a new perf_guest_info_callbacks hook (and static call) to allow KVM to
register its handler with perf when running guests with mediated PMUs.

Note, because KVM always runs guests with host IRQs enabled, there is no
danger of a PMI being delayed from the guest's perspective due to using a
regular IRQ instead of an NMI.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/entry/entry_fred.c                   |  1 +
 arch/x86/include/asm/hardirq.h                |  3 +++
 arch/x86/include/asm/idtentry.h               |  6 ++++++
 arch/x86/include/asm/irq_vectors.h            |  4 +++-
 arch/x86/kernel/idt.c                         |  3 +++
 arch/x86/kernel/irq.c                         | 19 +++++++++++++++++++
 include/linux/perf_event.h                    |  8 ++++++++
 kernel/events/core.c                          |  9 +++++++--
 .../beauty/arch/x86/include/asm/irq_vectors.h |  3 ++-
 virt/kvm/kvm_main.c                           |  3 +++
 10 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index f004a4dc74c2..d80861a4cd00 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -114,6 +114,7 @@ static idtentry_t sysvec_table[NR_SYSTEM_VECTORS] __ro_after_init = {
 
 	SYSVEC(IRQ_WORK_VECTOR,			irq_work),
 
+	SYSVEC(PERF_GUEST_MEDIATED_PMI_VECTOR,	perf_guest_mediated_pmi_handler),
 	SYSVEC(POSTED_INTR_VECTOR,		kvm_posted_intr_ipi),
 	SYSVEC(POSTED_INTR_WAKEUP_VECTOR,	kvm_posted_intr_wakeup_ipi),
 	SYSVEC(POSTED_INTR_NESTED_VECTOR,	kvm_posted_intr_nested_ipi),
diff --git a/arch/x86/include/asm/hardirq.h b/arch/x86/include/asm/hardirq.h
index f00c09ffe6a9..f221d001e4ed 100644
--- a/arch/x86/include/asm/hardirq.h
+++ b/arch/x86/include/asm/hardirq.h
@@ -18,6 +18,9 @@ typedef struct {
 	unsigned int kvm_posted_intr_ipis;
 	unsigned int kvm_posted_intr_wakeup_ipis;
 	unsigned int kvm_posted_intr_nested_ipis;
+#endif
+#ifdef CONFIG_GUEST_PERF_EVENTS
+	unsigned int perf_guest_mediated_pmis;
 #endif
 	unsigned int x86_platform_ipis;	/* arch dependent */
 	unsigned int apic_perf_irqs;
diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index a4ec27c67988..5109c24b3c1c 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -751,6 +751,12 @@ DECLARE_IDTENTRY_SYSVEC(POSTED_INTR_NESTED_VECTOR,	sysvec_kvm_posted_intr_nested
 # define fred_sysvec_kvm_posted_intr_nested_ipi		NULL
 #endif
 
+# ifdef CONFIG_GUEST_PERF_EVENTS
+DECLARE_IDTENTRY_SYSVEC(PERF_GUEST_MEDIATED_PMI_VECTOR,	sysvec_perf_guest_mediated_pmi_handler);
+#else
+# define fred_sysvec_perf_guest_mediated_pmi_handler	NULL
+#endif
+
 # ifdef CONFIG_X86_POSTED_MSI
 DECLARE_IDTENTRY_SYSVEC(POSTED_MSI_NOTIFICATION_VECTOR,	sysvec_posted_msi_notification);
 #else
diff --git a/arch/x86/include/asm/irq_vectors.h b/arch/x86/include/asm/irq_vectors.h
index 47051871b436..85253fc8e384 100644
--- a/arch/x86/include/asm/irq_vectors.h
+++ b/arch/x86/include/asm/irq_vectors.h
@@ -77,7 +77,9 @@
  */
 #define IRQ_WORK_VECTOR			0xf6
 
-/* 0xf5 - unused, was UV_BAU_MESSAGE */
+/* IRQ vector for PMIs when running a guest with a mediated PMU. */
+#define PERF_GUEST_MEDIATED_PMI_VECTOR	0xf5
+
 #define DEFERRED_ERROR_VECTOR		0xf4
 
 /* Vector on which hypervisor callbacks will be delivered */
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index f445bec516a0..260456588756 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -158,6 +158,9 @@ static const __initconst struct idt_data apic_idts[] = {
 	INTG(POSTED_INTR_WAKEUP_VECTOR,		asm_sysvec_kvm_posted_intr_wakeup_ipi),
 	INTG(POSTED_INTR_NESTED_VECTOR,		asm_sysvec_kvm_posted_intr_nested_ipi),
 # endif
+#ifdef CONFIG_GUEST_PERF_EVENTS
+	INTG(PERF_GUEST_MEDIATED_PMI_VECTOR,	asm_sysvec_perf_guest_mediated_pmi_handler),
+#endif
 # ifdef CONFIG_IRQ_WORK
 	INTG(IRQ_WORK_VECTOR,			asm_sysvec_irq_work),
 # endif
diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index 9ed29ff10e59..70ab066aa4cb 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -191,6 +191,13 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 			   irq_stats(j)->kvm_posted_intr_wakeup_ipis);
 	seq_puts(p, "  Posted-interrupt wakeup event\n");
 #endif
+#ifdef CONFIG_GUEST_PERF_EVENTS
+	seq_printf(p, "%*s: ", prec, "VPMI");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ",
+			   irq_stats(j)->perf_guest_mediated_pmis);
+	seq_puts(p, " Perf Guest Mediated PMI\n");
+#endif
 #ifdef CONFIG_X86_POSTED_MSI
 	seq_printf(p, "%*s: ", prec, "PMN");
 	for_each_online_cpu(j)
@@ -315,6 +322,18 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_x86_platform_ipi)
 }
 #endif
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
+/*
+ * Handler for PERF_GUEST_MEDIATED_PMI_VECTOR.
+ */
+DEFINE_IDTENTRY_SYSVEC(sysvec_perf_guest_mediated_pmi_handler)
+{
+	 apic_eoi();
+	 inc_irq_stat(perf_guest_mediated_pmis);
+	 perf_guest_handle_mediated_pmi();
+}
+#endif
+
 #if IS_ENABLED(CONFIG_KVM)
 static void dummy_handler(void) {}
 static void (*kvm_posted_intr_wakeup_handler)(void) = dummy_handler;
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 42d019d70b42..0c529fbd97e6 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1677,6 +1677,8 @@ struct perf_guest_info_callbacks {
 	unsigned int			(*state)(void);
 	unsigned long			(*get_ip)(void);
 	unsigned int			(*handle_intel_pt_intr)(void);
+
+	void				(*handle_mediated_pmi)(void);
 };
 
 #ifdef CONFIG_GUEST_PERF_EVENTS
@@ -1686,6 +1688,7 @@ extern struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
 DECLARE_STATIC_CALL(__perf_guest_state, *perf_guest_cbs->state);
 DECLARE_STATIC_CALL(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
 DECLARE_STATIC_CALL(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+DECLARE_STATIC_CALL(__perf_guest_handle_mediated_pmi, *perf_guest_cbs->handle_mediated_pmi);
 
 static inline unsigned int perf_guest_state(void)
 {
@@ -1702,6 +1705,11 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
 	return static_call(__perf_guest_handle_intel_pt_intr)();
 }
 
+static inline void perf_guest_handle_mediated_pmi(void)
+{
+	static_call(__perf_guest_handle_mediated_pmi)();
+}
+
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 77398b1ad4c5..e1df3c3bfc0d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7607,6 +7607,7 @@ struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
 DEFINE_STATIC_CALL_RET0(__perf_guest_state, *perf_guest_cbs->state);
 DEFINE_STATIC_CALL_RET0(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
 DEFINE_STATIC_CALL_RET0(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+DEFINE_STATIC_CALL_RET0(__perf_guest_handle_mediated_pmi, *perf_guest_cbs->handle_mediated_pmi);
 
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
@@ -7621,6 +7622,10 @@ void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 	if (cbs->handle_intel_pt_intr)
 		static_call_update(__perf_guest_handle_intel_pt_intr,
 				   cbs->handle_intel_pt_intr);
+
+	if (cbs->handle_mediated_pmi)
+		static_call_update(__perf_guest_handle_mediated_pmi,
+				   cbs->handle_mediated_pmi);
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
@@ -7632,8 +7637,8 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 	rcu_assign_pointer(perf_guest_cbs, NULL);
 	static_call_update(__perf_guest_state, (void *)&__static_call_return0);
 	static_call_update(__perf_guest_get_ip, (void *)&__static_call_return0);
-	static_call_update(__perf_guest_handle_intel_pt_intr,
-			   (void *)&__static_call_return0);
+	static_call_update(__perf_guest_handle_intel_pt_intr, (void *)&__static_call_return0);
+	static_call_update(__perf_guest_handle_mediated_pmi, (void *)&__static_call_return0);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
diff --git a/tools/perf/trace/beauty/arch/x86/include/asm/irq_vectors.h b/tools/perf/trace/beauty/arch/x86/include/asm/irq_vectors.h
index 47051871b436..6e1d5b955aae 100644
--- a/tools/perf/trace/beauty/arch/x86/include/asm/irq_vectors.h
+++ b/tools/perf/trace/beauty/arch/x86/include/asm/irq_vectors.h
@@ -77,7 +77,8 @@
  */
 #define IRQ_WORK_VECTOR			0xf6
 
-/* 0xf5 - unused, was UV_BAU_MESSAGE */
+#define PERF_GUEST_MEDIATED_PMI_VECTOR	0xf5
+
 #define DEFERRED_ERROR_VECTOR		0xf4
 
 /* Vector on which hypervisor callbacks will be delivered */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6c07dd423458..ecafab2e17d9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6426,11 +6426,14 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.state			= kvm_guest_state,
 	.get_ip			= kvm_guest_get_ip,
 	.handle_intel_pt_intr	= NULL,
+	.handle_mediated_pmi	= NULL,
 };
 
 void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))
 {
 	kvm_guest_cbs.handle_intel_pt_intr = pt_intr_handler;
+	kvm_guest_cbs.handle_mediated_pmi = NULL;
+
 	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
 void kvm_unregister_perf_callbacks(void)
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
