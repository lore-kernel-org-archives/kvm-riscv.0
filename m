Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06DC606A321
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNAz8VpO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=iFnDSaPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nbxt/ftpNJ1ShMVco4IDA7Jd403W6SqtxsoLQwXqJTU=; b=BNAz8VpOKkgkO8Mp0qMMEJK0LU
	8WfF4z7dzfV/Wfa42wQbNhJdMZ3UaluNQh+6PZTzbLCvCFw1O4/WGrcuegeB3twoMpGhcaJV+dyKV
	IqAO+jPvCrgp8ajl7L2sNk85FDXGq6hVjLzaE4ZnxoPC3cy2cBdzyoa58GuYXDt52IfffW1UxIdxZ
	5dAWP4fCigMEzyUZAMllUdjZag6/stoB1lauhggqXWqokDMArHw6OKBC4RKhDhX2b8GmOqqxP7jIW
	Z9UDqI+4xIOKMmlAqEAJGkZ1Y4VM0kL4xuj1mJCSLh4UDE1WlnSiJZbzxAN1c2HHKbRvh6FDj893U
	7apjSMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZ7-00000007Shx-2K72;
	Wed, 11 Nov 2026 19:01:01 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZ4-00000007Sfz-2rfl
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:01:00 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-675617e81f9so3648163d50.3
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Nov 2026 11:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423657; x=1795028457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azizRUMCgRko1/GUha6IzG/UJcDkn0Qm2HTQ4Be0lk4=;
        b=iFnDSaPdugTCNRVzGpaKH0hKVlluQv2AyUmmp5YsFGClJ3XgyBh0XD5pt63+4Qn8ad
         qz/EZ4SXrPB7fa79K4M11Tyuq3duFm1MV4XanNh212SuPuezQ0xG72Ai4Sap/gLUujSM
         PkmmRS4ypa6KLrwIjJjAChihZM2RKDIgd2Cg1O3Dthc9nT4YwyWlBqz8OJh8KFRBI+b/
         tVNTM7+KVKOi6qDx76BIWhnAO0SZPnxLlNbeuu6QBHhRytG3E4laPqLhQAQhHLzQVHM1
         kEfc2hJ+fZBLXFtYtNom30n1DynBEnwTeyM5l4PVBkYPiIl2Ftm9pb5Gl7rFwfyc7+V3
         8nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423657; x=1795028457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=azizRUMCgRko1/GUha6IzG/UJcDkn0Qm2HTQ4Be0lk4=;
        b=NEn3hRQ3bkmK673cme0YmJ52PVSAJ/htzCq9qjSGSHGJKT8KIesuybsh27lImjcRud
         5r00/8IWJY2GOyybiwxkdUz0h2ArLBZEMkAI1u6mdc6v9udHuPzEW6Wd/KMJ6dY78MZn
         3yXiCO3vTxRLuzlGdoP8aG0eKETrKp7rpiXmzZpNC08C8a1gHWRrVMetNT8c3aJHvhjS
         jKYr/IHnbGisAaFQghw4D7bj50MiKomf+SkoFKOC6ETBRknp/giJgoyIyszmZ9GwV50x
         9WBYj41ISqqgRZI3w6SSwqzqGrThYDHuXgCpLYnOKPxdEX9W8x+us+iyRv8GzlXLFWta
         CqgA==
X-Forwarded-Encrypted: i=1; AL+hErF6skxtOVmtVPUQzP61Cow5OlmnhZjAPYY5x0QOJzZMqgAUTu5sw+OVv81B3H6txB/V71lSXP3MP28=@lists.infradead.org
X-Gm-Message-State: APuU4Z/gcaKKZII6ZcwUxW9HoOzb++GfxDJeIZH/KgGbQkuBkGmW1p+U
	TSe73BJ/elAigRyR0eQ1UGDG2j2X7HZicuMlficHCejTrf8VWG/Bok6VlpWkey0800U=
X-Gm-Gg: AYBFou27UtAgF2F/nNJLjXNyo6mTckAhLxB3bt8ZExSeCytqIriHAgCIFDY8gvvOKxP
	yMnXibAA6PP7snjA6mwneT0UNWzFybH0v2WB7BLBvdq/qQTnrYAyDKFsbPIW5zbQCvITttu+zOc
	4GzdaqVssvZ5ueqEXyqxxAxKwYDIXofszPYOAi/EKUEjbtXRiyj4SbDbyHdlBDZwj6P/nucCkm6
	Nfs2d07fcY6nb6qgRNpjUSoapmfTAkBvXb5bvYQ6oh1k6KrIoWbnbSBCK7qMs4Md1sRsXAPmqse
	LUYAoh0yAtLcP0ZTDXmbNlHhoni0jZtBzMpxjGbFHqlGCi9TRYLz9eOyAZCmj5xwyGy4KEwLBWE
	AdbhU1dC8dSvHyDt2ua/qYs8UC18flkAz34kP82pLQb5QjahLmPlNJjbIouLL+m07szO+VZyxKj
	d0WjkFkEPy8t5evWiw6ZtYi9XOaDB1alT9ahh9ZyyhK1j26fKJltj2CmHzkiOgWsz2BwjhhMZQD
	td9K4Ygi1HUv/23pu+1+9EXp+zlV5LZiioZP9LGpCbf0TKsYa4x2shwobz6q4iCRF5PgeEKUhz5
	ai6IZGFB2sIz6AA64sDbfRxiWpZhYsboIJMDePtRjS+yUqmsNVT3JCvVPzV2FQhKAvpYGvZSK1J
	iIFZsTbHUMyIedwm6w+qzta5D04U7MgzLjVnEga9cOY7oC+s=
