Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BA9C531C9
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4yVDxr7CIggJQ7/ZS18/p5yFwqzQqH3dqKBQpRobmE=; b=TTG32Z5VAWtyHk
	K9FGM+gEfvZuJUwOvlfrUMduNDpU5kxaFcbC6dII5c2QGT/dfH+L5JBxqGj+5UJEpTHCMisG0/EU3
	7JbGH9kdVpV4xP8emnRTm0CA28qp/OcoJIklr8aLxyHawRwhw9Q5ET7ceFvuOgRXuTanl4H8Zm+jB
	PTs0lM3BZym2tOmQWnIO6s6Mhcv1WrllodN8+lIHhsEgC9Xx+Y91V8rENZBITkmbJ/h8RNMH/2yG/
	a349ANxUQ3tCdIYwF7wil88I2UA93ai8jyuQQXvU7MpUoNz/jzctiOUf3s2tpSd0rab5fpzi9jxFj
	eazkKea4N7ULuH03gx6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5X-0000000HOl5-2Rp3;
	Sat, 25 Jul 2026 00:17:59 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ5U-0000000HOhc-2jjx
	for kvm-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:17:57 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6aae3e18607so401954eaf.3
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938675; x=1785543475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=ZZ9ritQvimZh2hxRa+uS+KKHAmCvq1JHdQOpEgnuDz3AQTfxWDQHLlS0GxqBaplfrP
         3ksIYJEDn6iyrLNDKIJvWgSG6VQvQW8EbSJtP4dq67L0F+KySd2Y9IhxS4srNIK/W7Sr
         6Gyln4e+rSciTRg7IlPbeEXJy5pfxNd0IvBb8ejKBVS5Z6GLzf9mkpH2cMep3Uuu+e8e
         9+PBaCz2az33YRowshEt1AOlffcJi7EMuXQLmg1wL2sr3k2d+x08na5fmE6/w/YoBQpF
         CxyfqiX8UIYgwV1Q/WEJl6DYzTCTGhIntiiqSjvEsogoZnGSMuu0e74GHTe7cDiEEQHr
         h6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938675; x=1785543475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=PlD91CDBqAWEvcQL3QCESsQnH2SHJM3rg/qUXtPv1tVmGZNgFQuwacTwlvaioKCSda
         E6G42KbRL/TBAHQA3BEm1PP2d/WoqvOlR2c01STF6bMoPgatl9h9AMjvqPgvoUHGw/bC
         xsvf5ShXyxrKimK8eHoFYIi5KurB9NmxhxbiEImqm0ekfzhRME9PzE4BlEqqp6W+4a19
         UJelrvcKVZtVevoHOM6a/QXjtjtUOm1UQESHLjp1zRA98asL4ZaPbo42ZVFfphxc/B7N
         7vKPw548gQxbj2PZGqSYv0gfIn5KMF/LIaZQ/otxHYgf3CGAQs/8UoWpEI3es5LzTLD9
         534g==
X-Gm-Message-State: AOJu0YzOdNcktuIIKAH9a9UahtRe7CuXTc3ofcFMXJqnj0DlMdEouNiQ
	ds7YyAzc/gC4GCWQn904jM7zV2WZE1KPkcFxP0lJNxQG0AlvPRthYbIfkX4MYh8OhOU=
X-Gm-Gg: AR+sD10aufhWNPq5zweNNSwOFZPjTxbSFUqF9Sehrx9Haj/JlLQt0tVJUFNHtXijIas
	r1nI/8jQ/cCtYs2WH2iExkFwoGgJUWxUY7QyJhVdUNhjkl65xhOpGz/jD7ST84zhJWwGEK3Prfn
	DVFmamFfhgsABmLuzF8dwYy/k7xpIC36x1mJWmWOXMpJDjQIrjpywBtoLsv/iOOYfG+2hJP70Xx
	R0xGR4izKiwTglwQc8gKyxTxZOtREbyj23Y3u2vcPBEBkejZ4BCTtFVq8wfKOfEcseO8Qs63cI3
	lteCy1X584aA+tZ+QqjuEI1MMz5sA8VL9FY71NUPT+u+lzRvvFioZkjZfl1Rh5UB1poo7qfHxt2
	HioLU980NaiqrIvMOs9QlfUNk4UxNCFZeT4tRYLKUVT41e7YRRzhvTb16qcOG7MkcnoCiUJ9BAT
	ENeVU8uKDF8ZZjFRZzPNDrSb5BYcV6BqiMRcM=
X-Received: by 2002:a05:6820:f026:b0:6a1:83aa:4439 with SMTP id 006d021491bc7-6aaff86707amr474448eaf.18.1784938675558;
        Fri, 24 Jul 2026 17:17:55 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm884057eaf.7.2026.07.24.17.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:17:55 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v4 1/3] riscv: vector: refactor riscv_v_start_kernel_context
Date: Fri, 24 Jul 2026 19:17:40 -0500
Message-ID: <20260725001749.2579274-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725001749.2579274-1-tchiu@tenstorrent.com>
References: <20260725001749.2579274-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171756_689410_CFA522E8 
X-CRM114-Status: GOOD (  10.25  )
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

Refactor riscv_v_start_kernel_context() to drop `is_nested` variable and
simplify the logic.

This introduces no functional change and works as a preparatory patch for
the kernel-mode vector fix.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/kernel/kernel_mode_vector.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 99972a48e86b..307ac369c3d4 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -121,7 +121,7 @@ static int riscv_v_stop_kernel_context(void)
 	return 0;
 }
 
-static int riscv_v_start_kernel_context(bool *is_nested)
+static int riscv_v_start_kernel_context(void)
 {
 	struct __riscv_v_ext_state *kvstate, *uvstate;
 
@@ -131,7 +131,6 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 
 	if (riscv_preempt_v_started(current)) {
 		WARN_ON(riscv_v_ctx_get_depth() == 0);
-		*is_nested = true;
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
@@ -148,6 +147,7 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 		__riscv_v_vstate_save(uvstate, uvstate->datap);
 	}
 	riscv_preempt_v_clear_dirty(current);
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
 	return 0;
 }
 
@@ -187,7 +187,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	}
 }
 #else
-#define riscv_v_start_kernel_context(nested)	(-ENOENT)
+#define riscv_v_start_kernel_context()		(-ENOENT)
 #define riscv_v_stop_kernel_context()		(-ENOENT)
 #endif /* CONFIG_RISCV_ISA_V_PREEMPTIVE */
 
@@ -206,20 +206,16 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
  */
 void kernel_vector_begin(void)
 {
-	bool nested = false;
-
 	if (WARN_ON(!(has_vector() || has_xtheadvector())))
 		return;
 
 	BUG_ON(!may_use_simd());
 
-	if (riscv_v_start_kernel_context(&nested)) {
+	if (riscv_v_start_kernel_context()) {
 		get_cpu_vector_context();
 		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-	}
-
-	if (!nested)
 		riscv_v_vstate_set_restore(current, task_pt_regs(current));
+	}
 
 	riscv_v_enable();
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
