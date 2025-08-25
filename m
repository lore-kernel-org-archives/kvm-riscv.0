Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E93CA0FE7
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dxwt98Oi8Kc7pONZHoQaKs80ch9V5dNDEN8iB7O5Ve4=; b=D6lieYK4gfTtpI
	zXgicXL8yGfeoqC3hgrS5FhUEN0jtFraPwoTP6Xsd24mMsF3P8KWIGc55ynwM8mEjeIlSyPxf/8ZW
	gYvP5h3qJY7UmosGP8uqjbcf/mkgseOVugURWoxLJL4tln92Poi5oVtL7+A6YU2la80AlaUM3DS1H
	oodqblBZOJgHCJE7FyxVJO2EcDQBk1+pNjZvdmm5mDTtUauA2NW128n0WM4pVcbga8c71prKvYYE7
	xovL+D6UDcIckynOHM1ahFQji21A2i3cPkXk6kfIzo+mNgKn23rba1ae68t693DgvyCsvfXKZL7ue
	RnvMop7NxCAl+CfXr85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdTZ-00000009VCB-07Tn;
	Mon, 25 Aug 2025 20:07:33 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSU-00000009Ulg-3Z6t
	for kvm-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:27 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32515a033a6so3304018a91.2
        for <kvm-riscv@lists.infradead.org>; Mon, 25 Aug 2025 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152385; x=1756757185; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pR7rIORhhha7uQoj/L4UbVHOw9HCPKdRxBVZAbw60c=;
        b=QtAciMiajsWy7QN0C/UY5PvpBCwaGsuHXpHkZL36Ly+i+wA5rBRKWaaGYfT//aQTWa
         CoTXLU7CrzQ7BtVefV5RX2HBYmNiY8jpQ0miVa2wgtDapL560Eq9+2t8tTtiBcuj+y9M
         V+kPk7YO81QTJYt+7sncPDeTvsEoYGByIt5F/s0DJwVnBqItFHHPHOon6x4g8yXlCPay
         7yQ7OhMGhshpIT4meVguCXG/dyYB6P8JNDOcdu7AI+7ZladDsfDV8XlyPeeU9jf+9t/F
         rp6k6yQGX5Bd44Wf8NEY6AQ8rJqnrb5OytuhXbHMRyoCETICM80xGiRZY7k3dWX23Jft
         mErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152385; x=1756757185;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8pR7rIORhhha7uQoj/L4UbVHOw9HCPKdRxBVZAbw60c=;
        b=uznMJiPPbpwO01o9CeGfqpDw5C1Ndq8D52NvNVBVfW4IbZM3dKkEH/R0Rilr4lPERx
         hr6NuLBVVUVBbFvzA4mZOHtyfr9gtd1HFm6tul9GOXNFK9FuxZFqpqGP1019kTgidVX2
         gpQoVvvhz5myuqnmN0B3uI1sn8t8VKKrmMsuFmM5wfmpNSO+k2fGEJNvdsPZY0XGXbX1
         J78cl3euDtfCa4Cgcyp/xceK3F6F4yI3Ychc5uW+EQtKbSoh7gtfxyvqgWXzfknsjAAo
         0LPoH40I42fNGzACxeDbhhVKhB7aMEfSUWTmDlRWUlTZ3SCJOcUCptgKGFkbwiyWO71U
         mXOg==
X-Forwarded-Encrypted: i=1; AJvYcCWHPAhQrvzTAZowWmBHenxuBWC72DHuRvkEE9iYfXmiPR/JJ1RYd3JoGuwj99aeJWA1BzAAe+tKBTM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFc1uZOM+HGNqDMjr50FAOJcnmG7dDj574k2mhwlWaYugF3jIf
	yl1klSU6PVYiqP3jevjIHzUCDVwBVig6g8vHV4xSN/HMrWoGIIGxK6G/RqmteqMzVkFIAUP0YKV
	njo7CgQ==
X-Google-Smtp-Source: AGHT+IEXEoKFvYTs3DYHIb6MyIfVoxfIwlslpUf6Y9Z1lNFDWyuIZVc83JO2uwlvd4IbE+BY+ZPFpeZDEbc=
X-Received: from pjkk5.prod.google.com ([2002:a17:90b:57e5:b0:325:9fa7:5d07])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ccd:b0:324:eac4:2968
 with SMTP id 98e67ed59e1d1-32515ee13cdmr17210596a91.33.1756152385445; Mon, 25
 Aug 2025 13:06:25 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:17 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-1-seanjc@google.com>
Subject: [PATCH 0/5] Drivers: hv: Fix NEED_RESCHED_LAZY and use common APIs
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
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_130626_888190_05620329 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
more generic "virt" APIs (which ideally would have been done when MSHV root
support was added).

Assuming all is well, maybe this could go through the tip tree?

The Hyper-V stuff and non-x86 architectures are compile-tested only.

Sean Christopherson (5):
  Drivers: hv: Move TIF pre-guest work handling fully into mshv_common.c
  Drivers: hv: Handle NEED_RESCHED_LAZY before transferring to guest
  entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM
    proper
  entry: Rename "kvm" entry code assets to "virt" to genericize APIs
  Drivers: hv: Use common "entry virt" APIs to do work before running
    guest

 MAINTAINERS                                 |  2 +-
 arch/arm64/kvm/Kconfig                      |  2 +-
 arch/arm64/kvm/arm.c                        |  3 +-
 arch/loongarch/kvm/Kconfig                  |  2 +-
 arch/loongarch/kvm/vcpu.c                   |  3 +-
 arch/riscv/kvm/Kconfig                      |  2 +-
 arch/riscv/kvm/vcpu.c                       |  3 +-
 arch/x86/kvm/Kconfig                        |  2 +-
 arch/x86/kvm/vmx/vmx.c                      |  1 -
 arch/x86/kvm/x86.c                          |  3 +-
 drivers/hv/Kconfig                          |  1 +
 drivers/hv/mshv.h                           |  2 --
 drivers/hv/mshv_common.c                    | 22 ---------------
 drivers/hv/mshv_root_main.c                 | 31 ++++-----------------
 include/linux/{entry-kvm.h => entry-virt.h} | 19 +++++--------
 include/linux/kvm_host.h                    | 17 +++++++++--
 include/linux/rcupdate.h                    |  2 +-
 kernel/entry/Makefile                       |  2 +-
 kernel/entry/{kvm.c => virt.c}              | 15 ++++------
 kernel/rcu/tree.c                           |  6 ++--
 virt/kvm/Kconfig                            |  2 +-
 21 files changed, 49 insertions(+), 93 deletions(-)
 rename include/linux/{entry-kvm.h => entry-virt.h} (83%)
 rename kernel/entry/{kvm.c => virt.c} (66%)


base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
-- 
2.51.0.261.g7ce5a0a67e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
