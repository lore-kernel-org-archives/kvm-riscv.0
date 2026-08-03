Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E29C55822
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 21:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4yVDxr7CIggJQ7/ZS18/p5yFwqzQqH3dqKBQpRobmE=; b=G9Fjdevc1MgePZ
	IwsMkRqRqahc0XySHQahVnyDbzhTS7DSb3EhHE86PqREfVHqUzE+fyGX6AFWL4aAvpMcGLWgKsuKz
	VWCPlEDF3KKfb7Hzv56duoBtkpzBaiOvEWxIExKbAIExvUUQpEEKMunyJ4rEeKojebiAeoK9urg7F
	9FC4SKROOM0MgX+g0cwP7js+pdpx1Ob6hPhJ0R7RQnjrsdRuvghj7/WbVx2lLxu7n6I/SJ7NUk5iu
	5d8X7kr2gEoBKIcFD/2C5Mwdm9NBkawmD1puQ74W48z0NmSRmu62N7jqWWt4dHuyEA7Pwk7+b0VGQ
	+xK71ZNp04tASFWjUalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0ay-00000000Yhj-33bc;
	Mon, 03 Aug 2026 21:53:16 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0aw-00000000Ygc-3XzM
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 21:53:16 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7e6b5737bb2so3516810a34.1
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Aug 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785793994; x=1786398794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=D5LB0ir8sKxFV7RHZo4W/Q9pcwAil5p7faVsOFIGgUvOiNfKleh4NEAciLdNqoirIw
         nAcY+Kj4ealggItoo4f3G3cETmn46TA7RS4JSf71OOGwZLAeBBRiqRDKnzjx4rNETNW0
         ivY/XLajkwg1SRUd9S/Lm1Ei4BCDQXy9K61QFVSqJaXCXIsZodPNYMZWvJ2WWZkdvxkv
         y3iRBYg1Tk3dDK2Q5oZGMP3dQY6fmJoIk16H9ngfnX0+Lt0Vdu2oii9fXFo6P8XjKWi1
         y3bluW32fFlpqzLAq/026m11wis5cC/dq9PSfNChO9h/FCPI8+5IwRlKHOM4j/VTH8p+
         yJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785793994; x=1786398794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhanRwh7zvnbA5tn7sDwLMiOA0lv2Dx4b1vq2Go0n2s=;
        b=hSIpKN+kC5FQMpTJHo6/EcK4M4V/fe0FmhxjIlK+ZcNpglWj44QfFNi8zlao1f8RFW
         i1Xr0dYhlLmFeuPmLDKCGZ/gtmXJtYyfQE2a5d82zOyecpFIRCwQMrbx7IYXHDYOKL1S
         3aw4/cLAw1j0by+bOuaE8KMXfgvH/XlZmiUvEulS3k2e0prOtipNs589o8iPD52VcLLW
         4XBp/ReNomzZfYZhCYv4BwEg+a3fzS0QDKaxDZExB4USl0df7XX6GWA//209GltEO2jC
         qHd1YqHgDOHITN3VvaT9QCS4lPKLM5NRlptvHf0CbvZ0XXbCG1lnQcSIdR4UnxXfqcJC
         1esA==
X-Gm-Message-State: AOJu0Yzqyd8EMu6bE18DDMB9v9n2RTWymogAbqHo5vPRLK1fV1YY7+Y4
	d+/I9rlzqEgymQyrnw3LO173cpgGaZ/OvWgzlrZMHlT1SpQdJ/iOPhWI5vC+AofVOp0=
X-Gm-Gg: AR+sD12g9SeXL+TZpWE58x4O04IIgfPhEAZvgvRZds5FnY/qLIBOMgcNr3K+VZVUPb4
	Xr2HS6A8i8nT61UbGfwp4BIm5ikNGb2p06vCsAOAdqJUgW7CMKm8+WT3lqXwad9y9v+ifZrNyUD
	nHbzin36duI9lMCCyXoDdU4JZsltg3t5B7eWXKrCh0M/fw0/LqenlEE06dwgKQ6Q6f5ktL2pXMM
	+n1ddVhdDR3hSjGcj374pXo0F6tcam20rQh4dhWe+ekidEKaWDFF3zQz2aG4CxGtFFkbc6gF8jB
	EHGZX837xuYIIPqk/pSsxyV4XXuDTsB4VApRj947xrC69GNYHJIGSDPwoW2O42bEgdnp5yIsylE
	8WgFyRVIP/YE8IH9Bh367gE5AHBxW3EkE+I+PVh90c9OpVZsGYAhDzDiNHtqGuOhcXLpAprMEYH
	nspx1Sal/dgC7sPkOz0zW3ONpu46wdD8Bbap7QJgm6f9uQr9DQ5OLTFnCS5hch3+pd1F0eZiUiu
	5pm1YwNBsM5DyWAmIsJ6UEUNnU=
X-Received: by 2002:a05:6808:1a27:b0:486:560d:aa91 with SMTP id 5614622812f47-4af5e2c78b6mr17292705b6e.19.1785793994126;
        Mon, 03 Aug 2026 14:53:14 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9551dsm7403958b6e.11.2026.08.03.14.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:53:13 -0700 (PDT)
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
	greentime.hu@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 1/3] riscv: vector: refactor riscv_v_start_kernel_context
Date: Mon,  3 Aug 2026 16:52:40 -0500
Message-ID: <20260803215250.824417-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803215250.824417-1-tchiu@tenstorrent.com>
References: <20260803215250.824417-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145314_892784_6B0DE3CC 
X-CRM114-Status: GOOD (  11.17  )
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
