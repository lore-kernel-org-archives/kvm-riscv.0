Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705E3C282D4
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gL2EmMGPkf3320mfU4z2+/dhPoBOar4NATJw3PNjZNI=; b=TCcDjUet5WS+XO
	uaQnoU5hb9ZLzU1Xn3tKVGaznOW5ZPD9nrp9Ha2AfTenEKo+P1K0nvUIv6L5PCbkZ6tVoqie0Ir/P
	s37D5KPyPjxdl0mYq/jGxrZhVIgPgrjS9TQclhCfoy6Ig/Tc6HOYqD0GhybH82L82GjBilrWPnWse
	ohl3t2IdHgGhkwYUcGcHczQRiM4R3zywlxJMrjsMd5FdBa50ZyX9zhwOxjk0eM0buWzTUjrgr1khC
	xV+/pzxj/LTfwx+oIRDx/6rC7O5Pb4BZsAadTeAUkkdDV/A5Nht5bnXLO6uZ7KfyQYrjXBUUSt0Vo
	GXg68X8U8EHWBWn4Ae0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEf1-00000002W2d-0ij2;
	Mon, 03 Mar 2025 22:53:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEex-00000002Vx4-2KVc
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2235c5818a3so58348285ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042394; x=1741647194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5xoxucipI3r87CV5kbgeUb/z0QLUAJbC0b2XlScuLU=;
        b=x4m2p6eWFylsRwtv2AF0PxoKI2IIfPsEW4aOD//bRVPmGpt6Bq5Nxj9ZdgZHS5UW6n
         orCbku9DWOs+qVhGD5viAAIH/6SWIICc+4pZx5882J2+4guj3k2nbnqpOj1wDj9gdVLo
         KYi2PzmSjhDUgTLw0SxBeTnSXIETDfLhdqzliWrquqf7zZwitp+KO4vmESq2OB3v08bb
         lRlG+NTFLL4WArUCYjLh0G3s1r/E3dSBsbW4lHkv3fBQlNEbJ1qU7GDAWBv6gbxvDP9e
         u3xZMiIgXBmZWsgy7p9Jr1ulZpkioB+vxwdGjfDrOduGbouphbwV+T91sjjIcA1pwquJ
         AzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042394; x=1741647194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5xoxucipI3r87CV5kbgeUb/z0QLUAJbC0b2XlScuLU=;
        b=UvUAYTbX1H7z9riYwsklieWIOXZyzfGvX+em+BikLWfgaI2eTNOrRCV4EY/IM5TGjr
         LocgvFHCLp85rMsEo7WU6Dfj1mQ8Ee96X4zg6G0TGAm6fcXIG//dDNYd9cQk+zQFd0qE
         JpEEhDy/0Nf7h2cE3eFcY27Zcxov83AQw5vLMcqzuHFQM2Y854ProZUApSxk+uDY1x9A
         Zk5Yiw5R9PVRUkxBH+0gbEUH/yv3e84yBiGc4NiblItq6Z0FDTgeh691KDpBqxORFTKC
         P2niEjt2UzdGl2CqppTHkeZ9JZGb+375mG39ObnJuF7fwHNod9MWWyxGqV43/D3rLRkh
         OI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV28Hf7LgcLYkI/KoqrvvkdK8pNGNUrcApdOv/q+lF+7M3tNar1UGo0LZJ3aGd34oUbuoxctMCdGe0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyblAWSXNiRPiWs5+6hf8E2Px/Bp9DrU0mHfExqs8a+j0rUDfRX
	tSjASTqx7Hxiv02wY4FErR7r9SpLrPJiNXxy1IuoRTfZOyzlbE/QG0YPjngjo57nhzu9nYeHpKr
	Z
X-Gm-Gg: ASbGncvGQiuc6zk4qU9ZaTfuFDIlWrq16L6CMwu93M0BJRcUeMkuLQhkbl9bgLX8OXp
	BiesAghg0V51gvvFn8OJZTYeGtOeZ9p7WBk2Ku+Kb1VypyMn1Il6TNTyhdSsi2lFi9MIRZUia9m
	8Hj3FJz9QqDjqJ1FaCl4rwRQXVbPb4C2nL47p2dZtwB6FvllmtZXx6fc8PQXF6YTz4zWspLdHFx
	MllDEiziPwkKOEgMhf3GQvJ4Z/JsqVQ35lB5b4byGN7/IQv0zI5W0E4PXLBbsn0A66KLnATkIs4
	lgZ9CcRvoHAWYizwsUGDhXM2L4D1N6W2vLZAGKUrMJeiZrPsMGU5xeF/iQ==
X-Google-Smtp-Source: AGHT+IGy8hMH+W8RZy5SJOGyzi1MeiJvJku2zV+j7M0txVehkixRDHS/MmEvMDbU3gziq5b3wIbZEQ==
X-Received: by 2002:a17:903:230c:b0:21f:78f:c178 with SMTP id d9443c01a7336-22368fa5425mr202955235ad.3.1741042394242;
        Mon, 03 Mar 2025 14:53:14 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 03 Mar 2025 14:53:07 -0800
Subject: [PATCH v2 2/4] KVM: riscv: selftests: Do not start the counter in
 the overflow handler
MIME-Version: 1.0
Message-Id: <20250303-kvm_pmu_improve-v2-2-41d177e45929@rivosinc.com>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145315_586356_487B0B61 
X-CRM114-Status: GOOD (  10.31  )
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
stopped error which is fine as well.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
