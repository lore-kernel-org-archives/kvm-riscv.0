Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DA2D3ABC6
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yQY0Gwy3mDnBBJ6Aw1cda+8TQDb3kc8WNPEojsZsRc=; b=qCQICk43qBOx7V
	Pf1C2QoOM2Q4YTdULgVtk2gJcf9s1zdKX12Vpbl0wj2r4Bbo3ON3oGgaIGlJFu9HrVNFudSNspvIA
	wVEO391oLuxp2z30r7+cVapbeu9XfDDzma8G8VagCQnItyOuNHw4B0dpL4PP9OP6x+22RlpzU6gM1
	J7cgLSXnqgq97PJBGNG23tYunE03LPtXLPoS/NocOfOerFjFaLLcS5nm63PtI/FTBvSsRIlRNZEYa
	8O71V2DfDcskvxqt1kVquAcf5Wd5Q7A97ya2t4XmcmoUfIew2xqVKLpzrmXlSmRoBElrFecLsNV+G
	cj3jeU4ZSW3KZ3ROI3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0b-0000000AG31-0zpX;
	Sat, 06 Dec 2025 00:18:45 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzr-0000000AEnm-0JnA
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:00 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-295915934bfso36998595ad.0
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980276; x=1765585076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RvT5QOLTrPlZDM6KRmJviB3G20BHxxiuQcblXVA4XhQ=;
        b=QJcWQDW5zDjx31P8Wd4OtSK5KUCV++7V+pbQFtDDR9iHTuZ7QZ3Wr8h8Tf236N8cSn
         SbIK6HrWNwkpa+TFGr/jdrC41Nr4X+IiMpYMW74MFLnr24XRYXP8ybvyYwXkAUPWmzS4
         HVZvcR0awdQW+UMH9KdhT8nc+6mIhIGC/xRHoOGi3CQR0iF575SuaCQ5QiyQp5/m6oPE
         86aZ/EGalhYOcvkbS4SSNGfbIgTwo88F84ldgSTe6Bcy6qvrRpLNPPn9o03ACCfkhwi4
         3nNgh+sm73FnOKU+BpUHPoIgTDyp70URJOi0Iw5IwbPKDWtzbm3papYdZJ+kRvbjtcgt
         XzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980276; x=1765585076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvT5QOLTrPlZDM6KRmJviB3G20BHxxiuQcblXVA4XhQ=;
        b=w7ulA0RTpQd2dSFfmjC76b4zfycHAXt0UtccZtWgvBeepYRMRAQGwE48PLyFVlM//x
         0dsh8V6+mkXaPHQ7Omf7lF4q6UyrtjZ7jXxImpMrHany3w5VuOa3VRrWpsfSe32J/kRA
         W43z08ZM8G9r9TpAdn3jYpEp+ZjaTKat82OXHK64fpaxxBd5zrknQBXeJBey9up5SGPA
         Avg28a60VNBW+U9Td/Jh9kPFDgorqdWlAIS0l7Js3v/dM0KDgc9PBVEs0TersQaC8UoV
         NFaNTkaHnE4Tp7I7ZQckuL22ZCNWVOy4fM7iWrlPDgLfWACbog2VA+ZrwMQjSWQa9JCQ
         pWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1FFNBnyDKM+d1BL5/j5yi2IgBc1nBswZQtQJ6BJ/6O/DkIUctwcWKo6RipZZ4zR2MT62FCuYiktA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGea5cSp3Nsn6wiXj3TS9da9DcdJckYP+X9wLRDiTgQ48yViO1
	bNw3EYdTLvsC5oTQp46bxXCW8T4440Xp7Sbx9dJKoD8KBJ57VhLGboRsRPNKfCkGtQjQKlFeKbh
	tobIXmA==
X-Google-Smtp-Source: AGHT+IGYBlCmb/gXYXB/w+eLYeN/6lSsoZJHvJE9tm9YKGnjFm45dzt4nCYHuTcqC75ktumYKLC92IIPc9g=
X-Received: from plbko16.prod.google.com ([2002:a17:903:7d0:b0:29d:5afa:2c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d488:b0:295:5668:2f2e
 with SMTP id d9443c01a7336-29df880d025mr4171385ad.37.1764980276326; Fri, 05
 Dec 2025 16:17:56 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:51 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-16-seanjc@google.com>
Subject: [PATCH v6 15/44] KVM: x86/pmu: Snapshot host (i.e. perf's) reported
 PMU capabilities
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161759_209966_690C432D 
X-CRM114-Status: UNSURE (   8.62  )
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

Take a snapshot of the unadulterated PMU capabilities provided by perf so
that KVM can compare guest vPMU capabilities against hardware capabilities
when determining whether or not to intercept PMU MSRs (and RDPMC).

Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 487ad19a236e..7c219305b61d 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -108,6 +108,8 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 	bool is_intel = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
 	int min_nr_gp_ctrs = pmu_ops->MIN_NR_GP_COUNTERS;
 
+	perf_get_x86_pmu_capability(&kvm_host_pmu);
+
 	/*
 	 * Hybrid PMUs don't play nice with virtualization without careful
 	 * configuration by userspace, and KVM's APIs for reporting supported
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
