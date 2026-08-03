Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ED5C55182
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 21:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WJ6AqlWX5SSAUWLvFaTefpzKeYqd3g0Vojf5MRNFa0=; b=4/tgmH8uMbpHud
	WZUr4VO4iIunp4kghWyJmzn69rCuO251xIvaOlWGPtZnMyR9Tng3vDQ79zyH4qVo0iG9wVZW5m5AP
	ysCnKJBu029YJuty2yUbZYt0u51m/pAlo8VmzYU3Z8pNGuqhoTw8awzX5+5Q64E4TAfveTYpshbN4
	1uYBgYIRhOVL/DAg0I/8gGHOfQ+csGcrK+UFOvlIZ0ig0o3DP1JLW+SjVWOIbC2jz+Sz1rIbHh8Mx
	SvRgQTnwhE/D/f/1+029b5hH1hw7IqtVGpfUZFlYSspzDTnmHdO7rQS+EjyXHbApIUEj40EQQVN4Q
	m+k10YGaz1S0uzb659pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0b2-00000000Yk2-3ylm;
	Mon, 03 Aug 2026 21:53:20 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0b0-00000000YiY-0uMN
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 21:53:19 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4896ae35be9so1280074b6e.0
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Aug 2026 14:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785793997; x=1786398797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYj46W8Df7hirMITCsNQUAF2P+9YRrFHR/TmGqySuFI=;
        b=XnmN14ip0sWO6CZs1Wyd/yJRZMnOCHgrAtxpi7bw4bXaGAAyZvJ/z8ONOBRarW1KDi
         2+L2JOTtFg+rPHZudmCtNKEcURAJp89DoQOc+bCcOwpgnbHkX4pvHEaoQu1jjiZDSLg1
         cw1E+nx8tXYZ8gDOD2rdDcwpxJAZyDieaO4CWJFna5wmxNbwub+lxPh0B9UWMutL+VUs
         FR39yX1QfGPph8Tx2vffWka4dxY8XxOva/MylAtMb+svo9cWzLSlVirPqrwlHtRTVu0P
         NM6B4hsHhgUh6mmooNYBQjg0fhJchlDMiwXVL+fHfT9QRsJMn3Ictoe1a9ag7K1Fpm3P
         xxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785793997; x=1786398797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYj46W8Df7hirMITCsNQUAF2P+9YRrFHR/TmGqySuFI=;
        b=Ook5+G43Nh4lo7tvBDklhm9ztMsWMyR6FQiyHMWCJlbf/9R9k8d/UazpFdqDhPGh+f
         L4n0cWVjx9tfiQU0EmHNrG9Ifxbrwe76iLsZwz+NFA2OzGtLrCURbNHAKpP9cDi0WGL7
         /kWqGcXLYNixiXIbvG6xXbIDNOR4hkPdFr/xvgMYkfWS+372MrlJ/DO9osbck3gpDaa0
         r0ZM3m2t4KTljkqYdaOVnPPKQUyX+CMYQyKo8flvqCuWAHzdAydnsJkr3bi31ybUt8Ue
         yAdXkQcBzoZS/7IAoxsh3caCy5JE4nkyOAoA8BppHwq9PJfi1jE/h47d7pz2FoQg5pf8
         4fUA==
X-Gm-Message-State: AOJu0YzRSEIRejW5uQIuoCeEwB/X6PfpplwsduRju1XGAjEiqQ7ExbmU
	fvK7nZJiOG9tkFcpl6PGbE+tStYt5Qoxj0WOXWsubznjhGfIETaPHAQ3arKlQWsPB5I=
