Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2B2CA0EFF
	for <kvm-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/t+3c+T/guPxPkkAdT6zjFwurcElfRbMXotHVcf+F2Y=; b=lfoTxcuyx+R7NU
	+5rMcS6sLIZ1bNdhuu4y5vLVTv9c6517EulbRx0mZcWV3FoLCzlUXIiQJMQQ7ODfDlemlecKadajm
	tmJtZ3+uhxN9tQIVYbaeCRNx+utOQ0c53wOFT1ossGgp0yLq49AQq/3ERY0oIj40HKGn9RIpuCbMb
	nz1payhrmQ1DExtrxwaba8jTr8mc8dA66PoA1wPPVLHQc5QtaFfzm8Qz+SYg2aM/cnBrllSWTjzK9
	HxwV3Lu9dtgldS8iM8v4jg0qSydhcA0GqpQjVnVcxLy8KP7CFHzWF8xt4bj9qe9QxYroU7Lqm+vG+
	PxeWcsLTmNutMMKvHJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQBB-0000000HJaC-3bme;
	Thu, 28 Aug 2025 00:07:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5i-0000000HI8g-2GsM
	for kvm-riscv@bombadil.infradead.org;
	Thu, 28 Aug 2025 00:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kCYLCx+qR2vxxpcmuDTRXW8z6xS3j6g2rCWoMpSsv0A=; b=Ty1VfrdU8egIG/83BbD6eMYmZm
	kPatndu6M1dKvY+eRMQeIwD5bbN6ZiiFtu4s5Py3ULSeehGUbh/JIY3GM5S4DB4hQ4GMcf7Zlitdf
	kxA7q8XwzlnvkbEowYKTKOi2kjL7UU4/KDGhtiLAvpvqK4khG6sujCk6rFPwAL0CB44P90PqvuT7E
	5HJt50YzUajZDP7M9J6xhhKxvIbqze6DAdSYBa2pUW1oW2k7SmAORaKIB3wznm85FE0Zq7zi95aAG
	zqD8wD+indOGPe07UFQ9QpByRmP7O3WIG7HliwRxwHOu+YSDGtmTXe54m8XvWmZl+a+IkH3gkP7w+
	NMwEhAng==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5e-00000002YCG-0TT1
	for kvm-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:08 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7720cb56ee3so696705b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 27 Aug 2025 17:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339324; x=1756944124; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kCYLCx+qR2vxxpcmuDTRXW8z6xS3j6g2rCWoMpSsv0A=;
        b=ALoekYLQ1zSsBbsCI4X2sHy1pxVXOxETIXIFFhpioQKvYDvmCFzDmN8lPG+1zBwhNl
         6Lu7ieDajY3gwO08lwFL/ilN7PCIYND7dZjYCCyoA5AR2VOOScFg25yKyDQyES4aM8Po
         7lurfp/8QmcSkqSTD6Qz/Xyj8lVfk3FIlrb5hSMwpwAVA5LsAWPb2peytaVbPJA6wHu4
         UW2aDSyeUiNPygKQmQzBGbOmJAUU9xHzRI1VwniVMShwUyRG5vmUxalz1CVLIPASmxio
         w1XqItkhN9fDQIaoOQs/XpQUkNuQY3W411kxplqFHFleBfiKCIs7ZzazExzGe+2Qfpzc
         cqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339324; x=1756944124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCYLCx+qR2vxxpcmuDTRXW8z6xS3j6g2rCWoMpSsv0A=;
        b=oSTi6AA2IDWGT8IGvWZqyg5oQaQnG29l8HGhlOzA7meCv6YKeB3al0J2IUhbBZkYes
         CJ/+I+Clf3scmJhuCE8Yb0HqR8oePghEmEfH7uwms1/NUSu/xzClzjYQ9MoLh7QwRYXF
         /G8dVU+RJm8K2xqhSMyp/2/7I6Wmz38tzgyi3GAC6v4EP79QglN0dMrsPSXMBIAg0Qut
         cBT1PJqmYURBAiGz7pf/XF8x7DSCPXJ2nQZdyzBMUO7PMvEyOwEqdb9NLPIRlx3YR+gV
         Rvim/Kxo+RPXVPh2UwYNnRAS1IlTCpNjnzLZM6/x4BADtCaSU5w/xVY/NRCnxy8W7xDM
         4zpg==
