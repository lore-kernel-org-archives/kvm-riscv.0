Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA297C531C9
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmjR8cYA1lv8WHPY2U0JTuooVhJIZG5E50Qbwb2tZ+s=; b=XCxJXEvlI6YtwI
	GPq0JE9wpS/dh8lAi9BI3w9k6NumhSxBWzxm78B5NS/5TUETWIavbv6R+idYFD+tX2MOspooAEV+u
	kWt2IwE0Jd2rHJvvMHwaDGGH+d3Pn8dfJth5sec4IAeQCoEeRkhyGSJIVlOApjYbTonMtDMLRPcCi
	PNQuhaDsn20aTlwmCH8DhWGeWwnIWJjGJj2l1DoHbfvOepAmxFqYHRVZ94qOiMwDPTjehI7f5aURS
	9Tq87Mt1P4ZVZLoqgzQbyz413WWHabXBYLCP4rZasUsTbvposHCI1aE6WwgCBhxtDZFm3nj//G9ah
	IU2TjUQTyRDngMHFXa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6O-0000000GsYr-1H2W;
	Fri, 24 Jul 2026 16:50:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6N-0000000GsY0-1Bfp
	for kvm-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 16:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5IUFt86dCMeouqveB0y7ovO9azpKFmoPUqPgEE244Qc=; b=g19vi65e7dkYJuXOg0lTn3fBqo
	wFIU52lTnWXj5wjH7YGMsmVvj9B7auS0EcBUgOXcItx8qqNOF6R+gwmMR+vkGyM47QcvyYvNq/sdU
	YSKF5h7FeBGQ61OGOvnGi3N7cPV40jPTn/oLMqDHzLoNgUUPewwxULnSQ72uHbQZgDMSfaPKRTG00
	AfCO6gs11k2hjFnBph4UPB8jpewD5cy4XmZyk62SeDCXJrSKa1SRx5AY1h3qk1p3lMzSZb055GCIz
	o4os/bRqpA9c9u6ZGvWuX03gFlzfy1W+yMk8WMKtXexR2bRc1CJLN3Of9wiGixNTzYAltIFW0P8uA
	umHPOHzQ==;
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnJ6K-00000002mVn-1Jw3
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 16:50:22 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6aae11ddd13so373749eaf.3
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Jul 2026 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784911818; x=1785516618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IUFt86dCMeouqveB0y7ovO9azpKFmoPUqPgEE244Qc=;
        b=ACZBbQkG3uiW3w4+pk404pyrVl1N1AaSYD4CDzX7Hvrp+l+e8DNJC3c+9aqwY7T/bJ
         DtaNP1661jA19EkNkCh/36c453of7JMr7K2/VnUvFMfXUUrG7FyBoRj6z8bGk1OGIBGJ
         I2vKYqcCUp1zZIC3Ddf85WRYG6IgjHybgACgJv1zJ/hp0J6RplkiyLKbLPE82n67MyrE
         6iSfNsMwkjftUFuMktj72/vW6+CZ+ABeeYbCNLOwWk2xc9h5sdQOt2ROK5PRnH/GOqq4
         DddXz1dWFvAJkDkWu2yiXngCPdPa8VlT2svkIWmlj2iFmDvrcD4yT51TiEHwOQNbVqDM
         6PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911818; x=1785516618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IUFt86dCMeouqveB0y7ovO9azpKFmoPUqPgEE244Qc=;
        b=oe9VbBoZJT/XipHUdVDwXK8d5gipOaAVJlwjNm4BrX/+Vbs16gL47la3Qlru0+Wij1
         z47iAAdTxcFsFApEwacJUKBaKhrh/5j372ML6NDtTU387lg8bDWnB6i6sf6qoJHCRJ2s
         4MyNb4SI2B5MRaBUuZAuu9x2TYI+eO9rBPLoWHFKT2fNuJ/SfJXXH6WfiM+nF43Gff3r
         pyXFN1PeS2wdgNBqDGlwx6dx+KEYfcVm2ChzrGrOeGgywqjzZqDTQiSS1Zl4nsO8+a19
         jG044XDCJaExNnxZTm9RZ/pqYiTR1tQjhvvQ/g9mBgzN0SIQAhMsq9OJRMspmY/y+ZWi
         G6fA==
X-Gm-Message-State: AOJu0YxOd95glzcmicpjSGkZXBalD5I/iMBqCwfi9jMmfyOHezhC9rWL
	4pA0L623zmNjLUPuKjH8bt3SBSZvj6cyo2/VXL0JSxusVuDGoYrIbwl77Ts6a0Jf9Zc=
X-Gm-Gg: AR+sD132BGKdM562ffp/sRWbRIPKUQ36zX5UgLAKLQBk+vAsT8c+MwuNHJDu4vR9vzT
	yVC4vQ4h1w6gCM+N1dGVqWHXp1am6l36TEomNhcw9c7GrHNnV7FVb/wr0qs3k0UjWS07g+GbuKp
	IKW4gWBRi8a06tICEhbpigpEUkHOFtKIfrBfqhndoyJuGAzT8iEb4l+P3J1gONqYvwVR/8ie5kS
	1MQHKMNNcB4CpEFQAa4VTG/9DP9c9gGBoxmCJ/DOjNUby75rfsh28dVo5odOioKK0nvaWPACcHC
	b4q7n0/+dfJ/BMWWTRN+KrE0uZhXx1lV56HTW+J01Po+1CCJ2IyQW2Wwxrg4vb0bPZbLCK/1FKe
	yvb3ucc0BHZ/8yy5P/2tMyfY62p4IZUAMB9JBNTN49PRzRENb0cadFFaiQGXGJyX4BjPN4/0tnT
	LODouO0UGX1NnhkSd3187I8VGdXdsmgjKqI9o=
X-Received: by 2002:a05:6820:4c03:b0:6a3:8cf6:fdf6 with SMTP id 006d021491bc7-6aad418cb97mr4265835eaf.48.1784911818341;
        Fri, 24 Jul 2026 09:50:18 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f4501sm210882eaf.12.2026.07.24.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:50:18 -0700 (PDT)
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
Subject: [PATCH v3 2/3] riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
Date: Fri, 24 Jul 2026 11:49:53 -0500
Message-ID: <20260724165001.2317788-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724165001.2317788-1-tchiu@tenstorrent.com>
References: <20260724165001.2317788-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_175020_483945_459C347B 
X-CRM114-Status: GOOD (  13.72  )
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
Changelog v3:
 - Export {get,put}_cpu_vector_context() to only kvm modules (Sebastian)
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
index 307ac369c3d4..f76e52de1117 100644
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
+EXPORT_SYMBOL_FOR_KVM(get_cpu_vector_context);
 
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
+EXPORT_SYMBOL_FOR_KVM(put_cpu_vector_context);
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