X-Gm-Gg: AR+sD10AYwrJo7A4T+5ochY7n7T7Ro3q9U76FAz3MGLMtq4vp+fbJZhzLxQ4vsONRYV
	xrs0NmXKjVYdGu1kt2FbhOh9lkrhLcC/wialNUgPE2VReQzz1aj1LNovoZYzLFqNAngKbL8uEBQ
	fxBcVYM/5HleZQH3bzRbHcYs1urqV5Xt+2B9oZUU8RkvFTndVMnWkq17t2jSInyMq+LmV+dHDrK
	16ZgbHhT06GyV/9hfxX2tmGMfkVbsTPiBLAhFgT0v7pPXwFFZzIUYiEyz1siGBw+Rm5brc305zg
	+vWo8iVel1LrJeSQpk4rzDHXMevz5/KC1atrHxBcsg61Ka2NDOilC09qJ2Q7ccuoqdlYcjzaYeU
	D6S4vpd1m/GHZwwC0UJargCB6ZOo9cGxk85UcPX68hbUVnJRAsbJtz3G5TnMrs8BZNj1NfYgmrB
	LLNrqQYRJYJjRSSHGE430/PA76vwDNByTC3gxyRQfdGwsXoxkDUD5gXRYoCbLtWoCpPJ7npNaF0
	U0QtQAnVXyD6h8xlbQWpFgzOxo=
X-Received: by 2002:a05:6808:2f0c:b0:495:fa73:2e44 with SMTP id 5614622812f47-4af5e227274mr18564363b6e.15.1785793997051;
        Mon, 03 Aug 2026 14:53:17 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9551dsm7403958b6e.11.2026.08.03.14.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:53:16 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 2/3] riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
Date: Mon,  3 Aug 2026 16:52:41 -0500
Message-ID: <20260803215250.824417-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803215250.824417-1-tchiu@tenstorrent.com>
References: <20260803215250.824417-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145318_254935_AFBD4145 
X-CRM114-Status: GOOD (  17.31  )
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

Similar to commit 7137a203b251 ("arm64/fpsimd: Permit kernel mode NEON
with IRQs off"), we are upgrading get/put_cpu_vector_context such that
kvm_arch_vcpu_load/put can be safely called under both irq off and
regular process context.

Also, export both symbols so the kvm module can call into it.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v4:
 - Include the linux/kvm_types.h to prevent build fail (patchwork ci)
 - drop preempt_v_started check in may_use_simd()
Changelog v3:
 - Export {get,put}_cpu_vector_context() only to kvm modules (Sebastian)
Changelog v2:
 - new patch since v2
---
 arch/riscv/include/asm/simd.h          | 16 +++-------------
 arch/riscv/kernel/kernel_mode_vector.c | 19 +++++++++++++------
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index adb50f3ec205..f176a8072c62 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -36,20 +36,10 @@ static __must_check inline bool may_use_simd(void)
 	/*
 	 * Nesting is achieved in preempt_v by spreading the control for
 	 * preemptible and non-preemptible kernel-mode Vector into two fields.
-	 * Always try to match with preempt_v if kernel V-context exists. Then,
-	 * fallback to check non preempt_v if nesting happens, or if the config
-	 * is not set.
+	 * Only non-preempt_v can nest on top of preempt_v, if non-preempt_v is
+	 * unavailable, then preempt_v is not allowed.
 	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) && current->thread.kernel_vstate.datap) {
-		if (!riscv_preempt_v_started(current))
-			return true;
-	}
-	/*
-	 * Non-preemptible kernel-mode Vector temporarily disables bh. So we
-	 * must not return true on irq_disabled(). Otherwise we would fail the
-	 * lockdep check calling local_bh_enable()
-	 */
-	return !irqs_disabled() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+	return !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 307ac369c3d4..965c8edbe984 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -10,6 +10,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
+#include <linux/kvm_types.h>
 
 #include <asm/vector.h>
 #include <asm/switch_to.h>
@@ -55,13 +56,16 @@ void get_cpu_vector_context(void)
 	 * disable softirqs so it is impossible for softirqs to nest
 	 * get_cpu_vector_context() when kernel is actively using Vector.
 	 */
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_disable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_disable();
+	} else {
 		preempt_disable();
+	}
 
 	riscv_v_start(RISCV_KERNEL_MODE_V);
 }
+EXPORT_SYMBOL_FOR_KVM(get_cpu_vector_context);
 
 /*
  * Release the CPU vector context.
@@ -74,11 +78,14 @@ void put_cpu_vector_context(void)
 {
 	riscv_v_stop(RISCV_KERNEL_MODE_V);
 
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_enable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_enable();
+	} else {
 		preempt_enable();
+	}
 }
+EXPORT_SYMBOL_FOR_KVM(put_cpu_vector_context);
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
