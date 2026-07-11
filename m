Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8A7C44501
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 01:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4yVDxr7CIggJQ7/ZS18/p5yFwqzQqH3dqKBQpRobmE=; b=h/LkTJz5hB56bl
	n4hjx9E7V4Zm9ycoGZwvirONxCHlDbsMUJKjZyD+OEgxqzCDZaaFFRIT6vK0Im7GMZlJuDnK/IlV8
	yu4reZk6dkSIVko5jvj4R0LApaa8V5XWkD+jUHSwTPYlxeJXUvSmhpADWIkHrcbvZOD/ER/lmQ+tV
	mBRTXy0/zVYTdgcoeTMpUSS67WuB2DIzKNqRXB+qFBTlhQd+GFMcQdlIIOgPEID4mBOJ03e1IY6NI
	UdAZOIYdrU7IRqwO2SgCflvQm3ePsDCZmJXg7aju3/2GzGbKLiI/6BCunMwz/9mBtlIXFGGvBhIyh
	pr3apJudRIrU6K1nVZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN05-000000067Fm-3kRT;
	Sat, 11 Jul 2026 01:59:29 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN03-000000067Eq-2inu
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 01:59:28 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-664ce3000e6so1521096d50.0
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jul 2026 18:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783735166; x=1784339966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=bQS+0Ghuf84PwSucNgbjX6iPV2msft7YRtaCmrS0H8vGRNNcB5RNIb5YXkb2rY4+tz
         pNlPE2H+NVHqEKKkryigSkr29BBs/aGdk8xhLUFqAIMt3z5iNWvWMu8k4TrUJbdJLPit
         rKqxKW6zGBCKM7XhYlzp+BWORTDYyrEkaKhpv5YvExYBuIKhRuGUsWlW7akXAONzEueA
         wR49FCTEw1zh2zGq+ek/ovwsy5DRSVY8o88ifbNzbthGuhwrMrQdHOI4VsGdHJU//hZC
         WNZz/3GZNfp8ZD2SwuEO8IitdUG1r2W3loPhpIH2CBHFD2Kibks1yJE1/OXQr4u57IGr
         Iizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783735166; x=1784339966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=b7wmXfLZyev4Swxeuuk4Pon5m2bR130VT0oLrsUEOpJFlGwIw3pTDe1SDDWF0dyfg+
         1n64EmNp5GxSHjAOHgP8qoy6/KTFWVjLjkpirMfE1+xAKboX5fW5pxBDymmafxTi4Qsi
         Tk6LKEBED++omADUeUuRX/4J3IAkRTBL+nWLJlAr45OdV0qQH1xYHADOt/5JI0dqtMLT
         grJutM/IP/OyDQ9mj2pM1oIHb2uSDfz0yyY1GDDNcDrUhveUrabYPSfjD7iS/n1ppna6
         1ifVicsbiMEi6FinNoKwWXaiXbzd1VINLTQaRs+PKvtb0NDUNNmOC0BePGLLDC8Lefe7
         JKsA==
X-Gm-Message-State: AOJu0Yx5O37lZAUikwM7wB2YKzh98qtWGEmBGqd2MDx4gp/MUBnvxaF4
	pMkXJANYBnEeh3+uyxoGAeZoQ+4r+uJtiWMrRUmBHnUvGGSblTZAJ+GfRCd6CQ0pwiU=
X-Gm-Gg: AfdE7ckBIaUKbOmz/OWBVczcocQK0RYT379jBB9Rvkt3VQ+oDeWL2Re51Zizp2GxVZH
	98eaKWlpPCCjHqTtOGV/cBC2OaSa0vjQsRHMmkqpqvd6nB1bXY8TmJu2InmnRnJANCi+TBSX1BA
	9Sb7TJqX+udz5Thqc9FWO7IPWaZGdRLJixsy4e0DvKquLv7TSOsjm4czi/jwLiro00J5SQpblAj
	bSYlYCCau8RL11XfEAcOXX9gyiPRyKW74FWqXyQI07cgcuU1hNjWXAQl0Rue9hO9cYxwbZdN1g1
	8KcBgQdsEyEdvmzw5l61ZuNtS2t18+M4dEeHc/Z2WWau0LAGYsWE0nEBbvLVrLpOZIo+CfY5yRK
	xAjBXJXm7TOo0d6Ec42GPgeigSKn/Tg44kUPHXMxqR//d5IhnUimFB7Jnc6j25FfZoYkyiGEB1s
	f98W+uubV5W4N1oxLQSdyy9hABZ0B3bnQZ/RBpCQivEkBZR2cQqFwugwrDuvhoXOERMdYbCWXm3
	eJy59y7rT8fddLbnVCLI+9o3WBIMA==
X-Received: by 2002:a05:690c:7404:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81e90010871mr9039157b3.5.1783735166470;
        Fri, 10 Jul 2026 18:59:26 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm61316497b3.14.2026.07.10.18.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:59:26 -0700 (PDT)
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
Subject: [PATCH v1 1/2] riscv: vector: refactor riscv_v_start_kernel_context
Date: Fri, 10 Jul 2026 20:58:29 -0500
Message-ID: <20260711015835.767259-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711015835.767259-1-tchiu@tenstorrent.com>
References: <20260711015835.767259-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_185927_692221_F5003005 
X-CRM114-Status: GOOD (  10.55  )
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