X-Forwarded-Encrypted: i=1; AJvYcCUXuJIg9ZnUxxdj/dQ49AKXQ2NmPOBGIOuhFwjwyAh0CJ4nxIvWxeO14gv65eZ5FqiuM8UpFKk2lm8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDQDb/gmp/AsAD6oROcS5qd6RpnC3HVybj0+jPlPVx/G8CuDKh
	bRumvO6WeJFbarTiM7ZhGkCSca1Eo16kiFiwqaOQokuIRCEu+5qQwlJhLk72WBi8CDKYoabZdCN
	Jer22LA==
X-Google-Smtp-Source: AGHT+IHDUlpPfgfETOO31fD//wXWMymV5Mnw/Y+lifpogBKPY1IBHbcv76HZ+xFt3eQXYgFR8TyJX2ZK1/M=
X-Received: from pfgs8.prod.google.com ([2002:a05:6a00:1788:b0:771:f315:17c4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a85:b0:76b:d8f7:d30b
 with SMTP id d2e1a72fcca58-7702f9f4896mr22345026b3a.10.1756339323354; Wed, 27
 Aug 2025 17:02:03 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:50 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-2-seanjc@google.com>
Subject: [PATCH v2 1/7] Drivers: hv: Handle NEED_RESCHED_LAZY before
 transferring to guest
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010206_277270_E5A71A82 
X-CRM114-Status: GOOD (  13.55  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Check for NEED_RESCHED_LAZY, not just NEED_RESCHED, prior to transferring
control to a guest.  Failure to check for lazy resched can unnecessarily
delay rescheduling until the next tick when using a lazy preemption model.

Note, ideally both the checking and processing of TIF bits would be handled
in common code, to avoid having to keep three separate paths synchronized,
but defer such cleanups to the future to keep the fix as standalone as
possible.

Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: Mukesh R <mrathor@linux.microsoft.com>
Fixes: 621191d709b1 ("Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs")
Fixes: 64503b4f4468 ("Drivers: hv: Introduce mshv_vtl driver")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_common.c    | 2 +-
 drivers/hv/mshv_root_main.c | 3 ++-
 drivers/hv/mshv_vtl_main.c  | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index 6f227a8a5af7..eb3df3e296bb 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -151,7 +151,7 @@ int mshv_do_pre_guest_mode_work(ulong th_flags)
 	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		return -EINTR;
 
-	if (th_flags & _TIF_NEED_RESCHED)
+	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
 		schedule();
 
 	if (th_flags & _TIF_NOTIFY_RESUME)
diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 932932cb91ea..0d849f09160a 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -484,7 +484,8 @@ mshv_vp_wait_for_hv_kick(struct mshv_vp *vp)
 static int mshv_pre_guest_mode_work(struct mshv_vp *vp)
 {
 	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
-				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
+				 _TIF_NEED_RESCHED  | _TIF_NEED_RESCHED_LAZY |
+				 _TIF_NOTIFY_RESUME;
 	ulong th_flags;
 
 	th_flags = read_thread_flags();
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index dc6594ae03ad..12f5e77b7095 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -728,7 +728,8 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 	preempt_disable();
 	for (;;) {
 		const unsigned long VTL0_WORK = _TIF_SIGPENDING | _TIF_NEED_RESCHED |
-						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL;
+						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL |
+						_TIF_NEED_RESCHED_LAZY;
 		unsigned long ti_work;
 		u32 cancel;
 		unsigned long irq_flags;
-- 
2.51.0.268.g9569e192d0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
