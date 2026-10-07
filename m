Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF4FCA6009
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijaPjjEZX+ppgtTTzowPYASOJNT0lzSKSYrQrJ3X8UA=; b=uwxcHwtTcGUDgj
	dafJOw3QXNThm0eYia4lmEzxJoOrKDXHyZLf0NE8yuDR2r+nkbJcF3MAdLy5NJfqDzW+kqzK/BD6x
	q58SojQ8OKUl2Rb3swYXtwP5HF+HnGVuWymHmdJuoTSvAxcxfvNn+e+KoRuYgS/2+3s2atfAVNAgr
	TNQ9w4+D0utKe+4utHTli5ZGOuUZ5pziYOcOtgdYpifHEAUQvcPZLcyu9k3c7NRtpBO5TzJ1Zsy/s
	3/c7aGDLYlq+Cpz3PftXfpNS/SPI/sfTNKGDjqlkpQRI3mtbpuUnya2jjbbiVH8j1Bc4B/p3gg0l7
	bvNBMJ88yiZrR8H1Tx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN9-00000001zOR-2Z66;
	Wed, 07 Oct 2026 08:51:35 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN5-00000001zLU-1MFz
	for kvm-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:34 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-35154cb9de2so1826197eec.1
        for <kvm-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363090; x=1791967890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PngyxLkoG9CkjKZOP2vRA0EoHH3lWjAJhQ9czt2O6bA=;
        b=NLGZQQOj/xO9WzQor9WweYi9mg4mSOFKOkN+J6O8hVHe2VKjvcdyUv/jvT3/psABZM
         bONnT8CRVS2CnsmTRCRE/UBorxpg5CY11TCUzF+y8Wx/x1XUQFsKaQotQwZy6udxsD0E
         VsAt1STpms3Mfmja4UqMoc8VAhW1jwyLQY5+DCF7p30QAamQyfgrbCdPbFyy+98XS7I2
         iRnyyQCzaagWtY1bNeYYiSMTAYrA++3VNAIYGizDpsjv/bi382s1KdxbeKLTm/YUqYfQ
         rVXO7kp0lF/IF4RbPjEDnOFF0g1BPcuFqErI4l1tiSvZSIi+YSeqHO8mLY/wtE8tD8kp
         OFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363090; x=1791967890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PngyxLkoG9CkjKZOP2vRA0EoHH3lWjAJhQ9czt2O6bA=;
        b=ZWftLGQPcUVzZFHQ6PsoI7R/B2l+qPtIQ3VobzDCvsIN8PbZ9peHRBHxtAh4R6Q1S9
         KDvYw4BQVb4pOyLsOmojLp//vtlqQPqitXq45oBBsFY40NVINmK88zwkldvRGvjYuuTs
         F4kskw8HvVTKITYPlLifsVJjNbTeXRw5ZZzYcjBwr+7id309CWvv9VDjFcJxrfjcV80y
         y6c5TDHEh3NDUY3EKSz1q/2JE4kG+cKWBin/OVjIhxCzx6N4q/7DATVgZfewhp/qzsOQ
         7AzcRLoaFfcbHGnmlbfUJHnU2RSDcy3PUHF3B6r+NIlISRV7SJB8WqUZv/IDLmosDQ5D
         at3w==
X-Forwarded-Encrypted: i=1; AKwUvBxT+C6XW7nSam0pHfMC0fvuxXMFeC578tKBZ8coLcvtHXEpzH6SWNnD+016Awx16xI8GsiQEnTm5y8=@lists.infradead.org
X-Gm-Message-State: AFuF++mjitdTg+0rxWktunR63vQuVEeYkaNcZv7DoQYuJVzjJ9Za7oq1
	KD5IpVL4YCjKwIqRSTTafz6SkMb0JsIEmABE6QH4ilNzbU1A6ufUyx/e2SE+PSzQCuY=
X-Gm-Gg: AYBFou0MVFTWcZ3nrYn07vwTscFQC1NKnTPLCe4Og1WqEO0sYFFIxSBwz3+v/Ij/hXw
	Te7by7ofXsK9gi5ZXUD2gOOZ7s893fXEJUKtMPDkar1kN+x08NWA1LoX9zZn5MAEIWH+heVWE3Q
	K1CFugE4S9joqZAqO5FQKF5ga0K3/FuT//2pLp/1py2Bo+xbwd2IffQxob9CXwX/qPVcc9Z4Ld/
	04JyZswNiJxsgfK4YY4Em9qSHzd3IKXS8UaKOKiphuNqjjjON9HQBYRcjdI9AlW/GQ4OYkQ2QAL
	EMpGh1Gv6Q2UyxQLhP7xPUf8SOye6Dkn7B0nNyuP1yas1+Tc5c+5DXVIpwpeKUUbNV7cV5+0KIJ
	+gG1FjNNNRtQ51Q3XsRv2yrGzBpLMpE1N070kVVhHIXZBLGmKMsTF7D6rDHrhEbiqi9N2NUQSI1
	+oh31HZ+iAdCBL1MBQ/931b/h7+6DMKtuL3nGm2Dx64ZxUDa3gm8MRinV7zaRDTK0DhbiomzjEj
	GoqPCOx+9oYxiAKwhyL9faKlju7X5E=
