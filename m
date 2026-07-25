Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC057C531FA
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WJ6AqlWX5SSAUWLvFaTefpzKeYqd3g0Vojf5MRNFa0=; b=s+e7d3Jh1c7d33
	KHdfN3wgTEky+vSNB10qJGCX4sZhp8NBloAy92M+m+m7St+NupmDaxOfljbNa/n0gHh5fe/DYP0TZ
	ct8WMJ67qqf27yPbJElkbqqPuNtOGg17MTzwKcbMFSflRa7C+c5UptMwwWK34VXzAVFzupYPnh6hT
	+zL0WRHUp5Ozk96/EqLmIq3tp5Nnc1FyL2XgcdrAttyUQlxH0r2xZh+P8rQtRbsCg+hqgKYhM3ywq
	RV+6ox7uLPHT2RVkBZXFyfPVtxS/Ro+H2sVEARGcYrGtXb0UGK8hrNyiI8ytLf33CAPKuDOdx+LL7
	GKYvHY3z9xBquPLYMcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5f-0000000HOrZ-1fD4;
	Sat, 25 Jul 2026 00:18:07 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5X-0000000HOkt-3RBX
	for kvm-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:18:05 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso319448a34.1
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938679; x=1785543479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYj46W8Df7hirMITCsNQUAF2P+9YRrFHR/TmGqySuFI=;
        b=arcN+khOUvOgvOemTBJGK6Q1s/deHLCfSLNhC7v9y7i4ErSR1psCj710KICSo+4IGg
         rWieBvGGGLCDRvv87sQgoMTi97ZyRqbr2//hIXDTe6HDzN4+tUTvVUsR0RI/Z429bO9z
         BvzuVu1CmW8wjAnpbEzXInrOXiVqKol+4+8pfeBINdjQoRtflH6V/zJQbC6Rxso0w3sc
         yK1vP5S0IP5gGlchxWjlGnVnVpO3V7by6qahHR/qYNYB8q8xIsD3HEsV4OlbHb3HueNM
         1clErSOp5+oh+8cR0EZuNYHgBc9BTNPFHyUbODJYVofFh6bzwy8gGCO/sg7lYEs9R/7p
         SRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938679; x=1785543479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYj46W8Df7hirMITCsNQUAF2P+9YRrFHR/TmGqySuFI=;
        b=MLIk8Gk+8SKOIE4hFrqADL196re95jCfls+4JvY/n6ibfQxG+7A2t2/oSt8S3N9G1y
         c01FCP68Uxc4hhXR33xApjkI9lfY8qDZiTZd9znEn0fWMphY8Zr47iupEt4mTcImQzSw
         G5+WC7MeTfAKFhBcsBxh+HBQf+jgXu+686/NhTym7hRBXijS+EMu7qwIWiVTQ2RWPYQV
         FJozdVNSGI+CnyXyKWyAo2iW+xT/1IXm3qh+J9T3XXx1VL268KPGN4iiE6yAF8XQRFek
         TBq3cUscC878jZx3PdNV90o0GxFSuRkcOAaCGfmj/DLObEm4JtYfc7Ey18tNQVOtNnqu
         I//g==
X-Gm-Message-State: AOJu0YzuD5UPa9I5EHs0mKQ88IvczGHdSMVVxMQmQsdkJUyonri3E5Pd
	MtjIlWSP/4EM+oII3cnCtuxJJZYM2C8y2jqhlnMYeXBpVsw8UG9/O6gyQMdsyPyJojc=
X-Gm-Gg: AR+sD10F55s4FEo5vN0ycPgWeV67SZaDNiKn/2J4NUvFYvidyr21wzXOsaWLBdigV8Z
	Xg45mpWEb5LRJPSaMuuxkksj7PeQyj5BbnoNwOu7b2Pyq9oTRUC2kyFBARBZkBu5gFEICNPieSJ
	woWoWwv0D6PHIoj2pdlRs9Ifdw0pk6+WX5934iinbWUuz0LzE7ZhTTMcpRrwgN4BoIbu99klUPI
	6E3hVV29QO5+tsH0R02jOgCU0lhMoNC5+WIyHuj1RNNNs0rXevLivMbJfpIo9P28BkSGfupLmmv
	vI1fTBMN1yk8Dqo3SgznIhtE5jQKyEtgYwOkdsdoEGb+XbPm7a4I03isj8jDGhp+uOY+YIvlN15
	nO+qwpDb7jrOs6IDcJyUkEiAhNMVOOFSW2rImMHlp87b/oXFzPMi+i3wyTDYMO9JLAZDi5XeojM
	Lg+g8/4t+vo3IDRvuG8pSzCHZ9lyrbIvVSmtM=
X-Received: by 2002:a05:6820:6ae8:b0:6a3:c5:30ca with SMTP id 006d021491bc7-6aaff9916e4mr432102eaf.31.1784938678681;
        Fri, 24 Jul 2026 17:17:58 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm884057eaf.7.2026.07.24.17.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:17:58 -0700 (PDT)
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
	greentime.hu@sifive.com
Subject: [PATCH v4 2/3] riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
Date: Fri, 24 Jul 2026 19:17:41 -0500
Message-ID: <20260725001749.2579274-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725001749.2579274-1-tchiu@tenstorrent.com>
References: <20260725001749.2579274-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171759_939038_38222EE8 
X-CRM114-Status: GOOD (  16.40  )
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
