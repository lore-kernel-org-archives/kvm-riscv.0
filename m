Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF3FC617E
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Jg+p2CMRDrJEutCMfIaTzWzcWDYbB07WyWpxWOnQpQ=; b=Sxa3IHd1/m/3vn
	qThanTm0alvBmXnWt+vnS+IHb3QcQz+feSqqzOaHpaVyBS9TM4au1GeeKOQ7vR1pz0ofV3M6qrIAk
	1Xv9RhB5tK1234xDrchaOihRciq88/d0URvf0wrt4d7LymZ2Dz6ZjckJBtP12FT/4QH+EcAUlA9H6
	3cFoNuVq0QTjr1ODs76MrH/movm3ODAjlYtg+7wEx4sQ5Yu32nmeYvAQniKRmhv98iNTuIH9+NCnN
	BSJhXEq8/BWzmZ4S2kqHf5S6sB1qBeuVprdpcBmLXj8wD7pPaH7+kJ0aBWl1JNvjLkkNjHJ/Qqvmk
	oZe8NdeS6cEw2yk+wnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UZ-00000009QvC-2hcX;
	Sat, 03 Jan 2026 15:24:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UU-00000009Qsd-0aIL
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:24:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0eaf55d58so3486235ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767453869; x=1768058669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rY+1CqHRW6wgOOvSa/xPbABDm4UWS4wzkJXrx4Ok40o=;
        b=Yr40yFkImq7Hyp0IIt7P6CoUIw2MDMrgImK25kxoDIC2xd4gTtduq5gmswCst/kczp
         l7AY7nRpGC91Kt8k5YtwOswnfyJ+guhKgQzPKP996HghrU/qT/He4NBX6Qh6L1ph5u2x
         xtUREKg7vhwgRFNS4EhuxmK0bNQBh8ZvXOD/u2zIbuZgMSwWXznwrxG9TdJK7fOvyyTs
         pvAogTLHgpl22SkmYM42oGEGsOVJ0Buc87JzDxIPD+4hqqOP7DIzlSzRQvbSL3Gmjr3O
         eQe5PLS6kMjBrysZAcwJxe76daGWVVx2ckgRR0GzBDFJGt9ag01uAOWYapCz154Nb9WX
         lhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767453869; x=1768058669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rY+1CqHRW6wgOOvSa/xPbABDm4UWS4wzkJXrx4Ok40o=;
        b=OsA095cSFeFiD3/msyCW6aNaK/RMAgl9WkwaYLYMfCBkYA+WSui0mgt8CiEeHhBQnI
         vr8WVsd6acCLUENBJbvO1YmqfBpiWSdxQa7MhwRyG/nAtTjfFQC1kiyw4WShcCxLvZuo
         Xyhs62Cw+ZqbdHzmIlCuxdjWVxk0fB8XRjqT1+VsukUQKOLJuMIotX6SjpakJ57+EDak
         6/qm0AzwZ+EMwPNku5WJchyoMyrw8g289APTDz+4yuRCqlP8aHS/sl+alf76IOP+J38t
         reBxG2yCI8+mMcmllw1V7KyQAVq9Gn2n3pbNyEyWGphE6uu6bvjk8O7Df6BF2ujdoE82
         OstQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm83OaDu2IGt5C53LPY7UDSBAKf5nxSgoq+2jNOBATBODbTEKB9RV1bPXB5qCaeycrUIWCHmdUQyY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7hBMHFzjd9nc/rrzY2gUP7Fv5r7s2E7wskmkA8Y4/X47K1ybU
	RtrUdN0DxKe5S/rTmy1W9rb4xMM9At84MzHm+l2zAwMShHNmMgceJwom
X-Gm-Gg: AY/fxX7H/rQAdUQY/j0Jf6bo02RPF/jdU5jT5z1voPlso+1o0LGysTS5dExyq+xUdoV
	yEB4LO0UaF8dHAiz8uv6feqMQdAhJ+zp6L6m/8jeFTYgJEGXrfb8vgOuI3SNp8l8YNJFsBDn8do
	6GbiIh6fddlqhvYG4WkCUKpHV/oKY8KyIqGPnulga7HcUkd5LRE4VI7vpiuhUlB6ew3VWnKYzcz
	uW6pZUQaXHGB68oc6SZbqd8KXdk+GSEWRb+RfQZMLthOtZ6JV1pXulaR+oJooOmJOpaK/4N36wh
	lzWmuyAfLngv8sT2myvRl2OfciMMSCq3A+7ahAEcKfEpHfN0wn3jEEj+9/S58h3zCvIdUW0G/3Y
	5rqvYAiYnqwOKyCAlbyeOE8BBnvs/KTPd9TPs+atSHwGfD87eBq53hUYb8yXdxXk+355vdr/mv7
	UT2MVn7pGVbgxe9o8o2h7h6ob6681r5iPebI5BoJDiipbM1PMMwSuLMDFcnZ0IuGqxm3mMUTn37
	CU=
X-Google-Smtp-Source: AGHT+IHlp9HPsn8fm7xK5iwgx3KOKWhA+7VN2RCvm7LTYT1W4zfwOzZOihBwzvrzDg7BywoDL8XQrw==
X-Received: by 2002:a17:90b:3c8b:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-34f4537da08mr1903713a91.5.1767453869180;
        Sat, 03 Jan 2026 07:24:29 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm2107802a91.12.2026.01.03.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 07:24:28 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v2 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 00:23:58 +0900
Message-Id: <20260103152400.552-2-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103152400.552-1-naohiko.shimizu@gmail.com>
References: <20260103152400.552-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072430_178509_4A3C3A98 
X-CRM114-Status: GOOD (  10.45  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>

riscv: fix timer register update hazard on RV32

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.
---
 drivers/clocksource/timer-riscv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4d7cf338824a..cfc4d83c42c0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -50,8 +50,9 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 #else
 		csr_write(CSR_STIMECMP, next_tval);
 #endif
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