X-Received: by 2002:a05:7022:6b8d:b0:156:3684:96d4 with SMTP id a92af1059eb24-16205eae0e8mr2228302c88.25.1791363090334;
        Wed, 07 Oct 2026 01:51:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:30 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/3] riscv: Deprecate vector state prctl/sysctl
Date: Wed,  7 Oct 2026 01:51:17 -0700
Message-ID: <20261007085126.222688-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015131_392691_B88F02ED 
X-CRM114-Status: GOOD (  17.56  )
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

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This appears to be unused in practice, and
creates confusion in the extension support returned by hwprobe(), as in
this one special case an extension reported as present by hwprobe() is
unusable.

Since we believe it is safe to always allow vector usage, hide the prctl
and sysctl behind a Kconfig option and mark them as deprecated, so they
can be removed in the future. Note that significant userspace software
like glibc already considers these controls explicitly unsupported.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig                 | 10 ++++++++++
 arch/riscv/include/asm/processor.h |  4 +++-
 arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
 arch/riscv/kernel/vector.c         | 10 ++++++++++
 4 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e26450f0d38fb..83e52a0a85ba7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -650,6 +650,16 @@ config RISCV_ISA_V
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_V_VSTATE_CTRL
+	bool "Deprecated prctl/sysctl for disallowing userspace vector access"
+	depends on RISCV_ISA_V
+	help
+	  Add prctl and sysctl interfaces to disallow userspace to execute
+	  vector instructions. These controls are deprecated because they create
+	  ambiguity in the ISA extension availability reported by hwprobe.
+
+	  If you don't know what to do here, say N.
+
 config RISCV_ISA_V_UCOPY_THRESHOLD
 	int "Threshold size for vectorized user copies"
 	depends on RISCV_ISA_V
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 815715c67f940..ad64df01417a2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -121,7 +121,9 @@ struct thread_struct {
 	unsigned long envcfg;
 	unsigned long sum;
 	u32 riscv_v_flags;
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
 	u32 vstate_ctrl;
+#endif
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
 	struct __riscv_v_ext_state kernel_vstate;
@@ -202,7 +204,7 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
 
 extern unsigned long signal_minsigstksz __ro_after_init;
 
-#ifdef CONFIG_RISCV_ISA_V
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
 /* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
 #define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
 #define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a772080..5425a25f8a196 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -404,9 +404,6 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	}
 }
 
-void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
-bool riscv_v_vstate_ctrl_user_allowed(void);
-
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 struct pt_regs;
@@ -418,7 +415,6 @@ static __always_inline bool has_xtheadvector_no_alternatives(void) { return fals
 static __always_inline bool has_xtheadvector(void) { return false; }
 static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
-static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_discard(regs)		do {} while (0)
 #define riscv_v_vstate_save(vstate, regs)	do {} while (0)
@@ -435,6 +431,18 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 
 #endif /* CONFIG_RISCV_ISA_V */
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
+
+void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
+bool riscv_v_vstate_ctrl_user_allowed(void);
+
+#else
+
+static inline void riscv_v_vstate_ctrl_init(struct task_struct *tsk) {}
+static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return true; }
+
+#endif /* CONFIG_RISCV_ISA_V_VSTATE_CTRL */
+
 /*
  * Return the implementation's vlen value.
  *
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 9641343732782..b35d11ff3cc89 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -20,7 +20,9 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
 static bool riscv_v_implicit_uacc = true;
+#endif
 static struct kmem_cache *riscv_v_user_cachep;
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static struct kmem_cache *riscv_v_kernel_cachep;
@@ -144,6 +146,8 @@ void riscv_v_thread_free(struct task_struct *tsk)
 #endif
 }
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
+
 #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
 #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
 #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
@@ -182,6 +186,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
 }
 EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
 
+#endif
+
 bool riscv_v_first_use_handler(struct pt_regs *regs)
 {
 	u32 __user *epc = (u32 __user *)regs->epc;
@@ -227,6 +233,8 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	return true;
 }
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
+
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
 {
 	bool inherit;
@@ -330,3 +338,5 @@ static int __init riscv_v_init(void)
 	return riscv_v_sysctl_init();
 }
 core_initcall(riscv_v_init);
+
+#endif
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
