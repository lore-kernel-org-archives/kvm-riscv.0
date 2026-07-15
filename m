Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97495C4450C
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mN7SsKts5tZ5yHsB3oQ2eN2DMaDKBZoQibxYPOEve6c=; b=Tsf6tq7BV6iQt7
	7HKRqnHM8MUsE40wAKNpw1xF9U6guRKn0+a8f6kOCki538BZJhVSYKudQZTYWVYjpAekWt5K8Hrzn
	VIXQADa414fWJJzddLU7b7VTuvuHhlwQKLwbTkJFmJnVjG9rFKfioBwhmcK38wah/28WXCP/bjizh
	q80bHi7U1pV4xom+SoZt4Fsw7r6IXsBbOYjqi/qxbuRyXuolMob08GQRWwfF9SODZUtIrwXDklP1c
	8iklfr06D9tPMLdx3qCeY6eO9fWUEsZ7xYEkVA4fulKzcxeb530R4kcVwaQDJUEglSjHMkoFmyWns
	g1wMbpCOW2NUqg+iH3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrza-0000000Dmjv-1Esz;
	Wed, 15 Jul 2026 05:17:10 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzY-0000000DmhK-0d1h
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 05:17:09 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-81ead20e4a0so18565747b3.1
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784092627; x=1784697427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mLoZb5ms98D0YoseVgyr3YqsEnYg/BNwWq+M/OSz/0=;
        b=VvdSvt935REc+GrkE2ZJ4Jy90MHiVTrDiFfZ0B7l68kJf3bZUNWmuG63k7ENKdpTYV
         tMBkA4LldkwgdURUE+PtkDLhtVg4PEPlQdRvG5f1+r8H8AIxSJFsbNHl22BDyUDgNITS
         D12lVBhgEk27uyTRNsnb5nRFwNv0q4LHExLZkFkzSmS27R3Gab0d5u60iYx9g8B6rfM+
         O3sKKBjEyIHAWrnkGcv53wiqiXPKHPLOibYFFfPp0TjA4C6NuSHwfDralKEMZnRa214e
         3I+B9v+mOJyq+z9hzcEoNLjrS2fJqTWXXswcaGBS7TEMhMvQ5FyqP6LXyLn6FlCMWx0c
         2I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092627; x=1784697427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mLoZb5ms98D0YoseVgyr3YqsEnYg/BNwWq+M/OSz/0=;
        b=KsKw0vhg/3Edcki6g+/C9/nZJfpuBe9W1LzwUWBj5K8l1aPN2JsUazdBeLGnvQS/k3
         k9xffpPRq6KNvVVRrt//WRkleOv+TT/JjUhBSp0zfusqxHfkP8YGQBRnPn+0BYzVjiyW
         h+YbA1jyf5Iri00nD7B3c2ucAm8Od3VQB5lfbinL/2xDfeMUld65dm4dtgfGskBmlDvW
         grMwOdkMQNrI+cWaX8JQS4SW7mAskHiDa5OCnax0IPCdVH09remvTUaFza5jW6oqKnCm
         NfuEBsNu9pCDFdALiegR1FtcSjeZME42CjocRrp2D/v9NhjmU0sLhiBGIX2xPz29btZm
         5ZoQ==
X-Gm-Message-State: AOJu0YzVeczLL+eJZLGawLv6xUgJmY+CKLyQF0F2uQYsigEtwFh6mqgR
	vjDNZb6Gs+Qrfq9V8d0YNl322sMaGvKgqVaY1f87hC7qVZxEfSem0l0xdCTk4jayOJrtNKn9d8Y
	Mf9nTM7U=
X-Gm-Gg: AfdE7cn6a1N5B03RMCVLNs0r2NqfoCyCQnvjPV4H32pJ9aFzFOyTAGm+Ck1j/j64ih4
	hxCAJYhjDyAgI4nekPbjF6UB+hDjE0k2paDR2PigKCWQN59/rOZTz5qp/8vFs4SXryZjVVt2ksz
	YwBYfxKrXGQSsHZMaOAVwc5CDu0+YuX/kNKOqtzMceUh/LT+9ZUI0wdnO7ims0MqViZSlt/2vLW
	OBIgCu+yEfzGTSCg6DlfZeCztJTvW29Q5c2YkOSD/yGZM2lbXLwor7eYEESOTV79f5WElXKi72i
	KTeCgXK2/ylY2DoRNGKH7ukADwSq/2qNokm4MqgTuO6gh7LGPnJyCGI8bXHfrpqaRIddOdVyH0v
	ICGBBBogLFmXqer+lRM/5JOu0KevlSsfLm7A7JZK4dgKDWxliLN9pVrbeMaBMdYdlcnRD1DX88r
	uit15zDmz+LZAMoiotgGXdNWhc3N3y17go6zEEIzhBgkt/h/a7sWRDE6l0zS+71f/b0mBk4gBX8
	wjBIZ01Tw4PqWZsTX5e01APWzMDb+FORH0rmiRUI/z735Upgpg=
X-Received: by 2002:a05:690c:6d0d:b0:81e:c972:e8c3 with SMTP id 00721157ae682-81ec972e93emr25328327b3.29.1784092627340;
        Tue, 14 Jul 2026 22:17:07 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm159625657b3.46.2026.07.14.22.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:17:07 -0700 (PDT)
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
Subject: [PATCH v2 2/3] riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
Date: Wed, 15 Jul 2026 00:16:21 -0500
Message-ID: <20260715051629.1169645-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051629.1169645-1-tchiu@tenstorrent.com>
References: <20260715051629.1169645-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_221708_236852_F95268CC 
X-CRM114-Status: GOOD (  13.63  )
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

Also, export both symbols so kvm module can call into it.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v2:
 - new patch since v2
---
 arch/riscv/include/asm/simd.h          |  8 ++------
 arch/riscv/kernel/kernel_mode_vector.c | 18 ++++++++++++------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index adb50f3ec205..678c8b97cd49 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -44,12 +44,8 @@ static __must_check inline bool may_use_simd(void)
 		if (!riscv_preempt_v_started(current))
 			return true;
 	}
-	/*
-	 * Non-preemptible kernel-mode Vector temporarily disables bh. So we
-	 * must not return true on irq_disabled(). Otherwise we would fail the
-	 * lockdep check calling local_bh_enable()
-	 */
-	return !irqs_disabled() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+
+	return !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 307ac369c3d4..6627e1a82e19 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -55,13 +55,16 @@ void get_cpu_vector_context(void)
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
+EXPORT_SYMBOL_GPL(get_cpu_vector_context);
 
 /*
  * Release the CPU vector context.
@@ -74,11 +77,14 @@ void put_cpu_vector_context(void)
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
+EXPORT_SYMBOL_GPL(put_cpu_vector_context);
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