X-Received: by 2002:a53:c685:0:b0:67b:fbde:ba75 with SMTP id 956f58d0204a3-67c67fe1b29mr1675254d50.71.1794423656063;
        Wed, 11 Nov 2026 11:00:56 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:00:55 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v7 1/6] riscv: vector: refactor vector context operations
Date: Wed, 11 Nov 2026 12:43:23 -0600
Message-ID: <20261111184359.1239821-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111184359.1239821-1-tchiu@tenstorrent.com>
References: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110058_769360_28FEC3E3 
X-CRM114-Status: GOOD (  13.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lift riscv_v_{enable,disable} out of __*vstate_{save,restore,discard} so
that we can reuse some functions without repeatedly turning on/off
vector.

Also, refactor and document about the user context save in preempt_v to
make code more readable.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v5:
 - rebase on top of the kvm fix[1]
Changelog v4:
 - fix an unused variable warning (Olof)
Changelog v3:
 - new patch since v3
---
 arch/riscv/include/asm/kvm_vcpu_vector.h |  8 ++++++--
 arch/riscv/include/asm/vector.h          | 15 ++++++++-------
 arch/riscv/kernel/kernel_mode_vector.c   |  4 ++++
 arch/riscv/kvm/vcpu.c                    |  2 +-
 arch/riscv/kvm/vcpu_vector.c             |  6 +++---
 5 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 50d4789b9cac..60fa28030944 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -16,14 +16,18 @@
 #ifdef CONFIG_RISCV_ISA_V
 #include <asm/kvm_host.h>
 
-static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
+static __always_inline void kvm_riscv_vector_save(struct kvm_cpu_context *context)
 {
+	riscv_v_enable();
 	__riscv_v_vstate_save(&context->vector, context->vector.datap);
+	riscv_v_disable();
 }
 
-static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+static __always_inline void kvm_riscv_vector_restore(struct kvm_cpu_context *context)
 {
+	riscv_v_enable();
 	__riscv_v_vstate_restore(&context->vector, context->vector.datap);
+	riscv_v_disable();
 }
 
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 3381a535abb4..8c88a2258e61 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -203,7 +203,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	__vstate_csr_save(save_to);
 	if (has_xtheadvector()) {
 		asm volatile (
@@ -232,7 +231,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			".option pop\n\t"
 			: "=&r" (vl), "+r" (datap) : : "memory");
 	}
-	riscv_v_disable();
 }
 
 static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
@@ -240,7 +238,6 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	if (has_xtheadvector()) {
 		asm volatile (
 			"mv t0, %0\n\t"
@@ -269,14 +266,12 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			: "=&r" (vl), "+r" (datap) : : "memory");
 	}
 	__vstate_csr_restore(restore_from);
-	riscv_v_disable();
 }
 
 static inline void __riscv_v_vstate_discard(void)
 {
 	unsigned long vl, vtype_inval = 1UL << (BITS_PER_LONG - 1);
 
-	riscv_v_enable();
 	if (has_xtheadvector())
 		asm volatile (THEAD_VSETVLI_T4X0E8M8D1 : : : "t4");
 	else
@@ -296,14 +291,14 @@ static inline void __riscv_v_vstate_discard(void)
 		"vsetvl		%0, x0, %1\n\t"
 		".option pop\n\t"
 		: "=&r" (vl) : "r" (vtype_inval));
-
-	riscv_v_disable();
 }
 
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_enable();
 		__riscv_v_vstate_discard();
+		riscv_v_disable();
 		__riscv_v_vstate_dirty(regs);
 	}
 }
@@ -312,7 +307,9 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
+		riscv_v_enable();
 		__riscv_v_vstate_save(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -323,7 +320,9 @@ static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 	WARN_ON_ONCE(preemptible());
 
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_enable();
 		__riscv_v_vstate_restore(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -385,8 +384,10 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			riscv_v_disable();
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
 		} else if (riscv_preempt_v_dirty(prev)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(prev);
 		}
 	} else {
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index b9481a3e40e3..280180114899 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -171,7 +171,9 @@ static int riscv_v_start_kernel_context(void)
 		WARN_ON(riscv_v_ctx_get_depth() == 0);
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(current);
 		}
 		riscv_preempt_v_set_restore(current);
@@ -215,7 +217,9 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	depth = riscv_v_ctx_get_depth();
 	if (depth == 0) {
 		if (riscv_preempt_v_restore(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_restore(vstate, vstate->datap);
+			riscv_v_disable();
 			__riscv_v_vstate_clean(regs);
 			riscv_preempt_v_reset_flags();
 		}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index dd786f758eb7..caf6e0ad72ef 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -825,7 +825,7 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
 		current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
 		current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
-		__kvm_riscv_vector_restore(gcntx);
+		kvm_riscv_vector_restore(gcntx);
 		gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
 	}
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index fefc2857f753..730c32f7de50 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -47,7 +47,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
 		if (riscv_isa_extension_available(isa, V))
-			__kvm_riscv_vector_save(cntx);
+			kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
 }
@@ -65,13 +65,13 @@ void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
 {
 	/* No need to check host sstatus as it can be modified outside */
 	if (!kvm_riscv_isa_check_host(V))
-		__kvm_riscv_vector_save(cntx);
+		kvm_riscv_vector_save(cntx);
 }
 
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
 	if (!kvm_riscv_isa_check_host(V))
-		__kvm_riscv_vector_restore(cntx);
+		kvm_riscv_vector_restore(cntx);
 	riscv_v_flags_set(riscv_v_flags() & ~(RISCV_V_VCPU_CTX | RISCV_V_VCPU_NEED_RESTORE));
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
