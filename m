Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09975C19F2E
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkgZoggtPNTM5wPBb6nosroVCzDzhzEYJ9JMT6FShT4=; b=V0qs4cs3IZEyw2
	y2LRK9VgnLHIybgKCTY/HWPq2/BaRy7oVZ4Ohvyjeot6Q+W/rbvlk+dLFUoBiLeAKHIYrvQ+joTRD
	EOjD0ZFiQjVoNIM3Wzn3H/7PrSGuF0az8cIfH4Hz4ixcc1U0PiGIKs/Ve5Pja4RyiUSg8Be9MxthH
	4fVjB06bBy2wN6AlTsxaglLKdCa5xEiBlZsQ8nDFvk+axiuoGSEporNbrXEf4sfsTQv2T1r8495i4
	mvq3p56dgQYLQliHD7yG5IBpGQOEBAkb9hd2R2Lah4XaF4SdA5nkNRXinxpJ7YZC22UgMwOH0ygZp
	YiQ0an8diHhGzldlxwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1C-00000005LEd-3J7c;
	Wed, 26 Feb 2025 20:28:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxx-00000005KQs-1ZrP
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2234e5347e2so1668645ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601512; x=1741206312; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElQVVHGvy1PCJJEf3x7O3Wq4GDtnkpov0IINkskU+dk=;
        b=y1U2GVrloXOUtcxXnO7FFCq/QNm4YpnpFWjEb4jdr8meEyTx1GimBN7icSKKhhSoJb
         oaJvKTGHUisCKL7j76IT7YbPIc9RrY64KFEGCjjGZBtoxw8lW51+rlpriGcFOtl9cqfL
         nZNZc9UYVJwzv0Lwf1LfURRE9dlWMi+WtYuxWjqc5FN2epDK907pTN7U0pkrqUAWYryt
         cx6q0jzTH9Nfb9kHX0BGn8hIr7vzKvYxQ8pROORKVON8yQZ2zrFWp+f3dehRyF4kZGC8
         Y6SoRf71SjF7R8ZCH3hCjXNI5CRCvMf3X17WK0PJPJ7+vAPlmKUv3EGLfswvrgsF1SIw
         n0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601512; x=1741206312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElQVVHGvy1PCJJEf3x7O3Wq4GDtnkpov0IINkskU+dk=;
        b=OHlHrZh7VKQYBs67TxFsyLhZNoOSWwO+eu7Yi/n6T/i+EHVgXZhQGW2t0v0aZ8Dx8d
         RX4rWVkSE9mONGCAfdtByDTzozfXMTeskBCKut0fUQQOzRkiHL4FPNURz6eQ7WuBPBt+
         Wir37n2Aj0pnaL0LkgZWpFB/mNF4AX+aGNaiQclhOojD+kAYsKyNB9+7oeNX4ML7kaeE
         Qv6CEBZ2EIAPq7su4yqS/HAgdkhXALEWVqx8Na3vI6qo1BrQ1IQlUVgcMBIic/SNq1Z4
         I/NQDGkHf2pau6ChrcnS4Gkq1wIvSFvDT8sJdx06Y9Jd1S8G5m374/oNFSUU2GLUKKNY
         kIBw==
X-Forwarded-Encrypted: i=1; AJvYcCVIXwcJmgfh/Upk9BmJE6meTdR/mcIYz+FBCseqCMoHcnJ5UVC1jA5K4vMMlKTxVaJTr5CwhdoneUo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxG06HxR9bqzRzRzyFPl2EjmxPT7Z/eqQWB/dXkbH8i8Feh+hJy
	jLxs9yBjtKnhGXjNj4jgYEhnQ76mKqOkvdyMDToQyK2fXKNaPMXBhn7pfVr7X24=
X-Gm-Gg: ASbGncvX4uEDGwVVlVUyaHvq2QXqfsXDmB7YfQyOyeZ8YOZUbZBIIkaJWr2SO2Hstnr
	u7yyFIPAPEk4LNuv3vQuqQ0/1PrplrqWOtZeQF7B3/rl3OC/uamNucvlzbsQL9lcY/QF6qeBJoq
	/cWZJb7FzESa+J5+PTNhkSGhwkP6W6yERxI3cRPItQufFZwVNkhlmkonjhpfEWmPxbE9VF/t+KD
	Z3Sr4yaaZKtt2F2qttiQaI6zaxHoDt0ajHPoHOWBgBFxriucUOPA7JQIL3PnNUv5dJ/g+9ydDdm
	Hi5EYmD7xe6Zdt6F+IHYEbhyF8ULU8zemMdHOb0=
X-Google-Smtp-Source: AGHT+IFqbgodjU8bkbuDJlr/kSmLoWQ/SEWprjRdiuzVEUOwMd31NiSuNQgBjPeic2eXnfkR3SMW9w==
X-Received: by 2002:a05:6a00:a1e:b0:732:22e3:7de6 with SMTP id d2e1a72fcca58-7348be4650cmr6595071b3a.17.1740601512524;
        Wed, 26 Feb 2025 12:25:12 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:12 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 12:25:04 -0800
Subject: [PATCH 2/4] KVM: riscv: selftests: Do not start the counter in the
 overflow handler
MIME-Version: 1.0
Message-Id: <20250226-kvm_pmu_improve-v1-2-74c058c2bf6d@rivosinc.com>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
In-Reply-To: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122513_472451_72EDD107 
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

There is no need to start the counter in the overflow handler as we
intend to trigger precise number of LCOFI interrupts through these
tests. The overflow irq handler has already stopped the counter. As
a result, the stop call from the test function may return already
supported error which is fine as well.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index f45c0ecc902d..284bc80193bd 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -118,8 +118,8 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter, 1, stop_flags,
 			0, 0, 0);
-	__GUEST_ASSERT(ret.error == 0, "Unable to stop counter %ld error %ld\n",
-			       counter, ret.error);
+	__GUEST_ASSERT(ret.error == 0 || ret.error == SBI_ERR_ALREADY_STOPPED,
+		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
 }
 
 static void guest_illegal_exception_handler(struct ex_regs *regs)
@@ -137,7 +137,6 @@ static void guest_irq_handler(struct ex_regs *regs)
 	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
 	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
 	unsigned long overflown_mask;
-	unsigned long counter_val = 0;
 
 	/* Validate that we are in the correct irq handler */
 	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
@@ -151,10 +150,6 @@ static void guest_irq_handler(struct ex_regs *regs)
 	GUEST_ASSERT(overflown_mask & 0x01);
 
 	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
-
-	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
-	/* Now start the counter to mimick the real driver behavior */
-	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
 }
 
 static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
